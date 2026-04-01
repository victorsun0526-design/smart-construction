@echo off
chcp 65001 >nul
title Smart Construction Platform - Complete Test
color 0A

echo.
echo ========================================
echo   COMPLETE FUNCTIONAL TEST
echo ========================================
echo.

echo Step 1: Opening test pages...
echo.
start "" "test.html"
timeout /t 2 /nobreak >nul

start "" "FINAL_CHECK.html"
timeout /t 2 /nobreak >nul

echo Step 2: Testing main pages...
echo.
start "" "index.html"
timeout /t 1 /nobreak >nul

start "" "login.html"
timeout /t 1 /nobreak >nul

start "" "dashboard.html"
timeout /t 1 /nobreak >nul

echo.
echo ========================================
echo   TEST INSTRUCTIONS
echo ========================================
echo.
echo 1. TEST.HTML - File check
echo    - Verify all files exist
echo    - Click test links
echo.
echo 2. FINAL_CHECK.HTML - Full test
echo    - Test all 7 modules
echo    - Check mobile responsiveness
echo    - Verify login function
echo.
echo 3. MANUAL TEST
echo    - Open index.html
echo    - Click "Progress Management" icon
echo    - Try login (admin/123456)
echo    - Test dashboard navigation
echo.
echo ========================================
echo   TEST CREDENTIALS
echo ========================================
echo.
echo Username: admin
echo Password: 123456
echo.
echo ========================================
echo   DEPLOYMENT READY
echo ========================================
echo.
echo If all tests pass, you can deploy:
echo 1. Double click DEPLOY.bat
echo 2. Follow the 5 steps
echo 3. Your website will be ready in 7 minutes
echo.
echo Website: https://smart-construction.vercel.app
echo.
pause