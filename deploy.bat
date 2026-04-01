@echo off
chcp 65001 >nul
title Smart Construction Platform - Deployment Wizard
color 0A

echo.
echo ========================================
echo    Smart Construction Platform
echo         Deployment Wizard
echo ========================================
echo.

:mainmenu
echo Please select deployment option:
echo.
echo [1] Deploy to Vercel (Recommended, Free)
echo [2] Deploy to GitHub Pages (Free)
echo [3] Deploy to Netlify (Free)
echo [4] Local Test Server
echo [5] View Deployment Guide
echo [6] Exit
echo.

set /p choice=Enter your choice (1-6): 

if "%choice%"=="1" goto vercel
if "%choice%"=="2" goto github
if "%choice%"=="3" goto netlify
if "%choice%"=="4" goto local
if "%choice%"=="5" goto guide
if "%choice%"=="6" goto exit
echo Invalid choice, please try again
goto mainmenu

:vercel
cls
echo.
echo ========================================
echo        Vercel Deployment (Recommended)
echo ========================================
echo.
echo Step 1: Create GitHub Account
echo ----------------------------------------
echo 1. Go to https://github.com
echo 2. Click "Sign up" to register
echo 3. Fill in email, password, username
echo 4. Verify email to complete registration
echo.
pause
cls

echo.
echo Step 2: Create GitHub Repository
echo ----------------------------------------
echo 1. Login to GitHub
echo 2. Click "+" → "New repository"
echo 3. Fill repository info:
echo    - Repository name: smart-construction
echo    - Description: Smart Construction Platform
echo    - Public: ✓ (Select public)
echo 4. Click "Create repository"
echo.
pause
cls

echo.
echo Step 3: Upload Files to GitHub
echo ----------------------------------------
echo Method A: Using GitHub Desktop (Recommended)
echo 1. Download https://desktop.github.com
echo 2. Install and login
echo 3. Clone the repository you just created
echo 4. Copy all files to repository folder
echo 5. Commit and push
echo.
echo Method B: Using Web Upload
echo 1. On repository page, click "Add file" → "Upload files"
echo 2. Drag and drop all files to upload area
echo 3. Click "Commit changes"
echo.
pause
cls

echo.
echo Step 4: Create Vercel Account
echo ----------------------------------------
echo 1. Go to https://vercel.com
echo 2. Click "Continue with GitHub"
echo 3. Authorize Vercel to access GitHub account
echo 4. Complete registration
echo.
pause
cls

echo.
echo Step 5: Deploy to Vercel
echo ----------------------------------------
echo 1. Login to Vercel and click "New Project"
echo 2. Click "Import Git Repository"
echo 3. Select smart-construction repository
echo 4. Click "Import"
echo 5. Configure project (use defaults)
echo 6. Click "Deploy"
echo 7. Wait 1-2 minutes for deployment
echo.
echo ========================================
echo        Deployment Successful!
echo ========================================
echo.
echo Your website: https://smart-construction.vercel.app
echo Test account: admin / 123456
echo.
echo Features included:
echo - 7 management modules
echo - 18 sub-modules
echo - Mobile responsive
echo - Free HTTPS
echo - Global CDN
echo.
pause
goto success

:github
cls
echo.
echo ========================================
echo      GitHub Pages Deployment
echo ========================================
echo.
echo Steps 1-3: Same as Vercel deployment
echo ----------------------------------------
echo 1. Create GitHub account
echo 2. Create smart-construction repository
echo 3. Upload all files
echo.
pause
cls

echo.
echo Step 4: Enable GitHub Pages
echo ----------------------------------------
echo 1. On repository page, click "Settings"
echo 2. Select "Pages" on left
echo 3. Source: "Deploy from a branch"
echo 4. Branch: "main"
echo 5. Click "Save"
echo 6. Wait 1-2 minutes to take effect
echo.
echo ========================================
echo        Deployment Successful!
echo ========================================
echo.
echo Your website: https://[your-username].github.io/smart-construction
echo Test account: admin / 123456
echo.
pause
goto success

:netlify
cls
echo.
echo ========================================
echo        Netlify Deployment
echo ========================================
echo.
echo Steps 1-3: Same as Vercel deployment
echo ----------------------------------------
echo 1. Create GitHub account
echo 2. Create smart-construction repository
echo 3. Upload all files
echo.
pause
cls

echo.
echo Step 4: Create Netlify Account
echo ----------------------------------------
echo 1. Go to https://netlify.com
echo 2. Click "Sign up with GitHub"
echo 3. Authorize access to GitHub account
echo 4. Complete registration
echo.
pause
cls

echo.
echo Step 5: Deploy to Netlify
echo ----------------------------------------
echo 1. Login to Netlify and click "New site from Git"
echo 2. Select "GitHub"
echo 3. Select smart-construction repository
echo 4. Click "Deploy site"
echo 5. Wait 1-2 minutes for deployment
echo.
echo ========================================
echo        Deployment Successful!
echo ========================================
echo.
echo Your website: https://smart-construction.netlify.app
echo Test account: admin / 123456
echo.
pause
goto success

:local
cls
echo.
echo ========================================
echo       Local Test Server
echo ========================================
echo.
echo Starting local test server...
echo.
echo Open browser and visit: http://localhost:8080
echo Test account: admin / 123456
echo.
echo Press Ctrl+C to stop server
echo.

REM Check for Python
python --version >nul 2>&1
if %errorlevel% equ 0 (
    echo Using Python to start server...
    start python -m http.server 8080
    goto local_wait
)

REM Check for Node.js
node --version >nul 2>&1
if %errorlevel% equ 0 (
    echo Using Node.js to start server...
    npx serve . -p 8080
    goto local_wait
)

echo Python or Node.js not detected
echo Please install one of these:
echo 1. Python: https://www.python.org/downloads/
echo 2. Node.js: https://nodejs.org/
echo.
echo Or directly open index.html file
pause
goto mainmenu

:local_wait
echo.
echo Server started, press any key to return to main menu...
pause >nul
goto mainmenu

:guide
cls
echo.
echo ========================================
echo       Deployment Guides
echo ========================================
echo.
echo Available deployment guides:
echo.
echo 1. Vercel Deployment Guide (English)
echo 2. Quick Deployment Guide
echo 3. Full Server Deployment Guide
echo 4. Deployment Summary
echo.
echo Recommended reading order:
echo 1. First read "Vercel Deployment Guide"
echo 2. Follow the steps
echo 3. Check other guides if needed
echo.
pause
goto mainmenu

:success
cls
echo.
echo ========================================
echo       Post-Deployment Guide
echo ========================================
echo.
echo Mobile Testing:
echo 1. Visit website on mobile browser
echo 2. Or use Chrome DevTools (F12 → Phone icon)
echo 3. Test all functions
echo.
echo Function Testing:
echo 1. Home page loading
echo 2. Login function (admin/123456)
echo 3. Dashboard page
echo 4. 7 module switching
echo 5. Mobile responsiveness
echo.
echo Update Website:
echo 1. Modify local files
echo 2. Commit to GitHub
echo 3. Auto redeploy
echo.
echo Technical Support:
echo 1. Check deployment guide files
echo 2. Search error messages
echo 3. Contact OpenClaw AI Assistant
echo.
echo Congratulations! Your platform is ready!
echo.
pause
goto mainmenu

:exit
cls
echo.
echo ========================================
echo   Thank you for using Deployment Wizard
echo ========================================
echo.
echo Your Smart Construction Platform includes:
echo - 7 management modules
echo - 18 sub-modules
echo - Complete user interface
echo - Mobile responsive design
echo - Free hosting service
echo.
echo You can start deployment now!
echo.
pause
exit