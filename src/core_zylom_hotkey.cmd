@echo off
title RealArcade Wrapper Killer v%rawkver%    (.-+'~^-+ Checking Hotkey Flags +-^~`+-.)     [...cRypTiCwaRe 2o16...]

::-----------------------------------------------------------------------------------
:: Disable/Enable Debug Mode (0 disabled, 1 enabled)
::-----------------------------------------------------------------------------------

set debug=0

::-----------------------------------------------------------------------------------
:: Set "Debug On" Switch Manually with file (useful for quick testing)
::-----------------------------------------------------------------------------------

if exist "debug.on" set debug=1

::-----------------------------------------------------------------------------------
:: Disable/Enable Registry Reset (0 disabled, 1 enabled)
::-----------------------------------------------------------------------------------

set reset=0

::-----------------------------------------------------------------------------------
:: Disable/Enable INI Skip (0 disabled, 1 enabled)
::-----------------------------------------------------------------------------------

set iniskip=0

::-----------------------------------------------------------------------------------
:: Disable/Enable Database Update (0 disabled, 1 enabled)
::-----------------------------------------------------------------------------------

set updatedb=0

::-----------------------------------------------------------------------------------
:: Disable/Enable Restore Flag (0 disabled, 1 enabled)
::-----------------------------------------------------------------------------------

set wrestore=0

::-----------------------------------------------------------------------------------
:: Disable/Enable Demo Type Override Flag (0 disabled, 1 enabled)
::-----------------------------------------------------------------------------------

set dtor=0

::-----------------------------------------------------------------------------------
:: Set RGS Pre-Release Installer Flag (0 disabled, 1 enabled)
::-----------------------------------------------------------------------------------

set rgspre=0

::-----------------------------------------------------------------------------------
:: Set Clear Cache Flag (0 disabled, 1 enabled)
::-----------------------------------------------------------------------------------

set clearcache=0


:end