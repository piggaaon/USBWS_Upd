rem Clear Command Line Screen
cls
@echo off 
setlocal EnableExtensions EnableDelayedExpansion
rem Set Variables:
  rem Set rootpath
  set "rootpath=%~dp0USBWS_Upd"
  rem Set rootpath to tools
  set "rootpathtools=%~dp0USBWS_Upd\tools"
  rem Get current Date and Time
  for /f %%i in ('%rootpathtools%\date.exe +%%Y%%m%%d%%H%%M%%S') do set datetime1=%%i
rem Set Log file:
set "LOGFILE=%rootpath%\logs\USBWS_Upd_%datetime1%.log "
call %rootpathtools%\USBWS_Upd_main.bat | %rootpathtools%\tee.exe %LOGFILE%