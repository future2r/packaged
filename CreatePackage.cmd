@ECHO OFF
REM Define the Java to use (adjust this to your environment).

SET JAVA_HOME=C:/Program Files (Arm)/Microsoft/jdk-17.0.6.10-hotspot

REM Build the project archive with Maven Wrapper.

CALL mvnw clean package

REM Define some some variables
SET APP_NAME=Packaged
SET MAIN_MODULE=name.ulbricht.packaged
SET MODULE_PATH=target/module
SET RELEASE_PATH=target/release

REM Create the application image (for a Windows console application).

CALL "%JAVA_HOME%\bin\jpackage"^
 --type app-image^
 --win-console^
 --dest %RELEASE_PATH%^
 --name %APP_NAME%^
 --module-path %MODULE_PATH%^
 --module %MAIN_MODULE%
