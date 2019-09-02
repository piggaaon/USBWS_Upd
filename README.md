# USBWS_Upd README
I wrote this script(s) as a developer so that I can update the USBWebserver
and USBWS. USBWS_Upd will be include in updated USBWS to allow of in 
spot updates.

I use a version of USBWebserver that I have updated to latest Apache,PHP,
MySQL,phpMyAdmin while still keeping it portable.

- USBWebserver     : http://www.usbwebserver.net/webserver/
- Apache (Windows) : http://www.apachelounge.com/download/
- PHP (Windows)    : http://windows.php.net
- MySQL (Windows)  : http://dev.mysql.com/downloads/mysql/
- phpMyAdmin       : http://www.phpmyadmin.net

------------
## Install Instructions:

Download and extract zip; to root of 

------------
## Setup Instructions:
1. Stop Webserver and DB Sever (httpd and mydqld)

2. Copy apache/php/mysql/pma zip files into the USBWS_Upd folder

3. Run USBWS_Upd.bat

4. Logs are created for each time USBWS_Upd.bat is run, the logs are stored 
in "USBWS_Upd\logs\". Exmaple log filename "USBWS_Upd_20190817_131216.log"

4. Start Webserver and DB Sever (httpd and mydqld), check versions of servers.

**The Code for USBWS_Upd has been released under the MIT License:**

MIT License

Copyright (c) 2016  Piggaaon

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
