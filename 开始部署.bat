@echo off
chcp 65001 >nul
title 智慧工地平台 - 一键部署向导
color 0A

echo.
echo ========================================
echo    智慧工地平台 - 一键部署向导
echo ========================================
echo.

:mainmenu
echo 请选择部署方案：
echo.
echo [1] Vercel部署（推荐，完全免费）
echo [2] GitHub Pages部署（免费）
echo [3] Netlify部署（免费）
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
goto mainmenu

:vercel
cls
echo.
echo ========================================
echo        Vercel部署流程（推荐）
echo ========================================
echo.
echo 第1步：注册GitHub账号
echo ----------------------------------------
echo 1. 访问 https://github.com
echo 2. 点击 "Sign up" 注册
echo 3. 填写邮箱、密码、用户名
echo 4. 验证邮箱完成注册
echo.
pause
cls

echo.
echo 第2步：创建GitHub仓库
echo ----------------------------------------
echo 1. 登录GitHub
echo 2. 点击右上角 "+" → "New repository"
echo 3. 填写仓库信息：
echo    - Repository name: smart-construction
echo    - Description: 智慧工地管理平台
echo    - Public: ✓ (选择公开)
echo 4. 点击 "Create repository"
echo.
pause
cls

echo.
echo 第3步：上传文件到GitHub
echo ----------------------------------------
echo 方法A：使用GitHub Desktop（推荐）
echo 1. 下载 https://desktop.github.com
echo 2. 安装并登录
echo 3. 克隆刚创建的仓库
echo 4. 复制所有文件到仓库文件夹
echo 5. 提交并推送
echo.
echo 方法B：使用网页上传
echo 1. 在仓库页面点击 "Add file" → "Upload files"
echo 2. 拖拽所有文件到上传区域
echo 3. 点击 "Commit changes"
echo.
pause
cls

echo.
echo 第4步：注册Vercel账号
echo ----------------------------------------
echo 1. 访问 https://vercel.com
echo 2. 点击 "Continue with GitHub"
echo 3. 授权Vercel访问GitHub账号
echo 4. 完成注册
echo.
pause
cls

echo.
echo 第5步：部署到Vercel
echo ----------------------------------------
echo 1. 登录Vercel后点击 "New Project"
echo 2. 点击 "Import Git Repository"
echo 3. 选择 smart-construction 仓库
echo 4. 点击 "Import"
echo 5. 配置项目（使用默认即可）
echo 6. 点击 "Deploy"
echo 7. 等待1-2分钟部署完成
echo.
echo ========================================
echo        部署成功！
echo ========================================
echo.
echo 您的网站地址：https://smart-construction.vercel.app
echo 测试账号：admin / 123456
echo.
echo 功能包含：
echo - 7大管理模块
echo - 18个子模块
echo - 移动端适配
echo - 免费HTTPS
echo - 全球CDN加速
echo.
pause
goto success

:github
cls
echo.
echo ========================================
echo      GitHub Pages部署流程
echo ========================================
echo.
echo 第1-3步：与Vercel部署相同
echo ----------------------------------------
echo 1. 注册GitHub账号
echo 2. 创建 smart-construction 仓库
echo 3. 上传所有文件
echo.
pause
cls

echo.
echo 第4步：开启GitHub Pages
echo ----------------------------------------
echo 1. 在仓库页面点击 "Settings"
echo 2. 左侧选择 "Pages"
echo 3. Source选择 "Deploy from a branch"
echo 4. Branch选择 "main"
echo 5. 点击 "Save"
echo 6. 等待1-2分钟生效
echo.
echo ========================================
echo        部署成功！
echo ========================================
echo.
echo 您的网站地址：https://[您的用户名].github.io/smart-construction
echo 测试账号：admin / 123456
echo.
pause
goto success

:netlify
cls
echo.
echo ========================================
echo        Netlify部署流程
echo ========================================
echo.
echo 第1-3步：与Vercel部署相同
echo ----------------------------------------
echo 1. 注册GitHub账号
echo 2. 创建 smart-construction 仓库
echo 3. 上传所有文件
echo.
pause
cls

echo.
echo 第4步：注册Netlify账号
echo ----------------------------------------
echo 1. 访问 https://netlify.com
echo 2. 点击 "Sign up with GitHub"
echo 3. 授权访问GitHub账号
echo 4. 完成注册
echo.
pause
cls

echo.
echo 第5步：部署到Netlify
echo ----------------------------------------
echo 1. 登录Netlify后点击 "New site from Git"
echo 2. 选择 "GitHub"
echo 3. 选择 smart-construction 仓库
echo 4. 点击 "Deploy site"
echo 5. 等待1-2分钟部署完成
echo.
echo ========================================
echo        部署成功！
echo ========================================
echo.
echo 您的网站地址：https://smart-construction.netlify.app
echo 测试账号：admin / 123456
echo.
pause
goto success

:local
cls
echo.
echo ========================================
echo       本地测试运行
echo ========================================
echo.
echo 正在启动本地测试服务器...
echo.
echo 请打开浏览器访问：http://localhost:8080
echo 测试账号：admin / 123456
echo.
echo 按 Ctrl+C 停止服务器
echo.

REM 检查Python
python --version >nul 2>&1
if %errorlevel% equ 0 (
    echo 使用Python启动服务器...
    start python -m http.server 8080
    goto local_wait
)

REM 检查Node.js
node --version >nul 2>&1
if %errorlevel% equ 0 (
    echo 使用Node.js启动服务器...
    npx serve . -p 8080
    goto local_wait
)

echo 未检测到Python或Node.js
echo 请安装以下任一工具：
echo 1. Python: https://www.python.org/downloads/
echo 2. Node.js: https://nodejs.org/
echo.
echo 或者直接双击打开 index.html 文件
pause
goto mainmenu

:local_wait
echo.
echo 服务器已启动，按任意键返回主菜单...
pause >nul
goto mainmenu

:guide
cls
echo.
echo ========================================
echo       部署指南
echo ========================================
echo.
echo 可用的部署指南文件：
echo.
echo 1. Vercel一键部署步骤.md - 图文详细步骤
echo 2. 快速部署方案.md - 简单快速方法
echo 3. 网站部署指南.md - 完整服务器部署
echo 4. 远程访问部署总结.md - 部署总结
echo.
echo 推荐阅读顺序：
echo 1. 先看 "Vercel一键部署步骤.md"
echo 2. 按照步骤操作
echo 3. 遇到问题查看其他指南
echo.
pause
goto mainmenu

:success
cls
echo.
echo ========================================
echo       部署后操作指南
echo ========================================
echo.
echo 📱 移动端测试：
echo 1. 用手机浏览器访问网站
echo 2. 或电脑Chrome按 F12 → 点击手机图标
echo 3. 测试所有功能
echo.
echo 🔧 功能测试：
echo 1. 首页加载
echo 2. 登录功能 (admin/123456)
echo 3. 工作台页面
echo 4. 7大模块切换
echo 5. 移动端适配
echo.
echo 🔄 更新网站：
echo 1. 修改本地文件
echo 2. 提交到GitHub
echo 3. 自动重新部署
echo.
echo 📞 技术支持：
echo 1. 查看部署指南文件
echo 2. 搜索具体错误信息
echo 3. 联系OpenClaw AI助手
echo.
echo 🎊 恭喜！您的智慧工地平台已准备就绪！
echo.
pause
goto mainmenu

:exit
cls
echo.
echo ========================================
echo       感谢使用智慧工地平台部署向导
echo ========================================
echo.
echo 您的智慧工地平台包含：
echo - 7大管理模块
echo - 18个子模块
echo - 完整的用户界面
echo - 移动端适配
echo - 免费托管服务
echo.
echo 现在可以开始部署了！
echo.
pause
exit