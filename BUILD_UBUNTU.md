These instructions worked on a fresh Ubuntu 14.04 LTS image.

    sudo apt-get update
    sudo apt-get install cmake git libreadline-dev uuid-dev g++ libdb++-dev libdb-dev zip libssl-dev openssl build-essential python-dev autotools-dev libicu-dev libbz2-dev libboost-dev libboost-all-dev
    git clone https://github.com/NameShares/nameshares.git
    cd nameshares
    git submodule init
    git submodule update
    cmake .
    make

For the Qt Wallet, some extra steps are required:

	sudo apt-get install npm qt5-default libqt5webkit5-dev qttools5-dev qttools5-dev-tools nodejs-legacy
	cd nameshares
	cmake -DINCLUDE_QT_WALLET=ON .
	cd programs/web_wallet
	sudo npm install -g lineman
	npm install
	cd -
	make buildweb
	make NameShares

By default, the web wallet will not be rebuilt even after pulling new changes. To force the web wallet to rebuild, use `make forcebuildweb`.

The binary will be located at programs/qt_wallet/NameShares
The wallet can be installed as a local application capable of handling xts: URLs like so:

	sudo cp programs/qt_wallet/bin/NameShares /usr/local/bin/
	sudo mkdir -p /usr/local/share/icons/
	sudo cp programs/qt_wallet/images/qtapp80.png /usr/local/share/icons/NameShares.png
	sudo cp programs/qt_wallet/NameShares.desktop /usr/local/share/applications/
