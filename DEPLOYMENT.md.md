# Deployment Guide

Complete guide for deploying Taumaco Product Management System.

---

## Prerequisites

### Required Software
- **PHP** >= 8.1
- **MySQL** >= 8.0
- **Apache** >= 2.4 or **Nginx** >= 1.20
- **Git**
- **Composer** (optional)

### Server Requirements
- **RAM:** Minimum 512MB, Recommended 2GB
- **Disk Space:** Minimum 500MB, Recommended 2GB
- **SSL Certificate:** Recommended (Let's Encrypt)

---

## Deployment Methods

### Method 1: Automated Deployment (Recommended)

```bash
# Clone repository
git clone https://github.com/Grihfen/taumaco-product-system.git
cd taumaco-product-system

# Run deployment script
chmod +x scripts/deploy.sh
./scripts/deploy.sh
```

### Method 2: Manual Deployment

#### Step 1: Clone Repository
```bash
git clone https://github.com/Grihfen/taumaco-product-system.git
cd taumaco-product-system
```

#### Step 2: Create Directories
```bash
mkdir -p backend/uploads
mkdir -p backend/cache
mkdir -p backend/logs
mkdir -p backend/storage
mkdir -p database/backups
```

#### Step 3: Set Permissions
```bash
chmod -R 755 backend/public
chmod -R 777 backend/uploads
chmod -R 777 backend/cache
chmod -R 777 backend/logs
chmod -R 777 backend/storage
```

#### Step 4: Configure Database
```bash
cp backend/config/database.example.php backend/config/database.php
nano backend/config/database.php
```

**Edit database.php:**
```php
<?php
return [
    'host' => 'localhost',
    'database' => 'taumaco_db',
    'username' => 'your_username',
    'password' => 'your_password',
    'charset' => 'utf8mb4'
];
```

#### Step 5: Import Database
```bash
mysql -u root -p < database/schema/taumaco_db.sql
```

#### Step 6: Configure Web Server

**Apache (.htaccess):**
```apache
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteBase /
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteRule ^(.*)$ index.php?/$1 [L]
</IfModule>
```

**Nginx (nginx.conf):**
```nginx
server {
    listen 80;
    server_name your-domain.com;
    root /path/to/taumaco-product-system/backend/public;
    index index.php;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
    }
}
```

#### Step 7: Restart Web Server
```bash
# Apache
sudo systemctl restart apache2

# Nginx
sudo systemctl restart nginx
```

---

## SSL Configuration (Let's Encrypt)

```bash
# Install Certbot
sudo apt-get install certbot python3-certbot-apache

# Obtain SSL certificate
sudo certbot --apache -d your-domain.com

# Auto-renewal
sudo certbot renew --dry-run
```

---

## Environment Configuration

### Production Settings

**backend/config/app.php:**
```php
<?php
return [
    'environment' => 'production',
    'debug' => false,
    'timezone' => 'UTC',
    'locale' => 'en'
];
```

### Development Settings

```php
<?php
return [
    'environment' => 'development',
    'debug' => true,
    'timezone' => 'UTC',
    'locale' => 'en'
];
```

---

## Database Backup

### Manual Backup
```bash
mysqldump -u root -p taumaco_db > database/backups/backup_$(date +%Y%m%d).sql
```

### Automated Backup (Cron)
```bash
# Edit crontab
crontab -e

# Add daily backup at 2 AM
0 2 * * * mysqldump -u root -p'password' taumaco_db > /path/to/backups/backup_$(date +\%Y\%m\%d).sql
```

---

## Performance Optimization

### PHP Configuration

**php.ini:**
```ini
memory_limit = 256M
upload_max_filesize = 64M
post_max_size = 64M
max_execution_time = 300
```

### Enable OPcache

```ini
opcache.enable=1
opcache.memory_consumption=128
opcache.max_accelerated_files=10000
opcache.revalidate_freq=2
```

### MySQL Optimization

**my.cnf:**
```ini
[mysqld]
innodb_buffer_pool_size = 1G
max_connections = 200
query_cache_size = 64M
```

---

## Monitoring

### Log Files
```bash
# Application logs
tail -f backend/logs/app.log

# Error logs
tail -f backend/logs/error.log

# Access logs
tail -f /var/log/apache2/access.log
```

### Health Check
```bash
curl http://your-domain.com/api/health
```

---

## Troubleshooting

### Issue: Permission Denied

**Solution:**
```bash
sudo chown -R www-data:www-data /path/to/taumaco-product-system
chmod -R 755 backend/public
chmod -R 777 backend/uploads backend/cache backend/logs
```

### Issue: Database Connection Failed

**Solution:**
1. Check database credentials in `backend/config/database.php`
2. Verify MySQL service is running: `sudo systemctl status mysql`
3. Test connection: `mysql -u username -p`

### Issue: 500 Internal Server Error

**Solution:**
1. Check error logs: `tail -f backend/logs/error.log`
2. Enable debug mode in `backend/config/app.php`
3. Verify PHP version: `php -v`

---

## Security Checklist

- [ ] Change default admin password
- [ ] Enable SSL/HTTPS
- [ ] Set proper file permissions
- [ ] Configure firewall
- [ ] Enable PHP security features
- [ ] Regular security updates
- [ ] Database backup automation
- [ ] Monitor access logs

---

## Maintenance

### Update System
```bash
cd taumaco-product-system
git pull origin main
./scripts/deploy.sh
```

### Clear Cache
```bash
rm -rf backend/cache/*
```

### Database Migration
```bash
php scripts/migrate.php
```

---

## Support

- **Documentation:** [GitHub Wiki](https://github.com/Grihfen/taumaco-product-system/wiki)
- **Issues:** [GitHub Issues](https://github.com/Grihfen/taumaco-product-system/issues)
- **Email:** support@taumaco.com

---

**Last Updated:** 2025-10-21