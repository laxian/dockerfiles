#!/bin/bash


# 替换时区为本机时区
# ./timezone.sh [sub_dir]

script_name=timezone.sh

isMain() {
    __main=false
    invoke_name=$(basename $0)
    if [ $invoke_name = $script_name ]; then
        return 0
    else
        return 1
    fi
}

getTimezone() {
    ls -l /etc/localtime | awk -F'zoneinfo/' '{print $2}'
}

if isMain; then
    getTimezone
fi

sub() {
    sed -i "s#$1#$2#g" `grep $1 -rl $3 --exclude "*.$4"`
}

dir=${1:-.}
sub "Asia/Shanghai" $(getTimezone) $dir md