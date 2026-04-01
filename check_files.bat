@echo off
echo ========================================
echo   智慧工地平台 - 文件检查
echo ========================================
echo.

echo 检查核心文件...
echo.

if exist index.html (
    echo ✅ index.html - 存在
) else (
    echo ❌ index.html - 缺失
)

if exist login.html (
    echo ✅ login.html - 存在
) else (
    echo ❌ login.html - 缺失
)

if exist dashboard.html (
    echo ✅ dashboard.html - 存在
) else (
    echo ❌ dashboard.html - 缺失
)

if exist css\style.css (
    echo ✅ css\style.css - 存在
) else (
    echo ❌ css\style.css - 缺失
)

if exist js\main.js (
    echo ✅ js\main.js - 存在
) else (
    echo ❌ js\main.js - 缺失
)

if exist js\login.js (
    echo ✅ js\login.js - 存在
) else (
    echo ❌ js\login.js - 缺失
)

if exist js\dashboard.js (
    echo ✅ js\dashboard.js - 存在
) else (
    echo ❌ js\dashboard.js - 缺失
)

echo.
echo ========================================
echo   手动测试
echo ========================================
echo.
echo 请手动测试以下页面：
echo 1. 双击 index.html - 应该看到7个模块图标
echo 2. 双击 login.html - 应该看到登录表单
echo 3. 双击 dashboard.html - 应该看到左侧菜单
echo.
echo 测试账号：admin / 123456
echo.
echo 如果页面能正常打开，说明文件没问题。
echo.
echo ========================================
echo   部署信息
echo ========================================
echo.
echo 网站地址：https://smart-construction.vercel.app
echo 部署时间：7分钟
echo 部署成本：0元
echo.
echo 按任意键打开测试页面...
pause >nul
start simple_test.html