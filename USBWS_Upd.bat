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
  set hh=%time:~0,2%
  if "%time:~0,1%"==" " set hh=0%hh:~1,1%
  set datetime=%date:~-4,4%%date:~-10,2%%date:~-7,2%_%hh%%time:~3,2%%time:~6,2%
    
rem Set Log file:
set "LOGFILE=%rootpath%\logs\USBWS_Upd_%datetime%.log "
call %rootpathtools%\USBWS_Upd_main.bat | %rootpathtools%\tee.exe %LOGFILE%
