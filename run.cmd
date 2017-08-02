@echo off
:checkPrivileges 
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( powershell "Start-Process -FilePath %0 -Verb runas")
exit /b 

:gotPrivileges

powershell -ExecutionPolicy RemoteSigned -NoLogo -File %~dp0\run.ps1