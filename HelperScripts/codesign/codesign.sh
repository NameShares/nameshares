# This codesign of apple is stupid, seem have problem with recursive codesign and --deep flag
# and with CMake/CPack's make package, haven't find way to code sign before package, because the dependency Frameworks and plugins seems install in run time, which will change the signature
# So we have to extract the NameShares.app from the dmg, and codesign it manually


XCODE_PATH_CONTENT_DEVELOPER=`xcode-select -print-path`
if [ -f "${XCODE_PATH_CONTENT_DEVELOPER}/Toolchains/XcodeDefault.xctoolchain/usr/bin/codesign_allocate" ]; then
  export CODESIGN_ALLOCATE="${XCODE_PATH_CONTENT_DEVELOPER}/Toolchains/XcodeDefault.xctoolchain/usr/bin/codesign_allocate"
elif [ -f "${XCODE_PATH_CONTENT_DEVELOPER}/usr/bin/codesign_allocate" ]; then
  export CODESIGN_ALLOCATE="${XCODE_PATH_CONTENT_DEVELOPER}/usr/bin/codesign_allocate"
else
  export CODESIGN_ALLOCATE="/usr/bin/codesign_allocate"
fi

find ./ -type d -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'

echo $CODESIGN_ALLOCATE

mkdir -p NameShares.app/Contents/Frameworks/QtCore.framework/Resources/
cp ~/Qt/5.3/clang_64/lib/QtCore.framework/Contents/Info.plist NameShares.app/Contents/Frameworks/QtCore.framework/Resources/
codesign --force --verify --verbose --sign "Developer ID Application: SHA BIT" NameShares.app/Contents/Frameworks/QtCore.framework

mkdir -p NameShares.app/Contents/Frameworks/QtGui.framework/Resources/
cp ~/Qt/5.3/clang_64/lib/QtGui.framework/Contents/Info.plist NameShares.app/Contents/Frameworks/QtGui.framework/Resources/
codesign --force --verify --verbose --sign "Developer ID Application: SHA BIT" NameShares.app/Contents/Frameworks/QtGui.framework

mkdir -p NameShares.app/Contents/Frameworks/QtMultimedia.framework/Resources/
cp ~/Qt/5.3/clang_64/lib/QtMultimedia.framework/Contents/Info.plist NameShares.app/Contents/Frameworks/QtMultimedia.framework/Resources/
codesign --force --verify --verbose --sign "Developer ID Application: SHA BIT" NameShares.app/Contents/Frameworks/QtMultimedia.framework

mkdir -p NameShares.app/Contents/Frameworks/QtMultimediaWidgets.framework/Resources/
cp ~/Qt/5.3/clang_64/lib/QtMultimediaWidgets.framework/Contents/Info.plist NameShares.app/Contents/Frameworks/QtMultimediaWidgets.framework/Resources/
codesign --force --verify --verbose --sign "Developer ID Application: SHA BIT" NameShares.app/Contents/Frameworks/QtMultimediaWidgets.framework

mkdir -p NameShares.app/Contents/Frameworks/QtNetwork.framework/Resources/
cp ~/Qt/5.3/clang_64/lib/QtNetwork.framework/Contents/Info.plist NameShares.app/Contents/Frameworks/QtNetwork.framework/Resources/
codesign --force --verify --verbose --sign "Developer ID Application: SHA BIT" NameShares.app/Contents/Frameworks/QtNetwork.framework

mkdir -p NameShares.app/Contents/Frameworks/QtOpenGL.framework/Resources/
cp ~/Qt/5.3/clang_64/lib/QtOpenGL.framework/Contents/Info.plist NameShares.app/Contents/Frameworks/QtOpenGL.framework/Resources/
codesign --force --verify --verbose --sign "Developer ID Application: SHA BIT" NameShares.app/Contents/Frameworks/QtOpenGL.framework

mkdir -p NameShares.app/Contents/Frameworks/QtPositioning.framework/Resources/
cp ~/Qt/5.3/clang_64/lib/QtPositioning.framework/Contents/Info.plist NameShares.app/Contents/Frameworks/QtPositioning.framework/Resources/
codesign --force --verify --verbose --sign "Developer ID Application: SHA BIT" NameShares.app/Contents/Frameworks/QtPositioning.framework

mkdir -p NameShares.app/Contents/Frameworks/QtPrintSupport.framework/Resources/
cp ~/Qt/5.3/clang_64/lib/QtPrintSupport.framework/Contents/Info.plist NameShares.app/Contents/Frameworks/QtPrintSupport.framework/Resources/
codesign --force --verify --verbose --sign "Developer ID Application: SHA BIT" NameShares.app/Contents/Frameworks/QtPrintSupport.framework

mkdir -p NameShares.app/Contents/Frameworks/QtQml.framework/Resources/
cp ~/Qt/5.3/clang_64/lib/QtQml.framework/Contents/Info.plist NameShares.app/Contents/Frameworks/QtQml.framework/Resources/
codesign --force --verify --verbose --sign "Developer ID Application: SHA BIT" NameShares.app/Contents/Frameworks/QtQml.framework

mkdir -p NameShares.app/Contents/Frameworks/QtQuick.framework/Resources/
cp ~/Qt/5.3/clang_64/lib/QtQuick.framework/Contents/Info.plist NameShares.app/Contents/Frameworks/QtQuick.framework/Resources/
codesign --force --verify --verbose --sign "Developer ID Application: SHA BIT" NameShares.app/Contents/Frameworks/QtQuick.framework

mkdir -p NameShares.app/Contents/Frameworks/QtSensors.framework/Resources/
cp ~/Qt/5.3/clang_64/lib/QtSensors.framework/Contents/Info.plist NameShares.app/Contents/Frameworks/QtSensors.framework/Resources/
codesign --force --verify --verbose --sign "Developer ID Application: SHA BIT" NameShares.app/Contents/Frameworks/QtSensors.framework

mkdir -p NameShares.app/Contents/Frameworks/QtSql.framework/Resources/
cp ~/Qt/5.3/clang_64/lib/QtSql.framework/Contents/Info.plist NameShares.app/Contents/Frameworks/QtSql.framework/Resources/
codesign --force --verify --verbose --sign "Developer ID Application: SHA BIT" NameShares.app/Contents/Frameworks/QtSql.framework

mkdir -p NameShares.app/Contents/Frameworks/QtWebKit.framework/Resources/
cp ~/Qt/5.3/clang_64/lib/QtWebkit.framework/Contents/Info.plist NameShares.app/Contents/Frameworks/QtWebKit.framework/Resources/
codesign --force --verify --verbose --sign "Developer ID Application: SHA BIT" NameShares.app/Contents/Frameworks/QtWebKit.framework

mkdir -p NameShares.app/Contents/Frameworks/QtWebKitWidgets.framework/Resources/
cp ~/Qt/5.3/clang_64/lib/QtWebKitWidgets.framework/Contents/Info.plist NameShares.app/Contents/Frameworks/QtWebKitWidgets.framework/Resources/
codesign --force --verify --verbose --sign "Developer ID Application: SHA BIT" NameShares.app/Contents/Frameworks/QtWebKitWidgets.framework

mkdir -p NameShares.app/Contents/Frameworks/QtWidgets.framework/Resources/
cp ~/Qt/5.3/clang_64/lib/QtWidgets.framework/Contents/Info.plist NameShares.app/Contents/Frameworks/QtWidgets.framework/Resources/
codesign --force --verify --verbose --sign "Developer ID Application: SHA BIT" NameShares.app/Contents/Frameworks/QtWidgets.framework

codesign --force --verify --verbose --sign "Developer ID Application: SHA BIT" NameShares.app/Contents/PlugIns/imageformats/libqjpeg.dylib
codesign --force --verify --verbose --sign "Developer ID Application: SHA BIT" NameShares.app/Contents/PlugIns/platforms/libqcocoa.dylib
codesign --force --verify --verbose --sign "Developer ID Application: SHA BIT" NameShares.app/Contents/MacOS/libdb_cxx-5.3.dylib
codesign --force --verify --verbose --sign "Developer ID Application: SHA BIT" NameShares.app/Contents/MacOS/libgcc_s.1.dylib
codesign --force --verify --verbose --sign "Developer ID Application: SHA BIT" NameShares.app/Contents/MacOS/libreadline.6.dylib
codesign --force --verify --verbose --sign "Developer ID Application: SHA BIT" NameShares.app/Contents/MacOS/libstdc++.6.dylib
codesign --force --verify --verbose --sign "Developer ID Application: SHA BIT" NameShares.app

mkdir -p NameShares
mv NameShares.app ./NameShares/NameShares.app
ln -s /Applications/ ./NameShares/Applications
sudo spctl -a -v NameShares/NameShares.app
hdiutil create -size 130m ./NameShares.dmg -srcfolder ./NameShares/ -ov
