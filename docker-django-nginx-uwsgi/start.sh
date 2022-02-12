#!/bin/sh -ex

WD=/var/www/storeserver

cd ${WD}
source ./venv/bin/activate
# pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

python3 manage.py collectstatic --noinput

uwsgi storeserver_uwsgi.ini & 
nginx &
`which sshd` -D &