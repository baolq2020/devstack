
_load_dotenv(){
    export $(cat .env | xargs)
}

_check_devstack(){
    if [ -e .env ]
    then
        echo "env file devstack is exist!"
    else
        echo "env file devstack is not exist! This env file will be created from .env.example!"
        cp .env.example .env
    fi
    _load_dotenv
}

_check_web(){
    cd ../${NAME_FE}
    if [ -e .env ]
    then
        echo "env file web is exist!"
    else
        echo "env file web is not exist! This env file will be created from .env.example!"
        pwd
        cp .env.example .env
    fi
}

_check_gobe(){
    cd ../${NAME_BE}
    if [ -e .env ]
    then
        echo "env file gobe is exist!"
    else
        echo "env file gobe is not exist! This env file will be created from .env.example!"
        pwd
        cp .env.example .env
    fi
}

_check_worker(){
    cd ../${NAME_WORKER}
    if [ -e .env ]
    then
        echo "env file worker is exist!"
    else
        echo "env file worker is not exist! This env file will be created from .env.example!"
        pwd
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