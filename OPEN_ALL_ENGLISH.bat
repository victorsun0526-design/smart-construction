@echo off
chcp 65001 >nul
title Smart Construction Platform - Open All Files
color 0A

echo.
echo ========================================
echo   Smart Construction Platform
echo        Open All Required Files
echo ========================================
echo.

echo 1. Opening Operation Guide...
start "操作指南.txt"
timeout /t 2 /nobreak >nul

echo 2. Opening Simple Deployment Guide...
start "SIMPLE_DEPLOY_GUIDE.txt"
timeout /t 2 /nobreak >nul

echo 3. Opening Ultimate Solution Page...
start "ULTIMATE_SOLUTION.html"
timeout /t 2 /nobreak >nul

echo.
echo ========================================
echo   IMPORTANT REMINDER
echo ========================================
echo.
echo DO NOT click "Open File" buttons on web pages!
echo.
echo CORRECT METHOD:
echo 1. Manually double-click files in folder
echo 2. Follow text guide instructions
echo 3. Do not rely on web page buttons
echo.
echo ========================================
echo   YOUR WEBSITE INFORMATION
echo ========================================
echo.
echo Website: https://smart-construction.vercel.app
echo Test Account: admin / 123456
echo Deployment Time: 7 minutes
echo Cost: 0 RMB
echo.
echo Press any key to exit...
pause >nul