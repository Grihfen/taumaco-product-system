#!/bin/bash
# ============================================
# Taumaco Product System - 一键部署脚本
# ============================================

set -e

GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}   🚀 Taumaco 部署脚本${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""

# 检查 PHP
if ! command -v php &> /dev/null; then
    echo -e "${RED}❌ PHP 未安装！${NC}"
    echo "请访问: https://php.net/downloads"
    exit 1
fi

PHP_VERSION=$(php -v | head -n 1 | cut -d " " -f 2 | cut -d "." -f 1,2)
echo -e "${GREEN}✅ PHP 版本: $PHP_VERSION${NC}"

# 检查 PHP 版本
if (( $(echo "$PHP_VERSION < 8.1" | bc -l) )); then
    echo -e "${RED}❌ PHP 版本过低！需要 >= 8.1${NC}"
    exit 1
fi

# 检查 MySQL
if ! command -v mysql &> /dev/null; then
    echo -e "${YELLOW}⚠️  MySQL 未安装！${NC}"
    echo "请访问: https://dev.mysql.com/downloads/"
else
    echo -e "${GREEN}✅ MySQL 已安装${NC}"
fi

echo ""

# 创建必要目录
echo -e "${CYAN}[1/4]${NC} 创建必要目录..."
mkdir -p backend/uploads
mkdir -p backend/storage
mkdir -p backend/cache
mkdir -p backend/logs
mkdir -p database/backups
echo -e "${GREEN}✅ 目录创建完成${NC}"

# 设置权限
echo -e "${CYAN}[2/4]${NC} 设置文件权限..."
chmod -R 755 backend/public 2>/dev/null || true
chmod -R 777 backend/uploads 2>/dev/null || true
chmod -R 777 backend/cache 2>/dev/null || true
chmod -R 777 backend/logs 2>/dev/null || true
chmod -R 777 backend/storage 2>/dev/null || true
echo -e "${GREEN}✅ 权限设置完成${NC}"

# 检查配置文件
echo -e "${CYAN}[3/4]${NC} 检查配置文件..."
if [ ! -f "backend/config/database.php" ]; then
    echo -e "${YELLOW}⚠️  数据库配置文件不存在${NC}"
    echo "请创建: backend/config/database.php"
else
    echo -e "${GREEN}✅ 配置文件存在${NC}"
fi

# 检查 Web 服务器
echo -e "${CYAN}[4/4]${NC} 检查 Web 服务器..."
if command -v apache2 &> /dev/null; then
    echo -e "${GREEN}✅ Apache 已安装${NC}"
    echo "重启 Apache: sudo systemctl restart apache2"
elif command -v nginx &> /dev/null; then
    echo -e "${GREEN}✅ Nginx 已安装${NC}"
    echo "重启 Nginx: sudo systemctl restart nginx"
else
    echo -e "${YELLOW}⚠️  未检测到 Web 服务器${NC}"
    echo "请安装 Apache 或 Nginx"
fi

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}   ✅ 部署完成！${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo -e "${YELLOW}📋 下一步：${NC}"
echo "1. 配置数据库连接"
echo "2. 导入数据库: mysql -u root -p < database/schema/taumaco_db.sql"
echo "3. 启动 Web 服务器"
echo "4. 访问: http://localhost"
echo ""
echo -e "${CYAN}📖 文档: https://github.com/Grihfen/taumaco-product-system${NC}"
echo ""
