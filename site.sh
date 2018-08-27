#!/bin/bash
DIR_ENV="./flask"
DIR_TMP="./tmp"
VENV_TAR="virtualenv-15.2.0.tar.gz"
VENV="./virtualenv-15.2.0"

case $1 in
""|"help") echo help or install or clear ;;
"install")
    # if venv not exist - untar virtualenv module
    if [ ! -e $VENV ]
    then
        cd ./site-packages
        tar xvf $VENV_TAR
        mv $VENV .$VENV
        cd ..
    fi
    if [ ! -e $DIR_ENV ]
    then
        cd ./$ENV
        python -m virtualenv .$DIR_ENV
        cd ..
        $DIR_ENV/bin/pip2 install -r ./requirements.txt
        mkdir $DIR_TMP
    else echo Files exist. Need to be cleared first.
    fi ;;
"clear"|"clean")
    if [ -e $DIR_ENV ]
    then rm -r $DIR_ENV
    else echo $DIR_ENV not exist
    fi
    if [ -e $DIR_TMP ]
    then rm -r $DIR_TMP
    else echo $DIR_TMP not exist
    fi
    if [ -e __pycache__ ]
    then rm -r __pycache__
    fi
    rm ./app/*.pyc
    ;;
esac

