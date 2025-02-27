#!/bin/bash

function install_sqlite3() {
    echo "preparing to upgrade sqlite3 version..."
    cd ~
    wget https://www.sqlite.org/2022/sqlite-autoconf-3380500.tar.gz
    tar xvfz sqlite-autoconf-3380500.tar.gz
    cd sqlite-autoconf-3380500

    export CFLAGS="-DSQLITE_ENABLE_FTS3 \
    -DSQLITE_ENABLE_FTS3_PARENTHESIS \
    -DSQLITE_ENABLE_FTS4 \
    -DSQLITE_ENABLE_FTS5 \
    -DSQLITE_ENABLE_JSON1 \
    -DSQLITE_ENABLE_LOAD_EXTENSION \
    -DSQLITE_ENABLE_RTREE \
    -DSQLITE_ENABLE_STAT4 \
    -DSQLITE_ENABLE_UPDATE_DELETE_LIMIT \
    -DSQLITE_SOUNDEX \
    -DSQLITE_TEMP_STORE=3 \
    -DSQLITE_USE_URI \
    -O2 \
    -fPIC"
     export PREFIX="/usr/local"
     LIBS="-lm" ./configure --disable-tcl --enable-shared --enable-tempstore=always --prefix="$PREFIX"
     make
     sudo make install  # Install system-wide.

     sqlite3 --version

     echo "pointing python env to system sqlite version"
     cd ~/sqlite-autoconf-3380500/.libs
     sudo cp libsqlite3.so.0 /lib/x86_64-linux-gnu/libsqlite3.so.0
     echo "Python is now using sqlite3 version:"
     python3 -c "import sqlite3; print(sqlite3.sqlite_version)"
}

echo "creating and activating virtual environment"
python3 -m venv .venv
source .venv/bin/activate

echo "preparing to install crewai..."
pip install crewai crewai-tools
pip freeze | grep crewai

install_sqlite3

echo "running 'crewai install'"
cd /workspaces/hello-crew/hello_crew
pwd
crewai install
