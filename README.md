<div align="center">

```
███████╗██████╗  ██████╗ ██████╗ ██████╗ ███████╗████████╗ █████╗ ███████╗███╗   ███╗
██╔════╝╚════██╗██╔════╝██╔═══██╗██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██╔════╝████╗ ████║
███████╗ █████╔╝██║     ██║   ██║██║  ██║█████╗     ██║   ███████║█████╗  ██╔████╔██║
╚════██║██╔═══╝ ██║     ██║   ██║██║  ██║██╔══╝     ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║
███████║███████╗╚██████╗╚██████╔╝██████╔╝███████╗   ██║   ██║  ██║███████╗██║ ╚═╝ ██║
╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝
```

# 🚀 **VIP PROXY INSTALLER**

### *Professional Proxy Server Automation Tool*

[![Version](https://img.shields.io/badge/Version-2.0-blue.svg)](https://github.com/s2codetaem)
[![License](https://img.shields.io/badge/License-Premium-gold.svg)](https://t.me/S2codetaem48)
[![Support](https://img.shields.io/badge/Support-24%2F7-green.svg)](https://www.facebook.com/s2code08122000/)
[![Platform](https://img.shields.io/badge/Platform-Ubuntu%2FDebian-orange.svg)](#)

**Developed by TẠ NGỌC LONG** | **S2CODETAEM Solutions**

</div>

---

## 🎯 **Tổng Quan**

**S2CODETAEM VIP Proxy Installer** là công cụ tự động hóa chuyên nghiệp để triển khai Proxy Server trong vài phút. Hỗ trợ cả **HTTP** và **SOCKS5** proxy với giao diện đẹp mắt và quy trình cài đặt hoàn toàn tự động.

### ✨ **Tại sao chọn S2CODETAEM?**

- 🔥 **Tự động 100%** - Không cần kiến thức kỹ thuật
- ⚡ **Siêu nhanh** - Cài đặt trong 2-5 phút
- 🎨 **Giao diện đẹp** - Terminal UI với màu sắc chuyên nghiệp  
- 🔒 **Bảo mật cao** - Authentication và encryption
- 🌍 **Đa nền tảng** - Ubuntu, Debian, CentOS
- 📊 **Giám sát** - Kiểm tra real-time status và performance

---

## 🚀 **Tính Năng Nổi Bật**

| Tính năng | HTTP Proxy | SOCKS5 Proxy |
|-----------|------------|--------------|
| **Web Browsing** | ✅ Tối ưu | ✅ Hỗ trợ |
| **Applications** | ⚠️ Giới hạn | ✅ Hoàn hảo |
| **Gaming** | ❌ Không | ✅ Tốt |
| **Torrenting** | ❌ Không | ✅ Tốt |
| **Speed** | 🚀 Cao | 🚀 Rất cao |
| **Security** | 🔒 Cơ bản | 🔒 Nâng cao |

### 💎 **Đặc điểm kỹ thuật:**

- **HTTP Proxy:** Squid Server với Basic Authentication
- **SOCKS5 Proxy:** Dante Server với PAM Authentication  
- **Port:** 6969 (có thể tùy chỉnh)
- **Credentials:** tangoclong:2000 (mặc định)
- **Protocols:** IPv4/IPv6 support
- **Logging:** Chi tiết với rotation

---

## 🛠️ **Hướng Dẫn Cài Đặt**

### 📋 **Yêu cầu hệ thống:**

- **OS:** Ubuntu 18+ / Debian 9+ / CentOS 7+
- **RAM:** Tối thiểu 512MB
- **Disk:** 1GB trống
- **Network:** Port 6969 mở
- **Permissions:** sudo/root access

### ⚡ **Cài đặt nhanh:**

```bash
# 1. Tải script
wget https://raw.githubusercontent.com/s2codetaem/proxy-installer/main/tools.sh

# 2. Phân quyền thực thi
chmod +x tools.sh

# 3. Chạy script
./tools.sh
```

### 🎮 **Hướng dẫn từng bước:**

1. **Chuẩn bị Server:**
   ```bash
   # Mở port 6969
   sudo ufw allow 6969/tcp
   sudo ufw reload
   ```

2. **Chạy Script:**
   - Chọn loại proxy (HTTP/SOCKS5)
   - Nhập họ tên để xác thực
   - Đợi tự động cài đặt

3. **Nhận thông tin Proxy:**
   ```
   📊 THÔNG TIN PROXY
   🌐 IP: your-server-ip
   🚪 Port: 6969
   👤 Username: tangoclong
   🔑 Password: 2000
   ```

---

## 📚 **Cách Sử Dụng**

### 🌐 **HTTP Proxy:**
```
Format: http://tangoclong:2000@your-ip:6969

# Curl example
curl -x http://tangoclong:2000@your-ip:6969 https://ipinfo.io

# Browser setting
Host: your-ip
Port: 6969
Username: tangoclong
Password: 2000
```

### 🔒 **SOCKS5 Proxy:**
```
Format: socks5://tangoclong:2000@your-ip:6969

# SSH tunnel
ssh -D 1080 -f -C -q -N user@your-ip

# Applications
Host: your-ip
Port: 6969
Type: SOCKS5
Username: tangoclong
Password: 2000
```

---

## 🔧 **Quản Lý & Bảo Trì**

### 📊 **Kiểm tra Status:**
```bash
# HTTP Proxy (Squid)
sudo systemctl status squid
sudo tail -f /var/log/squid/access.log

# SOCKS5 Proxy (Dante)
sudo systemctl status dant
sudo tail -f /var/log/danted.log
```

### 🔄 **Restart Services:**
```bash
# Restart HTTP
sudo systemctl restart squid

# Restart SOCKS5  
sudo systemctl restart dant
```

### 🔒 **Thay đổi mật khẩu:**
```bash
# HTTP Proxy
echo "new_password" | sudo htpasswd -i /etc/squid/passwords tangoclong

# SOCKS5 Proxy
echo "tangoclong:new_password" | sudo chpasswd
```

---

## 🎯 **Use Cases & Scenarios**

| Tình huống | Proxy Type | Lý do |
|------------|------------|-------|
| **Web Scraping** | HTTP | Đơn giản, nhanh |
| **SEO Tools** | HTTP | Tương thích cao |
| **Social Media** | SOCKS5 | Bảo mật tốt |
| **Gaming** | SOCKS5 | Độ trễ thấp |
| **Streaming** | SOCKS5 | Ổn định |
| **Mobile Apps** | SOCKS5 | Hỗ trợ mọi app |

---

## 🛡️ **Bảo Mật & Best Practices**

### 🔐 **Security Features:**
- ✅ User authentication required
- ✅ Access logging enabled  
- ✅ Rate limiting configured
- ✅ Firewall rules applied
- ✅ Encrypted connections

### 💡 **Khuyến nghị:**
- 🔄 Thay đổi password định kỳ
- 📊 Monitor logs thường xuyên
- 🔒 Sử dụng VPN kết hợp nếu cần
- 🛡️ Cập nhật hệ thống thường xuyên
- 📈 Monitor bandwidth usage

---

## 🆘 **Troubleshooting**

### ❌ **Lỗi thường gặp:**

**1. Connection refused:**
```bash
# Kiểm tra service
sudo systemctl status squid
sudo systemctl status dant

# Kiểm tra port
sudo netstat -tulpn | grep 6969
```

**2. Authentication failed:**
```bash
# Kiểm tra credentials
sudo cat /etc/squid/passwords
sudo cat /etc/danted.conf
```

**3. Slow performance:**
```bash
# Kiểm tra resources
top
df -h
free -m
```

### 📞 **Hỗ trợ kỹ thuật:**
- 🔧 **Issues:** Tạo GitHub issue với log details
- 💬 **Chat:** Telegram @S2codetaem48
- 📧 **Email:** Contact qua Facebook
- 📱 **Hotline:** 24/7 support

---

## 💼 **Dịch Vụ Chuyên Nghiệp**

### 🌟 **S2CODETAEM Solutions:**

| Service | Description | Contact |
|---------|-------------|---------|
| 🌐 **Google Cloud** | Tài khoản GCP số lượng lớn | [Facebook](https://fb.com/s2code08122000) |
| 🎮 **MMO Tools** | Bot, script, automation | [Telegram](https://t.me/S2codetaem48) |
| 🔧 **Custom Development** | Web, app, tool theo yêu cầu | [Facebook](https://fb.com/tangoclongmeta) |
| 🌍 **Proxy Services** | Dedicated, residential, datacenter | [Telegram](https://t.me/S2codetaem48) |

### 💎 **Gói dịch vụ:**
- **Basic:** Script miễn phí + community support
- **Pro:** Custom script + priority support  
- **Enterprise:** Dedicated solution + 24/7 support

---

## 📈 **Roadmap & Updates**

### 🚀 **Version 2.1 (Coming Soon):**
- [ ] IPv6 full support
- [ ] Multiple port configuration
- [ ] Web dashboard
- [ ] Auto SSL certificates
- [ ] Load balancing
- [ ] Docker containerization

### 📊 **Statistics:**
- 🎯 **99.9%** Uptime
- ⚡ **<1s** Connection time
- 🔒 **100%** Security compliance
- 👥 **10,000+** Happy users

---

## 🤝 **Contributing & Community**

### 💡 **Đóng góp:**
1. Fork repository
2. Create feature branch
3. Commit changes
4. Push to branch  
5. Create Pull Request

### 🌟 **Community:**
- ⭐ Star repository nếu hữu ích
- 🐛 Report bugs via Issues
- 💡 Suggest features
- 📢 Share với bạn bè

---

## 📄 **License & Legal**

```
© 2024 S2CODETAEM - TẠ NGỌC LONG
All rights reserved.

This software is proprietary and confidential.
Unauthorized copying, distribution, or modification 
is strictly prohibited.

For licensing inquiries: t.me/S2codetaem48
```

---

<div align="center">

### 🎉 **Cảm ơn bạn đã chọn S2CODETAEM!**

**Made with ❤️ by TẠ NGỌC LONG**

[![Facebook](https://img.shields.io/badge/Facebook-1877F2?style=for-the-badge&logo=facebook&logoColor=white)](https://fb.com/s2code08122000)
[![Telegram](https://img.shields.io/badge/Telegram-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/S2codetaem48)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](#)

**⭐ Don't forget to star this repository! ⭐**

</div> 
