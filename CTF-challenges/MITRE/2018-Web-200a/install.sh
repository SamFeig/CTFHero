#!/bin/bash

if [[ -x `command -v yum` ]]; then
    sudo yum -y install python34-pip
    sudo yum -y install npm
    sudo pip3 install virtualenv
elif [[ -x `command -v brew` ]]; then
    brew install python3
    brew install npm
    pip3 install virtualenv
else
    echo "Platform not supported"
    exit
fi


virtualenv env --python=python3
source env/bin/activate

pip install -r requirements.txt
npm install
npm run build

export FLASK_APP=./autoapp.py

flask db init
flask db migrate
flask db upgrade

gunicorn myflaskapp.app:create_app\(\) -b 0.0.0.0:8080 -w 4 &

echo "Register the admin user, then press enter to continue..."
read

echo "Enter the flag:"
read flag

sqlite3 db.db "INSERT INTO userdata VALUES (0, 1, \"$flag\")"