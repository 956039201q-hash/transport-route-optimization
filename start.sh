#!/bin/bash
cd "$(dirname "$0")"

echo "=================================================="
echo "  SmartRoute · 智能运输路径优化系统"
echo "=================================================="

# Check Python
if ! command -v python3 &> /dev/null; then
    echo "❌ 错误：未找到 Python3，请先安装 Python 3.8+"
    exit 1
fi

# Install deps
echo "📦 安装依赖..."
pip3 install -r requirements.txt -q --break-system-packages 2>/dev/null || pip3 install -r requirements.txt -q

echo ""
echo "✅ 启动服务器..."
echo "📌 访问地址: http://localhost:5000"
echo "   Ctrl+C 停止服务"
echo ""

python3 app.py
