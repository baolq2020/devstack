#!/usr/bin/env bash
_load_dotenv(){
    export $(cat .env | xargs)
}

_check_devstack(){
    if [ -e .env ]
    then
        echo "env file devstack is exist!"
        cp .env.example .env
    else
        echo "env file devstack is not exist! Copy from env.example"
        cp .env.example .env
    fi
    _load_dotenv
}

_check_web(){
    cd ../${NAME_FE}
    if [ -e .env ]
    then
        echo "env file web is exist!"
        cp .env.example .env
    else
        echo "env file web is not exist! Copy from env.example"
        cp .env.example .env
    fi
}

_check_gobe(){
    cd ../${NAME_BE}
    if [ -e .env ]
    then
        echo "env file gobe is exist!"
        cp .env.example .env
    else
        echo "env file gobe is not exist! Copy from env.example"
        cp .env.example .env
    fi
}

_check_worker(){
    cd ../${NAME_WORKER}
    if [ -e .env ]
    then
        echo "env file worker is exist!"
        cp .env.example .env
    else
        echo "env file worker is not exist! Copy from env.example"
        cp .env.example .env
    fi
}


check ()
{
    _check_devstack
    _check_web
    _check_gobe
    _check_worker
}

if [ "$1" == "check" ]; then
    check
fi