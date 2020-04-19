::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGmW+0UiKRYUag2OOXj6Tq1EvqHH+PqEqkwTU+ctRIbY1brAKeMcig==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSzk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGmW+0UiKRYUag2OOXj6Tq1EvqHH+PqEqkwTU+ctRJyJzfqLOOVz
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
setlocal enabledelayedexpansion
if not exist C:\Users\%USERNAME%"\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets\" (
    start cmd /C "color 0C && echo Seems, you don't have a path C:\Users\%USERNAME%\ApData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets\ && echo It is the path to Windows Spotlight && pause"
    echo %date% %time% Fail. There is not the path >> logs.txt
    exit
)
set latest=0
set name=
for /R C:\Users\%USERNAME%"\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets\" %%i in (*) do (
    set file=%%i
    set date=%%~ti
    set mdate=!date:~6,4!!date:~3,2!!date:~0,2!!date:~11,2!!date:~14,2!
    if /I !mdate! GTR !latest! (
        set latest=!mdate!
        set name=%%i
    )
)
copy !name! back.jpg
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%cd%\back.jpg" /f
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
echo %date% %time% Success! >> logs.txt
endlocal
