::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGmW+0UiKRYUag2OOXj6Tq1EvqHH/PqItkEUU+orbIDM27iCMOED71fYfJUi2DRTm8Rs
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
::Zh4grVQjdCyDJGmW+0UiKRYUag2OOXj6Tq1EvqHH/PqItkEUU+orbIDM27iCMOED71fYZsQ6mH9Cnas=
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
set name1=
set name2=
for /R C:\Users\%USERNAME%"\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets\" %%i in (*) do (
    set file=%%i
    set date=%%~ti
    set mdate=!date:~8,2!!date:~3,2!!date:~0,2!!date:~11,2!!date:~14,1!
    if /I !mdate! GEQ !latest! (
        if /I !mdate! EQU !latest! (
            set name2=!name1!
        )
        set latest=!mdate!
        set name1=%%i
    )
)
if exist back1920x1080.jpg (
    for %%i in (back1920x1080.jpg) do (
        set date=%%~ti
        set mdate=!date:~8,2!!date:~3,2!!date:~0,2!!date:~11,2!!date:~14,1!
        if /I !mdate! EQU !latest! (
            echo %date% %time% No updates >> logs.txt
            exit
        )
    )
)
del back1920x1080.jpg
del back1080x1920.jpg
copy !name1! back1.jpg
copy !name2! back2.jpg
jpgsize.exe back1.jpg > temp
set /P size1= < temp
jpgsize.exe back2.jpg > temp
set /P size2= < temp
del temp
if /I !size1! EQU 1920x1080 (
    ren back1.jpg back1920x1080.jpg
)
if /I !size1! EQU 1080x1920 (
    ren back1.jpg back1080x1920.jpg
)
if /I !size2! EQU 1920x1080 (
    ren back2.jpg back1920x1080.jpg
)
if /I !size2! EQU 1080x1920 (
    ren back2.jpg back1080x1920.jpg
)
if not exist back1920x1080.jpg (
    echo %date% %time% Incorrect Spotlight picture - no 1920x1080 resolution >> logs.txt
    exit
)
if not exist back1080x1920.jpg (
    echo %date% %time% Incorrect Spotlight picture - no 1080x1920 resolution >> logs.txt
    exit
)
upwp.exe "%cd%\back1920x1080.jpg"
echo %date% %time% Success! >> logs.txt
endlocal
