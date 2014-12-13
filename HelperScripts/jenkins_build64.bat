echo Available processor count: %NUMBER_OF_PROCESSORS%
echo Starting build # %BUILD_NUMBER%
cd nameshares
git submodule init || exit /b 21
git submodule update || exit /b 22

cd %WORKSPACE%
call nameshares/setenv_x64.bat || exit /b 26

call npm install grunt
call npm install lineman -g --prefix=%NPM_INSTALL_PREFIX%
call npm install lineman-angular
call npm install lineman-less

if exist build (
  rmdir /Q /S build || exit /b 27
)
mkdir build
cd build
cmake -DINCLUDE_QT_WALLET=TRUE -DINCLUDE_CRASHRPT=TRUE -G "Visual Studio 12 Win64" ../nameshares || exit /b 28
msbuild.exe /M:%NUMBER_OF_PROCESSORS% /p:Configuration=RelWithDebInfo /p:Platform=x64 /target:NameShares:rebuild /v:diag NameShares.sln || exit /b 30
msbuild.exe /M:%NUMBER_OF_PROCESSORS% /p:Configuration=RelWithDebInfo /p:Platform=x64 /target:nameshares_client:rebuild /v:diag NameShares.sln || exit /b 30
