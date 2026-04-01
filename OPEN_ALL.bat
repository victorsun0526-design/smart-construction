@echo off
echo ========================================
echo   智慧工地平台 - 打开所有必要文件
echo ========================================
echo.

echo 1. 打开操作指南...
start 操作指南.txt
timeout /t 2 /nobreak >nul

echo 2. 打开简单部署指南...
start SIMPLE_DEPLOY_GUIDE.txt
timeout /t 2 /nobreak >nul

echo 3. 打开终极解决方案页面...
start ULTIMATE_SOLUTION.html
timeout /t 2 /nobreak >nul

echo.
echo ========================================
echo   重要提醒
echo ========================================
echo.
echo ❌ 不要点击网页上的"打开文件"按钮！
echo.
echo ✅ 正确做法：
echo 1. 手动在文件夹中双击文件
echo 2. 按照文本指南操作
echo 3. 不要依赖网页按钮
echo.
echo ========================================
echo   您的网站信息
echo ========================================
echo.
echo 网站：https://smart-construction.vercel.app
echo 账号：admin / 123456
echo 时间：7分钟部署
echo 成本：0元
echo.
echo 按任意键退出...
pause >nul