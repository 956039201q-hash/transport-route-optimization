@echo off
cd /d "%~dp0"
python -m pip install flask flask-cors openpyxl requests -q
python app.py
pause
