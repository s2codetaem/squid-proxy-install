#!/bin/bash
# Script cài đặt Squid Proxy hoàn toàn tự động

set -e

echo "==============================="
echo "🚀 Cài đặt Squid Proxy có xác thực người dùng"
echo "==============================="

# Cập nhật hệ thống
echo "[1/8] ➤ Cập nhật hệ thống..."
sudo apt update -y && sudo apt upgrade -y

# Cài các gói cần thiết
echo "[2/8] ➤ Cài đặt Squid, Apache2-utils, Vim..."
sudo apt install -y squid apache2-utils vim curl

# Hỏi người dùng nhập PORT mong muốn
read -rp "[3/8] ➤ Nhập cổng bạn muốn dùng cho proxy (ví dụ: 6969): " proxy_port

# Xóa file cấu hình cũ nếu có
echo "[4/8] ➤ Gỡ cấu hình Squid mặc định..."
sudo rm -f /etc/squid/squid.conf

# Tạo file cấu hình mới dùng biến PORT
echo "[5/8] ➤ Tạo file cấu hình mới..."
cat <<EOF | sudo tee /etc/squid/squid.conf > /dev/null
auth_param basic program /usr/lib/squid/basic_ncsa_auth /etc/squid/passwords
auth_param basic realm proxy
acl authenticated proxy_auth REQUIRED
http_access allow authenticated
http_port $proxy_port
EOF

# Nhập tài khoản người dùng
read -rp "[6/8] ➤ Nhập tên người dùng proxy: " username

# Tạo user proxy (tự động hỏi mật khẩu)
echo "[7/8] ➤ Nhập mật khẩu cho người dùng '$username'"
sudo htpasswd -c /etc/squid/passwords "$username"

# Khởi động lại dịch vụ
echo "[8/8] ➤ Khởi động lại Squid..."
sudo systemctl restart squid

# In IP
echo "======================================="
echo "✅ Đã cài xong Squid Proxy trên port $proxy_port"
echo "🌐 IP máy chủ: $(curl -s ipinfo.io/ip)"
echo "👤 Tài khoản: $username"
echo "📦 Proxy URL: http://$username:<your_password>@<server_ip>:$proxy_port"
echo "======================================="
