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
        cd ./$VENV
        python2 -m virtualenv .$DIR_ENV
        cd ..
        $DIR_ENV/bin/pip2 install -r ./requirements.txt
    else echo Files exist. Need to be cleared first.
    fi
    if [ ! -e $DIR_TMP ]
    then
        mkdir $DIR_TMP
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
    if [ -e $VENV ]
    then rm -r $VENV
    fi
    rm ./app/*.pyc
    rm ./.htaccess
    rm ./index.fcgi
    ;;
"gitclone")
    git clone https://github.com/shaihuludata/carbon
    ;;
"gitfetch")
    git fetch origin master
    ;;
"gitpull")
    git pull origin master
    ;;
"gitpush")
    git add .
    git commit -m $2
    git push -u origin master
esac

