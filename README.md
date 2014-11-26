NameShares [![Build Status](https://travis-ci.org/vikramrajkumar/nameshares.png)](https://travis-ci.org/vikramrajkumar/nameshares)
===============================
The NameShares is a set of libraries used to facilitate
the development of Decentralized Autonomous Companies (DACs).  It provides
a framework upon which new DACs can be developed based upon a common 
architecture.  

Build Instructions
------------------
NameShares uses git submodules for managing certain external dependencies. Before
you can build you will need to fetch the submodules with the following commands:

    git submodule init
    git submodule update
    cmake .
    make

Different platforms have different steps for handling dependencies, if you 
would like to build on OS X see BUILD_OSX.md

Documentation
------------------
Documentation is available at the GitHub wiki: https://github.com/NameShares/nameshares/wiki.
