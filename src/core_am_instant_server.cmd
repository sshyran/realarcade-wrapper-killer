@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ AM Instant Server +-^~`+-.)     [...cRypTiCwaRe 2o16...]


:reset

%kill% aminstantservice.exe

set cid=00000000000000000000000000000000

set gameNameDashes=GAMENAME
set gameNameFirstLetter=


:amiMenu

::cls
::echo Select an option from below
::echo.
::echo.
::echo 1) Execute Normally (Must Close EXE Manually)
::echo.
::echo 2) Execute Normally Quiet (--quiet)
::echo.
::echo 3) Console Mode (--console)
::echo.
::echo 4) Service Run (--service-run)
::echo.
::echo 5) Wait AM End (--wait-am-end)
::echo.
::echo 6) Upgrade (--upgrade)
::echo.
::echo 7) Upgrade Quiet (--upgrade --quiet)
::echo.
::echo 8) Bring To Top (--bring-to-top)
::echo.
::echo 9) Version (--version)
::echo.
::echo A) Help (--help)
::echo.
::echo.

::if %os%==XP choice /c:123456789 /n
::if %os%==VISTA choice /c 123456789 /n
::if errorlevel 9 goto version
::if errorlevel 8 goto btt
::if errorlevel 7 goto upgradeq
::if errorlevel 6 goto upgrade
::if errorlevel 5 goto wae
::if errorlevel 4 goto svcrun
::if errorlevel 3 goto console
::if errorlevel 2 goto quiet
::if errorlevel 1 goto norm



:: New Menu with working options only (20160515)

set baseReq=wget -d --header="Host: localhost:12072" --header="User-Agent: AmHttpClient 1.0" --header="Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" --header="Accept-Language: en-US,en;q=0.5" --header="Accept-Encoding: gzip, deflate" --header="Referer: http://www.gamehouse.com/member/" --header="Origin: http://www.gamehouse.com" --header="Connection: keep-alive" -O "%temp%\ami-request.txt" "
set launch1=http://localhost:12072/v1/play.json?content_id=
set launch2=^&auth_token=0000000000000000000000000000000000000000"

set download1=http://www.gamehouse.com/member/api/games/downloaddetails.json?amcontentid=

set sessionID=http://www.gamehouse.com/member/api/player/getsessionid.json

:: http://games-dl.gamehouse.com/gamehouse/pc/h/hoyle-official-card-games-collection/hoyle-official-card-games-collection.rfs
set remoteRfsBase=http://games-dl.gamehouse.com/gamehouse/pc

cls
echo Current CID: %cid%
echo Current Game Name: %gameNameDashes%
echo.
echo.
echo Select an option from below
echo.
echo 1) Launch AM Micro Server
echo 2) Stop AM Micro Server
echo.
echo 3) Get New Session ID
echo.
echo 4) Trigger Game Download
echo 5) Remote RFS Extract
echo 6) Launch Game
echo.
echo 7) More Options
echo.
echo.
echo C) Enter New Game Credentials
echo.
echo X) Exit
echo.

if %os%==XP choice /c:1234567cx /n
if %os%==VISTA choice /c 1234567cx /n
if errorlevel 9 goto forceExit
if errorlevel 8 goto newCreds
if errorlevel 7 goto amiMenu2
if errorlevel 6 goto launch
if errorlevel 5 goto remote
if errorlevel 4 goto download
if errorlevel 3 goto session
if errorlevel 2 goto stop
if errorlevel 1 goto console

goto end


:amiMenu2

cls
echo Current CID: %cid%
echo Current Game Name: %gameNameDashes%
echo.
echo.
echo Select an option from below
echo.
echo 1) Check Remote Version
echo.
echo 2) Open Default Apps Directory
echo.
echo 3) 
echo.
echo 4) 
echo.
echo 5) 
echo.
echo 6) 
echo.
echo.
echo B) Go Back
echo.
echo X) Exit
echo.

if %os%==XP choice /c:123456bx /n
if %os%==VISTA choice /c 123456bx /n
if errorlevel 8 goto forceExit
if errorlevel 7 goto amiMenu
if errorlevel 6 goto amiMenu2
if errorlevel 5 goto amiMenu2
if errorlevel 4 goto amiMenu2
if errorlevel 3 goto amiMenu2
if errorlevel 2 goto openApps
if errorlevel 1 goto chkRemote

goto end


:newCreds

cls
echo Current CID: %cid%
echo Current Game Name: %gameNameDashes%
echo.
echo.
echo Enter New CID and press ENTER:
echo.
echo.
echo *** TO KEEP EXISTING VALUE, JUST PRESS ENTER ***
echo.
echo.

set /p cid=


cls
echo Current CID: %cid%
echo Current Game Name: %gameNameDashes%
echo.
echo.
echo Enter New Game Name and press ENTER:
echo.
echo.
echo *** TO KEEP EXISTING VALUE, JUST PRESS ENTER ***
echo.
echo.

set /p gameNameDashes=

:: Set first letter of game name for valid download link
set gameNameFirstLetterTemp=%gameNameDashes%
set gameNameFirstLetter=%gameNameFirstLetterTemp:~0,1%
::echo.
::echo.
::echo Letter: %gameNameFirstLetter%
::pause

goto amiMenu


:norm

%runShellTerminate% %amInstantServer%

goto amiMenu


:console

::%runShellTerminate% %amInstantServerConsole%
%runTerminate% %amInstantServerConsole%

goto amiMenu


:session

%baseReq%%sessionID%

%runShellWaitTerminate% "notepad.exe %temp%\ami-request.txt"

goto amiMenu


:download

if %cid%==00000000000000000000000000000000 (
cls
echo No Valid Content ID Has Been Set!
echo.
echo.
pause
goto amiMenu
)
:: Single DOUBLE QUOTE here on purpose
%runShellWaitTerminate% %baseReq%%download1%%cid%"

goto amiMenu


:launch

if %cid%==00000000000000000000000000000000 (
cls
echo No Valid Content ID Has Been Set!
echo.
echo.
pause
goto amiMenu
)

%runShellWaitTerminate% %baseReq%%launch1%%cid%%launch2%

goto amiMenu


:remote

if %cid%==00000000000000000000000000000000 (
cls
echo No Valid Content ID Has Been Set!
echo.
echo.
pause
goto amiMenu
)

if %gameNameDashes%==GAMENAME (
cls
echo No Valid Game Name Has Been Set!
echo.
echo.
pause
goto amiMenu
)

:: Single DOUBLE QUOTE here on purpose
%runShellWaitTerminate% %baseReq%%remoteRfsBase%/%gameNameFirstLetter%/%gameNameDashes%/%gameNameDashes%.rfs"

goto amiMenu


:stop

%kill% aminstantservice.exe
%kill% aminstantservice.exe
%kill% aminstantservice.exe

goto amiMenu


:openApps

%runShellTerminate% explorer.exe "%amInstantAppPath%"

goto amiMenu2


:chkRemote

%runShellWaitTerminate% wget -O "%temp%\GameHouse_GamePlayer.exe" %amInstantRemotePlayer%
filver32.exe "%temp%\GameHouse_GamePlayer.exe">"%temp%\amiVersion.txt"
%runShellWaitTerminate% "notepad.exe "%temp%\amiVersion.txt"

goto amiMenu2


:forceExit

%kill% aminstantservice.exe
%kill% aminstantservice.exe

exit

goto end



:end