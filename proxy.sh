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

# Kiểm tra quyền root
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}❌ Script này cần chạy với quyền root. Vui lòng sử dụng sudo hoặc tài khoản root.${NC}"
    exit 1
fi

# Kiểm tra hệ điều hành
if ! command -v apt >/dev/null 2>&1; then
    echo -e "${RED}❌ Script này chỉ hỗ trợ hệ điều hành dựa trên Debian/Ubuntu.${NC}"
    exit 1
fi

# Hiển thị logo và thông tin
echo -e "${CYAN}╔═══════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║${WHITE}                                                       ${CYAN}║${NC}"
echo -e "${CYAN}║${RED}   ███ ${YELLOW}███ ${GREEN}███ ${BLUE}███ ${PURPLE}███ ${WHITE}███ ${CYAN}███ ${RED}███ ${YELLOW}███     ${CYAN}║${NC}"
echo -e "${CYAN}║${RED}   █   ${YELLOW}█   ${GREEN}█ █ ${BLUE}█ █ ${PURPLE}█   ${WHITE}█   ${CYAN}█   ${RED}█   ${YELLOW}█       ${CYAN}║${NC}"
echo -e "${CYAN}║${RED}   ███ ${YELLOW}███ ${GREEN}███ ${BLUE}███ ${PURPLE}███ ${WHITE}███ ${CYAN}█   ${RED}███ ${YELLOW}███     ${CYAN}║${NC}"
echo -e "${CYAN}║${RED}     █ ${YELLOW}  █ ${GREEN}█ █ ${BLUE}█ █ ${PURPLE}█   ${WHITE}  █ ${CYAN}█   ${RED}█   ${YELLOW}█       ${CYAN}║${NC}"
echo -e "${CYAN}║${RED}   ███ ${YELLOW}███ ${GREEN}█ █ ${BLUE}███ ${PURPLE}███ ${WHITE}███ ${CYAN}███ ${RED}███ ${YELLOW}███     ${CYAN}║${NC}"
echo -e "${CYAN}║${WHITE}                                                       ${CYAN}║${NC}"
echo -e "${CYAN}║${WHITE}          ⚡ ${YELLOW}S2CODETAEM ${RED}★ ${BLUE}HTTP PROXY INSTALLER ${WHITE}⚡         ${CYAN}║${NC}"
echo -e "${CYAN}║${WHITE}    ${GREEN}🚀 Developed by TẠ NGỌC LONG - Premium Solutions 🚀    ${CYAN}║${NC}"
echo -e "${CYAN}║${WHITE}                                                       ${CYAN}║${NC}"
echo -e "${CYAN}╚═══════════════════════════════════════════════════════╝${NC}"
echo ""

# Thông tin liên hệ
echo -e "${BLUE}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║${WHITE} 📞 LIÊN HỆ: ${CYAN}FB: s2code08122000 ${WHITE}│ ${CYAN}TG: @S2codetaem48 ${WHITE}│ ${CYAN}Services: Cloud/MMO/Tools${BLUE}║${NC}"
echo -e "${BLUE}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Hướng dẫn sử dụng
echo -e "${YELLOW}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${YELLOW}║${WHITE} ⚠️  QUAN TRỌNG: ${RED}Mở port 6969 ${WHITE}trước khi chạy script │ ${GREEN}Proxy: tangoclong:2000${YELLOW}║${NC}"
echo -e "${YELLOW}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Kiểm tra port 6969
if ! netstat -tuln | grep -q ":6969 "; then
    echo -e "${RED}❌ Port 6969 chưa được mở. Vui lòng mở port trước khi tiếp tục.${NC}"
    exit 1
fi

# Xác nhận đã đọc hướng dẫn
echo -e "${GREEN}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║${WHITE} Bạn đã mở port 6969 và sẵn sàng cài đặt HTTP proxy? ${YELLOW}[Y/N]${GREEN}║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
echo ""

while true; do
    read -p "➤ Nhập [Y] để tiếp tục hoặc [N] để thoát: " confirm_ready
    case "${confirm_ready,,}" in
        y|yes)
            echo -e "${GREEN}✅ Đang bắt đầu cài đặt HTTP proxy...${NC}"
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

echo -e "${PURPLE}🚀 Bắt đầu cài đặt HTTP Proxy Server...${NC}"
echo ""
sleep 2

# Hàm kiểm tra IP
check_ip_status() {
    local ip=$1
    echo -e "${YELLOW}🔍 Đang kiểm tra trạng thái IP...${NC}"
    if ping -c 3 "$ip" >/dev/null 2>&1; then
        return 0
    else
        echo -e "${RED}❌ Không thể kết nối tới IP $ip${NC}"
        return 1
    fi
}

# Hàm lấy thông tin IP
get_ip_info() {
    local ip=$1
    echo -e "${CYAN}📡 Đang lấy thông tin IP...${NC}"
    ip_info=$(curl -s "http://ip-api.com/json/$ip" || echo "{}")
    if [ -z "$ip_info" ] || [ "$ip_info" = "{}" ]; then
        echo -e "${RED}❌ Không thể lấy thông tin IP${NC}"
        return 1
    fi
    echo "$ip_info"
}

# Hàm kiểm tra tốc độ mạng
check_network_speed() {
    echo -e "${CYAN}⚡ Đang kiểm tra tốc độ mạng...${NC}"
    speed_test=$(curl -s -w "%{speed_download}" -o /dev/null http://speedtest.ftp.otenet.gr/files/test1Mb.db 2>/dev/null || echo "0")
    if [ "$speed_test" = "0" ]; then
        echo "N/A"
        return 1
    fi
    speed_mbps=$(echo "scale=2; $speed_test / 1024 / 1024 * 8" | bc 2>/dev/null || echo "N/A")
    echo "$speed_mbps"
}

# Hàm kiểm tra tên đầy đủ (nghiêm ngặt cho lần đầu)
validate_full_name_strict() {
    local name="$1"
    local word_count=$(echo "$name" | wc -w)
    if [ "$word_count" -lt 2 ]; then
        return 1
    fi
    if [[ ! "$name" =~ ^[A-Za-zÀ-ỹ[:space:]]+$ ]]; then
        return 1
    fi
    case "${name,,}" in
        "test test"|"abc xyz"|"nguyen van a"|"tran thi b"|"le van c"|"admin user"|"user name"|"full name")
            return 1
            ;;
    esac
    return 0
}

# Hàm kiểm tra tên cơ bản
validate_full_name_basic() {
    local name="$1"
    if [ -z "$name" ] || [ ${#name} -lt 2 ]; then
        return 1
    fi
    return 0
}

# Hàm kiểm tra HTTP proxy
check_http_proxy() {
    local ip=$1
    local port=$2
    local user=$3
    local pass=$4
    echo -e "${CYAN}🔧 Đang kiểm tra HTTP proxy...${NC}"
    endpoints=(
        "http://icanhazip.com"
        "http://ifconfig.me/ip"
        "http://checkip.amazonaws.com"
    )
    for endpoint in "${endpoints[@]}"; do
        http_test=$(curl -s -o /dev/null -w "%{http_code}" --proxy "http://$user:$pass@$ip:$port" "$endpoint" --connect-timeout 10 --max-time 15)
        if [ "$http_test" = "200" ]; then
            echo "HTTP Proxy ✅ (tested with $endpoint)"
            return 0
        fi
    done
    echo "HTTP Proxy ❌ (không thể kết nối)"
    return 1
}

# Xác thực tên khách hàng
echo -e "${PURPLE}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${PURPLE}║${WHITE}                              XÁC THỰC THÔNG TIN                              ${PURPLE}║${NC}"
echo -e "${PURPLE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
echo -e "${PURPLE}║${YELLOW} 👤 Vui lòng nhập họ và tên đầy đủ của bạn để tiếp tục                      ${PURPLE}║${NC}"
echo -e "${PURPLE}║${YELLOW} ⚠️  Lưu ý: Tên phải là tên thật (Họ + Tên), không được để trống           ${PURPLE}║${NC}"
echo -e "${PURPLE}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
echo ""

attempt_count=0
while true; do
    attempt_count=$((attempt_count + 1))
    read -p "➤ Nhập họ và tên đầy đủ: " client_full_name
    if [ $attempt_count -eq 1 ]; then
        if validate_full_name_strict "$client_full_name"; then
            echo -e "${GREEN}✅ Tên hợp lệ! Xin chào $client_full_name${NC}"
            break
        else
            echo -e "${RED}❌ Tên không hợp lệ! Vui lòng nhập họ và tên đầy đủ (ít nhất 2 từ, không chứa số hoặc ký tự đặc biệt)${NC}"
            echo -e "${YELLOW}💡 Ví dụ: Nguyễn Văn An, Trần Thị Hoa...${NC}"
            echo ""
        fi
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
echo -e "${PURPLE}🚀 Chào mừng $client_full_name! Đang khởi động HTTP Proxy Installer...${NC}"
echo ""

# Tự động cài đặt HTTP Proxy
echo -e "${GREEN}✅ Xác thực thành công!${NC}"
echo -e "${PURPLE}🚀 Chế độ VIP - Tự động cài đặt HTTP Proxy...${NC}"

proxy_port="6969"
squid_user="tangoclong"
squid_pass="2000"

# Cập nhật hệ thống
echo "[1/5] ➤ Đang cập nhật hệ thống..."
if ! sudo apt update && sudo apt upgrade -y; then
    echo -e "${RED}❌ Lỗi khi cập nhật hệ thống${NC}"
    exit 1
fi

# Cài gói cần thiết
echo "[2/5] ➤ Đang cài Squid + Apache2-utils..."
if ! sudo apt install -y squid apache2-utils vim curl bc; then
    echo -e "${RED}❌ Lỗi khi cài đặt các gói cần thiết${NC}"
    exit 1
fi

# Sao lưu file cấu hình cũ
if [ -f /etc/squid/squid.conf ]; then
    echo "[3/5] ➤ Sao lưu cấu hình cũ của Squid..."
    sudo cp /etc/squid/squid.conf /etc/squid/squid.conf.bak
fi

# Tạo cấu hình mới
echo "[4/5] ➤ Tạo file cấu hình VIP cho Squid..."
cat <<EOF | sudo tee /etc/squid/squid.conf > /dev/null
auth_param basic program /usr/lib/squid/basic_ncsa_auth /etc/squid/passwords
auth_param basic realm proxy
acl authenticated proxy_auth REQUIRED
http_access allow authenticated
http_port $proxy_port
cache_mem 256 MB
maximum_object_size_in_memory 64 KB
cache_replacement_policy lru
refresh_pattern ^ftp: 1440 20% 10080
refresh_pattern ^gopher: 1440 0% 1440
refresh_pattern -i (/cgi-bin/|\?) 0 0% 0
refresh_pattern . 0 20% 4320
client_lifetime 1 hour
half_closed_clients off
EOF

# Tạo tài khoản proxy VIP
echo "[5/5] ➤ Tạo tài khoản VIP..."
echo "$squid_pass" | sudo htpasswd -c -i /etc/squid/passwords "$squid_user"

# Khởi động lại Squid
echo "[5/5] ➤ Khởi động lại dịch vụ Squid..."
sudo systemctl restart squid
sudo systemctl enable squid

# Kiểm tra service
sleep 3
if systemctl is-active --quiet squid; then
    echo "   ✅ Squid service đã khởi động thành công"
else
    echo -e "${RED}❌ Lỗi: Squid service không khởi động được${NC}"
    journalctl -u squid --no-pager | tail -n 10
    exit 1
fi

# Lấy IP và hiển thị thông tin
ip_address=$(curl -s ifconfig.me || echo "N/A")
if [ "$ip_address" = "N/A" ]; then
    echo -e "${RED}❌ Không thể lấy địa chỉ IP${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Cài đặt HTTP Proxy VIP thành công cho $client_full_name!${NC}"

# Lấy thông tin IP
ip_info=$(get_ip_info "$ip_address")
isp=$(echo "$ip_info" | grep -o '"isp":"[^"]*"' | cut -d'"' -f4 || echo "N/A")
country=$(echo "$ip_info" | grep -o '"country":"[^"]*"' | cut -d'"' -f4 || echo "N/A")

# Kiểm tra tốc độ
speed=$(check_network_speed)

# Kiểm tra proxy
proxy_status=$(check_http_proxy "$ip_address" "$proxy_port" "$squid_user" "$squid_pass")

# Hiển thị thông tin HTTP proxy
echo -e "${PURPLE}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${PURPLE}║${WHITE}                        THÔNG TIN HTTP PROXY VIP - $client_full_name${PURPLE}║${NC}"
echo -e "${PURPLE}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
echo -e "${PURPLE}║${CYAN} 🌐 HTTP Proxy URL: ${WHITE}http://$squid_user:$squid_pass@$ip_address:$proxy_port             ${PURPLE}║${NC}"
echo -e "${PURPLE}║${CYAN} 📍 Địa chỉ IP: ${WHITE}$ip_address                                      ${PURPLE}║${NC}"
echo -e "${PURPLE}║${CYAN} 🔌 Cổng: ${WHITE}$proxy_port                                                   ${PURPLE}║${NC}"
echo -e "${PURPLE}║${CYAN} 👤 Username: ${WHITE}$squid_user                                         ${PURPLE}║${NC}"
echo -e "${PURPLE}║${CYAN} 🔑 Password: ${WHITE}$squid_pass                                               ${PURPLE}║${NC}"
echo -e "${PURPLE}║${CYAN} 🏢 Nhà mạng: ${WHITE}$isp                                               ${PURPLE}║${NC}"
echo -e "${PURPLE}║${CYAN} 🌍 Quốc gia: ${WHITE}$country                                           ${PURPLE}║${NC}"
echo -e "${PURPLE}║${CYAN} ⚡ Tốc độ mạng: ${WHITE}${speed} Mbps                                   ${PURPLE}║${NC}"
echo -e "${PURPLE}║${CYAN} 🔧 Trạng thái: ${WHITE}$proxy_status                                    ${PURPLE}║${NC}"
echo -e "${PURPLE}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"

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
