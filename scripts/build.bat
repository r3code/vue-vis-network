@echo off

rem Script name
set me=%~n0
set SCRIPT_DIR=%~dp0
IF %SCRIPT_DIR:~-1%==\ set SCRIPT_DIR=%SCRIPT_DIR:~0,-1%

echo Build umd version...
call :build "development" || (
  SET ERROR_MSG=Failed to build umd version  
  goto :error
)        

echo Build umd version - OK
call :build "production" || (
  SET ERROR_MSG=Failed to build umd minified version
  goto :error
) 
echo Build umd minified version - OK
goto :ok

:error
echo ERROR: %ERROR_MSG% 
exit /b 1  


:ok
exit /b 0 
  

rem FUNCTIONS

:build
echo. 
echo Start build, mode: %~1
if "%~1"=="" (
  SET ERROR_MSG=build func %%1 not set. Build stop
  goto :error
)   
SET NODE_ENV=%~1
echo NODE_ENV=%NODE_ENV%
call "%SCRIPT_DIR%/../node_modules/.bin/webpack" --hide-modules --colors --progress --config webpack.js --env %NODE_ENV% --display-error-details
goto :eof
