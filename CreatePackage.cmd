@ECHO OFF
REM Define the Java to use (adjust this to your environment).

SET JAVA_HOME=C:\Program Files (Arm)\Microsoft\jdk-17.0.6.10-hotspot

REM Build the project archive with Maven Wrapper.

ECHO Creating application archive...
CALL mvnw --quiet clean package

REM Define some some variables
SET APP_NAME=Packaged
SET APP_VERSION=2.0.0
SET APP_VENDOR=Frank Ulbricht
SET APP_COPYRIGHT=Copyright (c) 2023 Frank Ulbricht
SET MAIN_MODULE=name.ulbricht.packaged
SET MODULE_PATH=target\module
SET RELEASE_PATH=target\release
SET LICENSE_FILE=install\license.txt
SET ICON_FILE=install\windows\application.ico
SET RESOURCE_PATH=install\windows\wix
SET TEMP_PATH=target\release\temp

REM Create the application image (for a Windows console application).

ECHO Creating application image...
CALL "%JAVA_HOME%\bin\jpackage"^
 --type app-image^
 --win-console^
 --name %APP_NAME%^
 --app-version %APP_VERSION%^
 --vendor "%APP_VENDOR%"^
 --copyright "%APP_COPYRIGHT%"^
 --icon %ICON_FILE%^
 --dest %RELEASE_PATH%^
 --temp %TEMP_PATH%^
 --module-path %MODULE_PATH%^
 --module %MAIN_MODULE%

 REM Create an application package from the pre-built application image

ECHO Creating application package...
CALL "%JAVA_HOME%\bin\jpackage"^
 --type exe^
 --app-version %APP_VERSION%^
 --vendor "%APP_VENDOR%"^
 --dest %RELEASE_PATH%^
 --temp %TEMP_PATH%^
 --app-image %RELEASE_PATH%\%APP_NAME%^
 --install-dir "%APP_VENDOR%\%APP_NAME%"^
 --license-file %LICENSE_FILE%^
 --resource-dir %RESOURCE_PATH%^
 --win-dir-chooser^
 --win-menu^
 --win-menu-group %APP_NAME%^
 --win-shortcut^
 --win-shortcut-prompt
