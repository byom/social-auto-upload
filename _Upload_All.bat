@echo off
title Automation Script Runner

echo [INFO] Starting the automation process...
echo.

REM 步骤 1: 激活 Conda 环境
echo [STEP 1/3] Activating Conda environment 'social-auto-upload'...
call conda activate social-auto-upload

REM 检查 Conda 环境是否成功激活
if %errorlevel% neq 0 (
    echo [ERROR] Failed to activate Conda environment.
    echo Please make sure the environment 'social-auto-upload' exists and Conda is correctly configured in your system's PATH.
    goto :eof
)
echo [SUCCESS] Conda environment activated.
echo.

REM 步骤 2: 依次执行 Python 上传脚本
echo [STEP 2/3] Running Python upload scripts...
python upload_video_to_douyin.py
python upload_video_to_kuaishou.py
python upload_video_to_xiaohongshu.py
python upload_video_to_tencent.py
python upload_video_to_baijiahao.py
echo [SUCCESS] All Python scripts have been executed.
echo.

REM 步骤 3: 运行 NPM 脚本
echo [STEP 3/3] Starting NPM script 'dev'...
npm run dev

echo.
echo [INFO] All tasks are finished. The window will remain open.
pause

:eof