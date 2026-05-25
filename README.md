# SmartRoute · 智能运输路径优化系统

## 📦 功能概览

| 模块 | 功能 |
|------|------|
| 订单管理 | Excel 批量上传 · 高德地址解析 · 列表管理 |
| 车辆管理 | 自定义车型/尺寸/载重/容积 · 增删查 |
| 路径优化 | VRP 多车辆调度 · Clarke-Wright + 2-opt 算法 |
| 地图展示 | 高德地图实际路径 · 彩色路线 · 站点标注 |
| 结果导出 | Excel 多 Sheet 汇总 + 每车明细 |

---

## 🚀 快速启动

### 方式一：脚本启动（推荐）

**Mac / Linux：**
```bash
chmod +x start.sh
./start.sh
```

**Windows：**
```
双击 start.bat
```

### 方式二：手动启动

```bash
# 1. 安装依赖
pip install -r requirements.txt

# 2. 启动
python app.py
```

访问 **http://localhost:5000** 即可使用。

---

## 📋 Excel 订单模板格式

| 列 | 说明 | 必填 |
|----|------|------|
| 订单号 | 唯一标识符 | ✅ |
| 客户名称 | 收货方名称 | |
| 配送地址 | 完整地址（用于地图解析） | ✅ |
| 重量(kg) | 货物重量 | |
| 长度(cm) | 货物长度 | |
| 宽度(cm) | 货物宽度 | |
| 高度(cm) | 货物高度 | |
| 备注 | 配送说明 | |

> 点击「下载模板」获取标准 Excel 格式。

---

## ⚡ 使用流程

```
1. 上传订单 Excel  →  系统自动解析地址坐标
2. 添加车辆信息   →  设置载重 / 容积约束
3. 路径优化       →  设置仓库地址，点击「开始优化」
4. 查看地图       →  各车辆路线高亮展示
5. 导出结果       →  下载 Excel 配送方案
```

---

## 🔧 技术架构

```
Frontend  ── HTML5 / CSS3 / Vanilla JS
Backend   ── Python Flask
Database  ── SQLite (transport.db)
Map       ── 高德地图 JS API 2.0
Algorithm ── Clarke-Wright Savings + 2-opt
```

### VRP 算法说明

- **Clarke-Wright Savings Algorithm**：计算所有订单对之间的「节省距离」，贪心合并路线
- **2-opt Local Search**：对每条路线进行两点交换优化，降低总行驶距离
- **容量约束**：同时满足车辆载重 & 容积限制
- **多车辆分配**：将优化后的路线贪心分配到容量最大的可用车辆

---

## 🗺️ 高德地图 API 配置

| 类型 | Key |
|------|-----|
| Web 服务 Key（地理编码） | `6d352460f8e0acc5ff52b4b07352d185` |
| JS API Key（地图显示） | `e1f18f1bfe9135adfd7c2d08af24d9bb` |
| JS 安全密钥 | `42ca20157f905a1ca5b11043e93bc1e4` |

---

## 📁 项目结构

```
transport/
├── app.py              # Flask 后端（全部 API）
├── vrp_solver.py       # VRP 优化算法
├── requirements.txt    # Python 依赖
├── start.sh            # Mac/Linux 启动脚本
├── start.bat           # Windows 启动脚本
├── transport.db        # SQLite 数据库（运行后自动创建）
└── templates/
    └── index.html      # 前端 SPA
```