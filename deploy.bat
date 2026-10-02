@echo off
REM ============================================================
REM  Flinginator deploy: uploads everything in .\site to
REM  https://flinginator.com  (double-click to run)
REM ============================================================
cd /d "%~dp0"
set KEY=%USERPROFILE%\.ssh\flinginator
set HOST=ubuntu@flinginator.com

echo [1/3] Clearing upload staging area on server...
ssh -i "%KEY%" %HOST% "rm -rf ~/deploy_tmp" || goto :fail

echo [2/3] Uploading site files...
scp -i "%KEY%" -r site %HOST%:~/deploy_tmp || goto :fail

echo [3/3] Publishing...
ssh -i "%KEY%" %HOST% "cp -r ~/deploy_tmp/. /var/www/flinginator/ && rm -rf ~/deploy_tmp" || goto :fail

echo.
echo DONE. Live check:
curl -s -o NUL -w "  https://flinginator.com answered HTTP %%{http_code}" https://flinginator.com
echo.
echo.
pause
exit /b 0

:fail
echo.
echo *** DEPLOY FAILED - nothing after the failed step ran. Read the error above. ***
pause
exit /b 1
