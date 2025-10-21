# 🔧 Taumaco Product Management System

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![PHP Version](https://img.shields.io/badge/php-%3E%3D8.1-blue)](https://php.net)
[![Status](https://img.shields.io/badge/status-active-success.svg)]()

Professional Product Management System for **Taumaco/Sibitweld** welding equipment.

---

## 🚀 Quick Deploy

```bash
# Clone repository
git clone https://github.com/Grihfen/taumaco-product-system.git
cd taumaco-product-system

# Run deployment script
chmod +x scripts/deploy.sh
./scripts/deploy.sh
```

---

## ✨ Features

| Feature | Status | Description |
|---------|--------|-------------|
| 📦 **Product Management** | ✅ | Complete product catalog with specifications |
| 📊 **Inventory Tracking** | ✅ | Real-time stock monitoring |
| 💰 **Quote Generation** | ✅ | Professional quotation system |
| 📈 **Analytics Dashboard** | ✅ | Real-time business insights |
| 🌐 **Bilingual Support** | ✅ | English & Chinese (EN/CN) |
| 🔐 **User Management** | ✅ | Role-based access control |
| 📱 **Responsive Design** | ✅ | Mobile-friendly interface |
| 🔄 **API Integration** | ✅ | RESTful API endpoints |

---

## 📁 Project Structure

```
taumaco-product-system/
├── backend/              # PHP Backend
│   ├── app/
│   │   ├── controllers/  # API Controllers
│   │   ├── models/       # Data Models
│   │   ├── views/        # View Templates
│   │   └── middleware/   # Middleware
│   ├── config/           # Configuration
│   ├── public/           # Public Assets
│   └── uploads/          # User Uploads
├── frontend/             # Frontend Assets
│   ├── src/              # Source Files
│   └── public/           # Static Files
├── database/             # Database Files
│   ├── schema/           # Database Schema
│   ├── migrations/       # Migration Scripts
│   └── seeds/            # Seed Data
├── scripts/              # Deployment Scripts
├── analytics/            # Analytics Tools
└── docs/                 # Documentation
```

---

## 🛠️ Tech Stack

### Backend
- **PHP 8.1+** - Core language
- **MySQL 8.0+** - Database
- **Apache/Nginx** - Web server

### Frontend
- **HTML5/CSS3** - Structure & styling
- **JavaScript (ES6+)** - Interactivity
- **Chart.js** - Data visualization

### DevOps
- **Git** - Version control
- **GitHub Actions** - CI/CD
- **Docker** - Containerization (optional)

---

## 📖 Documentation

- [📘 API Documentation](docs/API.md)
- [🚀 Deployment Guide](docs/DEPLOYMENT.md)
- [👤 User Guide](docs/USER_GUIDE.md)
- [🔧 Configuration Guide](docs/CONFIGURATION.md)
- [🐛 Troubleshooting](docs/TROUBLESHOOTING.md)

---

## 🔧 Requirements

### Minimum Requirements
```
PHP >= 8.1
MySQL >= 8.0
Apache >= 2.4 (with mod_rewrite)
Disk Space >= 500MB
RAM >= 512MB
```

### Recommended Requirements
```
PHP >= 8.2
MySQL >= 8.0
Nginx >= 1.20
Disk Space >= 2GB
RAM >= 2GB
SSL Certificate (Let's Encrypt)
```

---

## 📦 Installation

### Step 1: Clone Repository
```bash
git clone https://github.com/Grihfen/taumaco-product-system.git
cd taumaco-product-system
```

### Step 2: Configure Database
```bash
cp backend/config/database.example.php backend/config/database.php
nano backend/config/database.php
```

### Step 3: Import Database
```bash
mysql -u root -p < database/schema/taumaco_db.sql
```

### Step 4: Set Permissions
```bash
chmod -R 755 backend/public
chmod -R 777 backend/uploads
chmod -R 777 backend/cache
chmod -R 777 backend/logs
```

### Step 5: Start Server
```bash
# Apache
sudo systemctl restart apache2

# Or Nginx
sudo systemctl restart nginx
```

---

## 🌐 Access

```
Frontend: http://your-domain.com
Backend:  http://your-domain.com/admin
API:      http://your-domain.com/api
```

---

## 🔐 Default Credentials

```
Username: admin
Password: admin123
```

⚠️ **Please change default password after first login!**

---

## 📞 Support

- **GitHub Issues**: [Report Bug](https://github.com/Grihfen/taumaco-product-system/issues)
- **Email**: support@taumaco.com
- **Website**: https://taumaco.com
- **Documentation**: [Wiki](https://github.com/Grihfen/taumaco-product-system/wiki)

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## 👥 Contributors

- **[Grihfen](https://github.com/Grihfen)** - Project Lead & Developer

---

## 🙏 Acknowledgments

- Taumaco Team for product specifications
- Sibitweld for technical documentation
- Open source community for inspiration

---

## 📊 Project Status

| Metric | Status |
|--------|--------|
| Build | ![Passing](https://img.shields.io/badge/build-passing-brightgreen) |
| Coverage | ![80%](https://img.shields.io/badge/coverage-80%25-green) |
| Version | ![v1.0.0](https://img.shields.io/badge/version-1.0.0-blue) |
| Last Updated | ![2025](https://img.shields.io/badge/updated-2025-blue) |

---

**Made with ❤️ by [Grihfen](https://github.com/Grihfen)**

⭐ **Star this repo if you find it helpful!**
