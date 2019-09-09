@echo off 
@setlocal enableextensions enabledelayedexpansion
rem Set Variables:
  rem Set Server rootpath
  set "rootpathserver=%cd%"
  rem Set rootpath
  set "rootpath=%cd%\USBWS_Upd"
  rem Set rootpath to tools USBWS_Upd
  set "rootpathtools=%rootpath%\tools"
  rem Get current Date and Time
  for /f %%i in ('%rootpathtools%\date.exe +%%Y%%m%%d%%H%%M%%S') do set datetime1=%%i
  echo ========================================================================
rem Display Setup Information
  echo Root ServerPath  : %rootpathserver%
  echo Root update Path : %rootpath%
  echo Current Date     : %datetime1%
rem Determine OS architecture x86 or x64 and set program path
set sysarch=%PROCESSOR_ARCHITECTURE%
if "%sysarch%"=="AMD64" (
  echo OS Architecture  : x64
  set zpathtofile="%rootpathtools%\7z_x64\7za.exe"
) else (
  echo OS Architecture  : x86
  set zpathtofile=%rootpathtools%\7z_x86\7za.exe
)
rem Apache:
rem Check if apache update file exist:
for /f %%i in ('dir %rootpath%\httpd* /b 2^>nul') do set httpdfl=%%i
if [%httpdfl%] == [] (
  set ApacheUpt=0
  echo Apache           : No Update File Found
) else (
  set ApacheUpt=1
  echo Apache           : %httpdfl%
)

rem Check if PHP update file exist:
for /f %%i in ('dir %rootpath%\php-* /b 2^>nul') do set phpfl=%%i
if [%phpfl%] == [] (
  set PHPUpt=0
  echo PHP              : No Update File Found
) else (
  set PHPUpt=1
  echo PHP              : %phpfl%
)

rem Check if MariaDB update file exist:
for /f %%i in ('dir %rootpath%\mariadb* /b 2^>nul') do set mariadbfl=%%i
if [%mariadbfl%] == [] (
  set MariaDBUpt=0
  echo MariaDB          : No Update File Found
) else (
  set MariaDBUpt=1
  echo MariaDB          : %mariadbfl%
)

rem Check if phpMyAdmin update file exist:
for /f %%i in ('dir %rootpath%\phpMyAdmin* /b 2^>nul') do set pmafl=%%i
if [%pmafl%] == [] (
  set PMAUpt=0
  echo phpMyAdmin       : No Update File Found
) else (
  set PMAUpt=1
  echo phpMyAdmin       : %pmafl%
)
  echo ========================================================================
if [%ApacheUpt%] == [1] (
  echo Updating Apache "%httpdfl%"
  echo Empty tmp folder:
  del /A /F /Q "%rootpath%\tmp\*"
  for /F "eol=| delims=" %%I in ('dir "%rootpath%\tmp\*" /AD /B 2^>nul') do rd /Q /S "%rootpath%\tmp\%%I"
  
  echo Extract Update:
  echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  %zpathtofile% x %rootpath%\%httpdfl% -o%rootpath%\tmp -r -y
  echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  echo Update Files:
  echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  rename %rootpath%\tmp\Apache24 USBWS_HTTPd 
  rem Update Folders 
  robocopy %rootpath%\tmp\USBWS_HTTPd\ %rootpathserver%\USBWS_HTTPd\ /XD * /MIR /Z /V /NP /XA:H /W:5
  robocopy %rootpath%\tmp\USBWS_HTTPd\modules\ %rootpathserver%\USBWS_HTTPd\modules\ /MIR /Z /V /NP /XA:H /W:5
  rem Update Individual Files
  for /f "tokens=*" %%a in (%rootpathtools%\USBWS_Upd_httpd.txt) do (
    echo Copying: %%a
    copy /y /v %rootpath%\tmp\%%a %rootpathserver%\%%a
  )
  echo ========================================================================
)

if [%PHPUpt%] == [1] (
  echo Updating PHP "%phpfl%"
  echo Empty tmp folder:
  del /A /F /Q "%rootpath%\tmp\*"
  for /F "eol=| delims=" %%I in ('dir "%rootpath%\tmp\*" /AD /B 2^>nul') do rd /Q /S "%rootpath%\tmp\%%I"
  
  echo Extract Update:
  echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  %zpathtofile% x %rootpath%\%phpfl% -o%rootpath%\tmp\USBWS_PHP -r -y
  echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  echo Update Files:
  echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  rem Update Folders 
  robocopy %rootpath%\tmp\USBWS_PHP\ext\ %rootpathserver%\USBWS_PHP\ext\ /MIR /Z /V /NP /XA:H /W:5
  rem Update Individual Files
  echo Copying: USBWS_PHP\libssh2.dll to apache2\bin\libssh2.dll
  copy /y /v %rootpath%\tmp\USBWS_PHP\libssh2.dll %rootpathserver%\USBWS_HTTPd\bin\libssh2.dll
  for /f "tokens=*" %%a in (%rootpathtools%\USBWS_Upd_php.txt) do (
    echo Copying: %%a
    copy /y /v %rootpath%\tmp\%%a %rootpathserver%\%%a
  )
  echo ========================================================================
)

if [%MariaDBUpt%] == [1] (
  echo Updating MariaDB "%mariadbfl%"
  echo Empty tmp folder:
  del /A /F /Q "%rootpath%\tmp\*"
  for /F "eol=| delims=" %%I in ('dir "%rootpath%\tmp\*" /AD /B 2^>nul') do rd /Q /S "%rootpath%\tmp\%%I"
  
  echo Extract Update:
  echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  %zpathtofile% x %rootpath%\%mariadbfl% -o%rootpath%\tmp -r -y
  echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  echo Update Files:
  echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  set "mariadbflrt=!mariadbfl:~0,-4!
  rename %rootpath%\tmp\!mariadbflrt! USBWS_DB
  rem Update Folders
  robocopy %rootpath%\tmp\USBWS_DB\ %rootpathserver%\USBWS_DB\ /XF my.ini /XD * /MIR /Z /V /NP /XA:H /W:5
  robocopy %rootpath%\tmp\USBWS_DB\share\ %rootpathserver%\USBWS_DB\share\ /MIR /Z /V /NP /XA:H /W:5
  rem Update Individual Files
  for /f "tokens=*" %%a in (%rootpathtools%\USBWS_Upd_mariadb.txt) do (
    echo Copying: %%a
    copy /y /v %rootpath%\tmp\%%a %rootpathserver%\%%a
  )
  echo ========================================================================
)

if [%PMAUpt%] == [1] (
  echo Updating phpMyAdmin "%pmafl%"
  echo Empty tmp folder:
  del /A /F /Q "%rootpath%\tmp\*"
  for /F "eol=| delims=" %%I in ('dir "%rootpath%\tmp\*" /AD /B 2^>nul') do rd /Q /S "%rootpath%\tmp\%%I"
  
  echo Extract Update:
  echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  %zpathtofile% x %rootpath%\%pmafl% -o%rootpath%\tmp -r -y
  echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  echo Update Files:
  echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  set "pmaflrt=!pmafl:~0,-4!
  rename %rootpath%\tmp\!pmaflrt! USBWS_DBAdmin
  rem Update Individual Files
  rem Copy config to settings
  copy /y /v %rootpathserver%\USBWS_DBAdmin\config.inc.php  %rootpathserver%\USBWS_Settings\config.inc.php
  rem Update Folders
  robocopy %rootpath%\tmp\USBWS_DBAdmin\ %rootpathserver%\USBWS_DBAdmin\ /XF config.inc.php *.pem /MIR /Z /V /NP /XA:H /W:5
  echo =====================================================================
)

rem Empty tmp folder
echo Empty tmp folder:
del /A /F /Q "%rootpath%\tmp\*"
for /F "eol=| delims=" %%I in ('dir "%rootpath%\tmp\*" /AD /B 2^>nul') do rd /Q /S "%rootpath%\tmp\%%I"
  echo ========================================================================