@echo off  
Echo Install Powertoys and Terminal  
REM Powertoys  
winget install Microsoft.Powertoys  
if %ERRORLEVEL% EQU 0 Echo Powertoys installed successfully.  
REM Terminal  
winget install Microsoft.WindowsTerminal  
if %ERRORLEVEL% EQU 0 Echo Terminal installed successfully.   %ERRORLEVEL%

REM Firefox
Echo Installing Firefox
winget install -e --id Mozilla.Firefox
if %ERRORLEVEL% EQU 0 Echo Firefox installed successfully.

REM IDM
Echo Installing IDM
winget install -e --id Tonec.InternetDownloadManager
if %ERRORLEVEL% EQU 0 Echo IDM installed successfully.

REM 7Zip
Echo Installing 7Zip
winget install -e --id 7zip.7zip
if %ERRORLEVEL% EQU 0 Echo 7Zip installed successfully.

REM Brave
Echo Installing Brave
winget install -e --id BraveSoftware.BraveBrowser
if %ERRORLEVEL% EQU 0 Echo Brave installed successfully.

REM Dropbox
Echo Installing Dropbox
winget install -e --id Dropbox.Dropbox
if %ERRORLEVEL% EQU 0 Echo Dropbox installed successfully.

REM KeePassXC
Echo Installing KeePassXC
winget install -e --id KeePassXCTeam.KeePassXC
if %ERRORLEVEL% EQU 0 Echo KeePassXC installed successfully.

REM Thunderbird
Echo Installing Thunderbird
winget install -e --id Mozilla.Thunderbird
if %ERRORLEVEL% EQU 0 Echo Thunderbird installed successfully.

REM Thunderbird
Echo Installing Thunderbird
winget install -e --id Mozilla.Thunderbird
if %ERRORLEVEL% EQU 0 Echo Thunderbird installed successfully.

REM VSCode
Echo Installing VSCode
winget install -e --id Microsoft.VisualStudioCode
if %ERRORLEVEL% EQU 0 Echo VSCode installed successfully.

REM VLC
Echo Installing VLC
winget install -e --id VideoLAN.VLC
if %ERRORLEVEL% EQU 0 Echo VLC installed successfully.

REM Potplayer
Echo Installing Potplayer
winget install -e --id Daum.Potplayer
if %ERRORLEVEL% EQU 0 Echo Potplayer installed successfully.

REM Speccy
Echo Installing Speccy
winget install -e --id Piriform.Speccy
if %ERRORLEVEL% EQU 0 Echo Speccy installed successfully.

REM Notepad++
Echo Installing Notepad++
winget install -e --id Notepad++.Notepad++
if %ERRORLEVEL% EQU 0 Echo Notepad++ installed successfully.

REM Notepad++
Echo Installing Notepad++
winget install -e --id Notepad++.Notepad++
if %ERRORLEVEL% EQU 0 Echo Notepad++ installed successfully.

REM VeraCrypt
Echo Installing VeraCrypt
winget install -e --id Notepad++.Notepad++
if %ERRORLEVEL% EQU 0 Echo VeraCrypt installed successfully.

