# S2CODE Proxy Installer - Premium Tools & Services

[![Version](https://img.shields.io/badge/version-2.0-blue.svg)](https://github.com/s2codetaem/s2code-proxy-installer)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Ubuntu%2FDebian-orange.svg)](https://ubuntu.com/)

⚡ **S2CODE TEAM** - Professional automated proxy installer for HTTP and SOCKS5 proxies with advanced features and monitoring.

## 🚀 Features

- **Dual Proxy Support**: HTTP & SOCKS5 proxy installation
- **Automated Setup**: One-command installation process
- **VIP Authentication**: Built-in user validation system
- **Real-time Monitoring**: Hidden Telegram notifications
- **Performance Testing**: Network speed and protocol verification
- **Professional UI**: Beautiful terminal interface with colors
- **Error Handling**: Robust installation with fallback options
- **Zero Configuration**: Pre-configured with optimal settings

## 📋 System Requirements

- **OS**: Ubuntu 18.04+ / Debian 9+ 
- **Memory**: 512MB RAM minimum
- **Storage**: 1GB free space
- **Network**: Public IP address
- **Privileges**: Root or sudo access

## 🛠️ Installation Methods

### Method 1: Direct Script Execution

```bash
# Download and run the installer
wget https://raw.githubusercontent.com/s2codetaem/s2code-proxy-installer/main/poxy.sh
chmod +x poxy.sh
./poxy.sh
```

### Method 2: One-Line Installation  

```bash
# Quick install (recommended)
curl -sSL https://raw.githubusercontent.com/s2codetaem/s2code-proxy-installer/main/poxy.sh | bash
```

### Method 3: Clone Repository

```bash
git clone https://github.com/s2codetaem/s2code-proxy-installer.git
cd s2code-proxy-installer
chmod +x poxy.sh
./poxy.sh
```

## 🎯 Usage Guide

### Interactive Installation

1. **Run the script** using any method above
2. **Read the guidelines** carefully displayed on screen
3. **Choose proxy type**: HTTP (1) or SOCKS5 (2)
4. **Enter your full name** for authentication
5. **Wait for installation** (2-7 minutes)
6. **Copy proxy information** when complete

### Proxy Types

#### HTTP Proxy
- **Use case**: Web browsing, HTTP applications
- **Port**: 6969
- **Format**: `http://tangoclong:2000@YOUR_IP:6969`
- **Compatible**: Browsers, curl, wget, most web tools

#### SOCKS5 Proxy
- **Use case**: All applications, games, P2P
- **Port**: 6969  
- **Format**: `socks5://tangoclong:2000@YOUR_IP:6969`
- **Compatible**: All network applications

## 🔧 Technical Details

### HTTP Proxy (Squid)
- **Software**: Squid Proxy Server
- **Authentication**: Basic HTTP auth
- **Configuration**: Optimized for performance
- **Logging**: Access logs enabled

### SOCKS5 Proxy (3proxy)
- **Software**: 3proxy with source compilation
- **Authentication**: Strong username/password
- **Features**: Multi-protocol support
- **Service**: Systemd integration

### Default Credentials
- **Username**: `tangoclong`
- **Password**: `2000`
- **Port**: `6969` (both HTTP and SOCKS5)

## 🔐 Security Features

- **Name Validation**: Two-tier authentication system
- **Hidden Monitoring**: Telegram notifications (admin only)
- **Access Control**: User-based authentication
- **Port Security**: Non-standard port usage
- **Process Isolation**: Systemd service management

## 📊 Monitoring & Analytics

The installer includes hidden monitoring capabilities:

- **Client Information**: Name, IP, location, ISP
- **System Details**: OS info, hostname, network speed
- **Proxy Configuration**: Type, credentials, performance
- **Real-time Alerts**: Telegram notifications for admin

## 🚨 Firewall Configuration

**Required**: Open port 6969 on your server

```bash
# UFW (Ubuntu/Debian)
sudo ufw allow 6969

# iptables
sudo iptables -A INPUT -p tcp --dport 6969 -j ACCEPT

# For cloud providers, also configure security groups
```

## 🧪 Testing Your Proxy

### HTTP Proxy Test
```bash
curl -x http://tangoclong:2000@YOUR_IP:6969 http://ipinfo.io/ip
```

### SOCKS5 Proxy Test
```bash
curl --socks5 tangoclong:2000@YOUR_IP:6969 http://ipinfo.io/ip
```

## 📱 Client Configuration Examples

### Browser Setup
1. **Chrome/Firefox**: Settings → Network → Manual proxy
2. **HTTP Proxy**: `YOUR_IP:6969`
3. **Username**: `tangoclong`
4. **Password**: `2000`

### Application Setup
- **Telegram**: Settings → Data and Storage → Proxy
- **Games**: Network settings → SOCKS5 proxy
- **Download Managers**: Proxy configuration

## 🛠️ Troubleshooting

### Common Issues

#### "Connection Refused"
```bash
# Check if service is running
sudo systemctl status squid        # For HTTP
sudo systemctl status 3proxy      # For SOCKS5

# Restart services
sudo systemctl restart squid
sudo systemctl restart 3proxy
```

#### "Authentication Failed"
- Verify credentials: `tangoclong:2000`
- Check proxy URL format
- Ensure port 6969 is accessible

#### "Port Already in Use"
```bash
# Check what's using port 6969
sudo netstat -tulpn | grep 6969

# Kill conflicting process if needed
sudo systemctl stop apache2    # If Apache is on port 6969
```

### Service Management
```bash
# HTTP Proxy (Squid)
sudo systemctl start/stop/restart/status squid

# SOCKS5 Proxy (3proxy)  
sudo systemctl start/stop/restart/status 3proxy

# View logs
sudo journalctl -u squid -f
sudo journalctl -u 3proxy -f
```

## 🔄 Updates & Maintenance

### Manual Updates
```bash
# Re-download latest version
wget -O poxy.sh https://raw.githubusercontent.com/s2codetaem/s2code-proxy-installer/main/poxy.sh
chmod +x poxy.sh
./poxy.sh
```

### Configuration Backup
```bash
# Backup HTTP config
sudo cp /etc/squid/squid.conf /etc/squid/squid.conf.backup

# Backup SOCKS5 config
sudo cp /etc/3proxy/3proxy.cfg /etc/3proxy/3proxy.cfg.backup
```

## 📞 Support & Contact

### Developer Information
- **Name**: TẠ NGỌC LONG
- **Specializes**: Google Cloud accounts, MMO tools, Proxy services
- **Services**: Custom tools, web development, software development

### Contact Channels
- **Facebook 1**: [https://www.facebook.com/s2code08122000/](https://www.facebook.com/s2code08122000/)
- **Facebook 2**: [https://www.facebook.com/tangoclongmeta](https://www.facebook.com/tangoclongmeta)
- **Telegram**: [https://t.me/S2codetaem48](https://t.me/S2codetaem48)

### Support Hours
- **Timezone**: GMT+7 (Vietnam)
- **Available**: 9:00 AM - 11:00 PM daily
- **Response time**: Usually within 2-4 hours

## 📜 License & Terms

### License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### Terms of Use
- **Educational Purpose**: For learning and legitimate use only
- **No Malicious Use**: Do not use for illegal activities
- **Attribution**: Credit S2CODE TEAM when sharing
- **No Warranty**: Software provided "as is"

### Disclaimer
- Users are responsible for compliance with local laws
- The developer is not liable for misuse of the software
- Use at your own risk and responsibility

## 🌟 Additional Services

S2CODE TEAM offers comprehensive digital services:

### Cloud Services
- **Google Cloud**: Large-scale account provisioning
- **Server Management**: VPS setup and configuration
- **Cloud Migration**: Data and service migration

### Development Services
- **Custom Tools**: Tailored software solutions
- **Web Development**: Modern responsive websites
- **API Integration**: Third-party service integration
- **Automation**: Process automation scripts

### MMO & Gaming
- **Game Tools**: Specialized gaming utilities
- **Account Services**: Secure account management
- **Bot Development**: Intelligent automation bots

## 🚀 Roadmap

### Version 2.1 (Coming Soon)
- [ ] Web-based management panel
- [ ] Multiple user support
- [ ] Bandwidth monitoring
- [ ] Auto-renewal system

### Version 2.2 (Future)
- [ ] Docker containerization
- [ ] Load balancing
- [ ] Geographic distribution
- [ ] API endpoints

---

**© 2024 S2CODE TEAM - Premium Tools & Services Provider**

*Professional proxy solutions for modern networking needs* 
