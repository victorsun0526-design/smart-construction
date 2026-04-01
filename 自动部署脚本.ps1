# 智慧工地平台 - 自动部署脚本
# 作者：OpenClaw AI助手
# 日期：2026-04-01

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "   智慧工地平台 - 自动部署脚本" -ForegroundColor Yellow
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

# 检查当前目录
$currentDir = Get-Location
Write-Host "当前目录: $currentDir" -ForegroundColor Green

# 检查必要文件
Write-Host "`n📋 检查文件完整性..." -ForegroundColor Cyan

$requiredFiles = @(
    "index.html",
    "login.html", 
    "dashboard.html",
    "css/style.css",
    "js/main.js",
    "js/login.js",
    "js/dashboard.js"
)

$allFilesExist = $true
foreach ($file in $requiredFiles) {
    if (Test-Path $file) {
        Write-Host "  ✓ $file" -ForegroundColor Green
    } else {
        Write-Host "  ✗ $file (缺失)" -ForegroundColor Red
        $allFilesExist = $false
    }
}

if (-not $allFilesExist) {
    Write-Host "`n❌ 文件不完整，请检查缺失的文件" -ForegroundColor Red
    pause
    exit 1
}

Write-Host "`n✅ 所有必要文件都存在" -ForegroundColor Green

# 显示部署选项
Write-Host "`n🎯 选择部署方案：" -ForegroundColor Cyan
Write-Host "1. Vercel部署 (推荐，完全免费)" -ForegroundColor Yellow
Write-Host "2. GitHub Pages部署 (免费)" -ForegroundColor Yellow
Write-Host "3. Netlify部署 (免费)" -ForegroundColor Yellow
Write-Host "4. 本地测试服务器" -ForegroundColor Yellow
Write-Host "5. 查看详细部署指南" -ForegroundColor Yellow
Write-Host ""

$choice = Read-Host "请输入选择 (1-5)"

switch ($choice) {
    "1" { DeployVercel }
    "2" { DeployGitHubPages }
    "3" { DeployNetlify }
    "4" { StartLocalServer }
    "5" { ShowDeploymentGuide }
    default {
        Write-Host "无效选择" -ForegroundColor Red
        pause
        exit 1
    }
}

function DeployVercel {
    Write-Host "`n🚀 Vercel部署流程" -ForegroundColor Cyan
    Write-Host "==================" -ForegroundColor Cyan
    
    Write-Host "`n第1步：注册GitHub账号" -ForegroundColor Yellow
    Write-Host "------------------------" -ForegroundColor Yellow
    Write-Host "1. 访问 https://github.com" -ForegroundColor White
    Write-Host "2. 点击 'Sign up' 注册新账号" -ForegroundColor White
    Write-Host "3. 填写邮箱、密码、用户名" -ForegroundColor White
    Write-Host "4. 验证邮箱完成注册" -ForegroundColor White
    Write-Host ""
    $continue = Read-Host "完成第1步后按回车继续"
    
    Write-Host "`n第2步：创建GitHub仓库" -ForegroundColor Yellow
    Write-Host "------------------------" -ForegroundColor Yellow
    Write-Host "1. 登录GitHub" -ForegroundColor White
    Write-Host "2. 点击右上角 '+' → 'New repository'" -ForegroundColor White
    Write-Host "3. 填写仓库信息：" -ForegroundColor White
    Write-Host "   - Repository name: smart-construction" -ForegroundColor White
    Write-Host "   - Description: 智慧工地管理平台" -ForegroundColor White
    Write-Host "   - Public: ✓ (选择公开)" -ForegroundColor White
    Write-Host "4. 点击 'Create repository'" -ForegroundColor White
    Write-Host ""
    $continue = Read-Host "完成第2步后按回车继续"
    
    Write-Host "`n第3步：上传文件到GitHub" -ForegroundColor Yellow
    Write-Host "------------------------" -ForegroundColor Yellow
    Write-Host "方法A：使用GitHub Desktop（推荐）" -ForegroundColor White
    Write-Host "1. 下载 https://desktop.github.com" -ForegroundColor White
    Write-Host "2. 安装并登录" -ForegroundColor White
    Write-Host "3. 克隆刚创建的仓库" -ForegroundColor White
    Write-Host "4. 复制所有文件到仓库文件夹" -ForegroundColor White
    Write-Host "5. 提交并推送" -ForegroundColor White
    Write-Host ""
    Write-Host "方法B：使用网页上传" -ForegroundColor White
    Write-Host "1. 在仓库页面点击 'Add file' → 'Upload files'" -ForegroundColor White
    Write-Host "2. 拖拽所有文件到上传区域" -ForegroundColor White
    Write-Host "3. 点击 'Commit changes'" -ForegroundColor White
    Write-Host ""
    $continue = Read-Host "完成第3步后按回车继续"
    
    Write-Host "`n第4步：注册Vercel账号" -ForegroundColor Yellow
    Write-Host "------------------------" -ForegroundColor Yellow
    Write-Host "1. 访问 https://vercel.com" -ForegroundColor White
    Write-Host "2. 点击 'Continue with GitHub'" -ForegroundColor White
    Write-Host "3. 授权Vercel访问GitHub账号" -ForegroundColor White
    Write-Host "4. 完成注册" -ForegroundColor White
    Write-Host ""
    $continue = Read-Host "完成第4步后按回车继续"
    
    Write-Host "`n第5步：部署到Vercel" -ForegroundColor Yellow
    Write-Host "------------------------" -ForegroundColor Yellow
    Write-Host "1. 登录Vercel后点击 'New Project'" -ForegroundColor White
    Write-Host "2. 点击 'Import Git Repository'" -ForegroundColor White
    Write-Host "3. 选择 smart-construction 仓库" -ForegroundColor White
    Write-Host "4. 点击 'Import'" -ForegroundColor White
    Write-Host "5. 配置项目（使用默认即可）" -ForegroundColor White
    Write-Host "6. 点击 'Deploy'" -ForegroundColor White
    Write-Host "7. 等待1-2分钟部署完成" -ForegroundColor White
    Write-Host ""
    
    Write-Host "🎉 部署完成！" -ForegroundColor Green
    Write-Host "您的网站地址：https://smart-construction.vercel.app" -ForegroundColor Yellow
    Write-Host "测试账号：admin / 123456" -ForegroundColor Yellow
    
    ShowSuccessInfo
}

function DeployGitHubPages {
    Write-Host "`n🌐 GitHub Pages部署流程" -ForegroundColor Cyan
    Write-Host "======================" -ForegroundColor Cyan
    
    Write-Host "`n第1-3步：与Vercel部署相同" -ForegroundColor Yellow
    Write-Host "------------------------" -ForegroundColor Yellow
    Write-Host "1. 注册GitHub账号" -ForegroundColor White
    Write-Host "2. 创建 smart-construction 仓库" -ForegroundColor White
    Write-Host "3. 上传所有文件" -ForegroundColor White
    Write-Host ""
    $continue = Read-Host "完成第1-3步后按回车继续"
    
    Write-Host "`n第4步：开启GitHub Pages" -ForegroundColor Yellow
    Write-Host "------------------------" -ForegroundColor Yellow
    Write-Host "1. 在仓库页面点击 'Settings'" -ForegroundColor White
    Write-Host "2. 左侧选择 'Pages'" -ForegroundColor White
    Write-Host "3. Source选择 'Deploy from a branch'" -ForegroundColor White
    Write-Host "4. Branch选择 'main'" -ForegroundColor White
    Write-Host "5. 点击 'Save'" -ForegroundColor White
    Write-Host "6. 等待1-2分钟生效" -ForegroundColor White
    Write-Host ""
    
    Write-Host "🎉 部署完成！" -ForegroundColor Green
    Write-Host "您的网站地址：https://[您的用户名].github.io/smart-construction" -ForegroundColor Yellow
    Write-Host "测试账号：admin / 123456" -ForegroundColor Yellow
    
    ShowSuccessInfo
}

function DeployNetlify {
    Write-Host "`n⚡ Netlify部署流程" -ForegroundColor Cyan
    Write-Host "==================" -ForegroundColor Cyan
    
    Write-Host "`n第1-3步：与Vercel部署相同" -ForegroundColor Yellow
    Write-Host "------------------------" -ForegroundColor Yellow
    Write-Host "1. 注册GitHub账号" -ForegroundColor White
    Write-Host "2. 创建 smart-construction 仓库" -ForegroundColor White
    Write-Host "3. 上传所有文件" -ForegroundColor White
    Write-Host ""
    $continue = Read-Host "完成第1-3步后按回车继续"
    
    Write-Host "`n第4步：注册Netlify账号" -ForegroundColor Yellow
    Write-Host "------------------------" -ForegroundColor Yellow
    Write-Host "1. 访问 https://netlify.com" -ForegroundColor White
    Write-Host "2. 点击 'Sign up with GitHub'" -ForegroundColor White
    Write-Host "3. 授权访问GitHub账号" -ForegroundColor White
    Write-Host "4. 完成注册" -ForegroundColor White
    Write-Host ""
    $continue = Read-Host "完成第4步后按回车继续"
    
    Write-Host "`n第5步：部署到Netlify" -ForegroundColor Yellow
    Write-Host "------------------------" -ForegroundColor Yellow
    Write-Host "1. 登录Netlify后点击 'New site from Git'" -ForegroundColor White
    Write-Host "2. 选择 'GitHub'" -ForegroundColor White
    Write-Host "3. 选择 smart-construction 仓库" -ForegroundColor White
    Write-Host "4. 点击 'Deploy site'" -ForegroundColor White
    Write-Host "5. 等待1-2分钟部署完成" -ForegroundColor White
    Write-Host ""
    
    Write-Host "🎉 部署完成！" -ForegroundColor Green
    Write-Host "您的网站地址：https://smart-construction.netlify.app" -ForegroundColor Yellow
    Write-Host "测试账号：admin / 123456" -ForegroundColor Yellow
    
    ShowSuccessInfo
}

function StartLocalServer {
    Write-Host "`n💻 启动本地测试服务器" -ForegroundColor Cyan
    Write-Host "====================" -ForegroundColor Cyan
    
    Write-Host "`n正在启动本地服务器..." -ForegroundColor Yellow
    
    # 检查Python
    $pythonAvailable = $false
    try {
        $pythonVersion = python --version 2>&1
        if ($LASTEXITCODE -eq 0) {
            $pythonAvailable = $true
            Write-Host "检测到Python: $pythonVersion" -ForegroundColor Green
        }
    } catch {
        $pythonAvailable = $false
    }
    
    # 检查Node.js
    $nodeAvailable = $false
    try {
        $nodeVersion = node --version 2>&1
        if ($LASTEXITCODE -eq 0) {
            $nodeAvailable = $true
            Write-Host "检测到Node.js: $nodeVersion" -ForegroundColor Green
        }
    } catch {
        $nodeAvailable = $false
    }
    
    if ($pythonAvailable) {
        Write-Host "`n使用Python启动服务器..." -ForegroundColor Yellow
        Write-Host "访问地址：http://localhost:8080" -ForegroundColor Green
        Write-Host "测试账号：admin / 123456" -ForegroundColor Green
        Write-Host "按 Ctrl+C 停止服务器" -ForegroundColor Yellow
        Write-Host ""
        
        # 启动Python服务器
        Start-Process python -ArgumentList "-m http.server 8080" -NoNewWindow
    } elseif ($nodeAvailable) {
        Write-Host "`n使用Node.js启动服务器..." -ForegroundColor Yellow
        Write-Host "访问地址：http://localhost:8080" -ForegroundColor Green
        Write-Host "测试账号：admin / 123456" -ForegroundColor Green
        Write-Host "按 Ctrl+C 停止服务器" -ForegroundColor Yellow
        Write-Host ""
        
        # 检查是否安装了serve
        try {
            npx --version 2>&1 | Out-Null
            # 启动Node.js服务器
            Start-Process npx -ArgumentList "serve . -p 8080" -NoNewWindow
        } catch {
            Write-Host "需要安装serve，正在安装..." -ForegroundColor Yellow
            npm install -g serve
            Start-Process serve -ArgumentList "-p 8080" -NoNewWindow
        }
    } else {
        Write-Host "`n❌ 未检测到Python或Node.js" -ForegroundColor Red
        Write-Host "请安装以下任一工具：" -ForegroundColor Yellow
        Write-Host "1. Python: https://www.python.org/downloads/" -ForegroundColor White
        Write-Host "2. Node.js: https://nodejs.org/" -ForegroundColor White
        Write-Host ""
        Write-Host "或者直接双击打开 index.html 文件" -ForegroundColor Yellow
    }
    
    pause
}

function ShowDeploymentGuide {
    Write-Host "`n📚 详细部署指南" -ForegroundColor Cyan
    Write-Host "==============" -ForegroundColor Cyan
    
    Write-Host "`n可用的部署指南文件：" -ForegroundColor Yellow
    Write-Host "1. Vercel一键部署步骤.md - 图文详细步骤" -ForegroundColor White
    Write-Host "2. 快速部署方案.md - 简单快速方法" -ForegroundColor White
    Write-Host "3. 网站部署指南.md - 完整服务器部署" -ForegroundColor White
    Write-Host "4. 远程访问部署总结.md - 部署总结" -ForegroundColor White
    Write-Host ""
    
    Write-Host "推荐阅读顺序：" -ForegroundColor Yellow
    Write-Host "1. 先看 'Vercel一键部署步骤.md'" -ForegroundColor White
    Write-Host "2. 按照步骤操作" -ForegroundColor White
    Write-Host "3. 遇到问题查看其他指南" -ForegroundColor White
    
    pause
}

function ShowSuccessInfo {
    Write-Host "`n📱 移动端测试：" -ForegroundColor Cyan
    Write-Host "1. 用手机浏览器访问网站" -ForegroundColor White
    Write-Host "2. 或电脑Chrome按 F12 → 点击手机图标" -ForegroundColor White
    Write-Host "3. 测试所有功能" -ForegroundColor White
    
    Write-Host "`n🔧 功能测试：" -ForegroundColor Cyan
    Write-Host "1. 首页加载" -ForegroundColor White
    Write-Host "2. 登录功能 (admin/123456)" -ForegroundColor White
    Write-Host "3. 工作台页面" -ForegroundColor White
    Write-Host "4. 7大模块切换" -ForegroundColor White
    Write-Host "5. 移动端适配" -ForegroundColor White
    
    Write-Host "`n🔄 更新网站：" -ForegroundColor Cyan
    Write-Host "1. 修改本地文件" -ForegroundColor White
    Write-Host "2. 提交到GitHub" -ForegroundColor White
    Write-Host "3. 自动重新部署" -ForegroundColor White
    
    Write-Host "`n📞 技术支持：" -ForegroundColor Cyan
    Write-Host "1. 查看部署指南文件" -ForegroundColor White
    Write-Host "2. 搜索具体错误信息" -ForegroundColor White
    Write-Host "3. 联系OpenClaw AI助手" -ForegroundColor White
    
    Write-Host "`n🎊 恭喜！您的智慧工地平台已准备就绪！" -ForegroundColor Green
    
    pause
}

# 运行主函数
Write-Host "`n脚本执行完成！" -ForegroundColor Green
Write-Host "按任意键退出..." -ForegroundColor Yellow
pause