@echo off
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%cd%\back1920x1080.jpg" /f
timeout /t 1
start "" /b RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters ,1 ,True
timeout /t 1
start "" /b RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters ,1 ,True
timeout /t 1
start "" /b RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters ,1 ,True
timeout /t 1
start "" /b RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters ,1 ,True
timeout /t 1
start "" /b RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters ,1 ,True
