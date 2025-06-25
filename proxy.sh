# Cập nhật hệ thống
echo "[1/7] ➤ Đang cập nhật hệ thống..."
sudo apt update && sudo apt upgrade -y

# Cài gói cần thiết
echo "[2/7] ➤ Đang cài Squid + Apache2-utils..."
sudo apt install -y squid apache2-utils vim curl

# Hỏi port proxy
read -rp "[3/7] ➤ Nhập cổng proxy bạn muốn dùng (ví dụ 6969): " proxy_port

# Gỡ file cấu hình cũ (nếu có)
echo "[4/7] ➤ Gỡ cấu hình cũ của Squid..."
sudo rm -f /etc/squid/squid.conf

# Tạo cấu hình mới
echo "[5/7] ➤ Tạo file cấu hình mới cho Squid..."
cat <<EOF | sudo tee /etc/squid/squid.conf > /dev/null
auth_param basic program /usr/lib/squid/basic_ncsa_auth /etc/squid/passwords
auth_param basic realm proxy
acl authenticated proxy_auth REQUIRED
http_access allow authenticated
http_port $proxy_port
EOF

# Tạo tài khoản proxy
read -rp "[6/7] ➤ Nhập tên người dùng proxy muốn tạo: " squid_user
echo "[6/7] ➤ Nhập mật khẩu cho '$squid_user':"
sudo htpasswd -c /etc/squid/passwords "$squid_user"

# Khởi động lại Squid
echo "[7/7] ➤ Khởi động lại dịch vụ Squid..."
sudo systemctl restart squid

# In thông tin
ip_address=$(curl -s ipinfo.io/ip)
echo "✅ Cài đặt thành công!"
echo "🌐 Proxy: http://$squid_user:<your_password>@$ip_address:$proxy_port"
