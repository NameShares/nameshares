setlocal
call "%~dp0\setenv_x64.bat"
cd %NAMESHARES_ROOT%
cmake-gui -G "Visual Studio 12 Win64"
