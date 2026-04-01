@echo off
chcp 65001 >nul
echo.
echo ========================================
echo   智慧工地平台 - 一键部署脚本
echo ========================================
echo.

:menu
echo 请选择部署方式：
echo.
echo [1] 部署到 Vercel（推荐，免费）
echo [2] 部署到 GitHub Pages（免费）
echo [3] 部署到 Netlify（免费）
echo [4] 本地测试运行
echo [5] 查看部署指南
echo [6] 退出
echo.

set /p choice=请输入选择 (1-6): 

if "%choice%"=="1" goto vercel
if "%choice%"=="2" goto github
if "%choice%"=="3" goto netlify
if "%choice%"=="4" goto local
if "%choice%"=="5" goto guide
if "%choice%"=="6" goto exit
echo 无效选择，请重新输入
goto menu

:vercel
echo.
echo ========================================
echo   部署到 Vercel
echo ========================================
echo.
echo 步骤1：访问 https://vercel.com 注册账号
echo 步骤2：点击 "New Project"
echo 步骤3：选择 "Import Git Repository"
echo 步骤4：授权GitHub账号
echo 步骤5：选择仓库，点击 "Deploy"
echo.
echo 详细步骤请查看：部署指南.md
echo.
pause
goto menu

:github
echo.
echo ========================================
echo   部署到 GitHub Pages
echo ========================================
echo.
echo 步骤1：访问 https://github.com 注册账号
echo 步骤2：创建新仓库
echo 步骤3：上传所有文件到仓库
echo 步骤4：在仓库设置中开启 GitHub Pages
echo 步骤5：访问 https://用户名.github.io/仓库名
echo.
echo 详细步骤请查看：部署指南.md
echo.
pause
goto menu

:netlify
echo.
echo ========================================
echo   部署到 Netlify
echo ========================================
echo.
echo 步骤1：访问 https://netlify.com 注册账号
echo 步骤2：点击 "New site from Git"
echo 步骤3：选择 GitHub 授权
echo 步骤4：选择仓库，点击 "Deploy site"
echo 步骤5：获得免费域名
echo.
echo 详细步骤请查看：部署指南.md
echo.
pause
goto menu

:local
echo.
echo ========================================
echo   本地测试运行
echo ========================================
echo.
echo 正在启动本地测试服务器...
echo.
echo 请打开浏览器访问：http://localhost:8080
echo 测试账号：admin / 123456
echo.
echo 按 Ctrl+C 停止服务器
echo.

REM 检查是否安装了Python
python --version >nul 2>&1
if errorlevel 1 (
    echo 未检测到Python，正在尝试其他方法...
    
    REM 尝试使用Node.js
    node --version >nul 2>&1
    if errorlevel 1 (
        echo 未检测到Node.js，请手动打开index.html文件
        echo 或安装Python/Node.js后重试
        pause
        goto menu
    ) else (
        echo 使用Node.js启动服务器...
        npx serve . -p 8080
    )
) else (
    echo 使用Python启动服务器...
    python -m http.server 8080
)

pause
goto menu

:guide
echo.
echo ========================================
echo   部署指南
echo ========================================
echo.
echo 详细部署指南请查看以下文件：
echo.
echo 1. 快速部署方案.md - 最简单的部署方法
echo 2. 网站部署指南.md - 完整的服务器部署
echo 3. 商业化路线图.md - 如何将平台商业化
echo.
echo 建议先使用"快速部署方案"进行测试部署。
echo.
pause
goto menu

:exit
echo.
echo 感谢使用智慧工地平台部署脚本！
echo.
pause
exit