# WebDevServVer README
I wrote this script(s) as a developer so that I would know which version of
Apache,PHP,MySQL,phpMyAdmin I had installed and if there was a newer version.

I use a version of USBWebserver that I have updated to latest Apache,PHP,
MySQL,phpMyAdmin while still keeping it portable.

USBWebserver     : http://www.usbwebserver.net/webserver/
Apache (Windows) : http://www.apachelounge.com/download/
PHP (Windows)    : http://windows.php.net
MySQL (Windows)  : http://dev.mysql.com/downloads/mysql/
phpMyAdmin       : http://www.phpmyadmin.net

------------
## Install Instructions:

Download zip

------------
## Setup Instructions:
1. Edit "./WebDevServVer/WebDevServVer_settings.php" file for you setup.

2. Add the following to the top of page you want to display the Server information.
	/* Include WebDevServVer Information */
	include ("./WebDevServVer/WebDevServVer_index.php");

3. For latest Server Version variables, there is a class CSS that will need to be 
added to your css to define the link colors (Default: red or #ff0000):

	.USBWSVerNew {color:#ff0000;}
	a.USBWSVerNew:link {color:#ff0000;}
	a.USBWSVerNew:visited {color:#ff0000;}
	a.USBWSVerNew:active {color:#ff0000;}
	a.USBWSVerNew:hover {color:#ff0000;}

4. See the list below of server information variables.
NOTE: These variables could change overtime as updates are made to script(s), 
if you get any error about variable could not be found, check the list again.
Example(s):
	<?php echo $installed_apache; ?>
	<?php echo $latest_apache; ?>

------------
Below are the variables with the installed and latest version for each server and add-on scripting language. 

------------

## WebServer(s):
	Apache Installed Version : $installed_apache
	Apache Latest Version    : $latest_apache

## Scripting Languages(s):
	PHP Installed Version : $installed_php
	PHP Latest Version    : $latest_php

## Database(s):
	MySQL Username          : $mysql_user
	MySQL Password          : $mysql_pass
	MySQL Port              : $mysql_port
	MySQL Installed Version : $installed_mysql
	MySQL Latest Version    : $latest_mysql

## Database Manager(s):
	phpMyAdmin Installed Version : $installed_phpmyadmin
	phpMyAdmin Latest Version    : $latest_phpmyadmin

------------

**The Code for WebDevServVer has been released under the MIT License:**

MIT License

Copyright (c) 2013  Piggaaon

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
