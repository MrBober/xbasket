#!/usr/bin/env bash

[ -z "$DMENU" ] && DMENU="dmenu"
list="/tmp/minimized_$USER"

function help {
    echo -e "Usage: $0 <command> <args>\n"
    echo -e "Commands:"
    echo -e "  help - display help"
    echo -e "  hide - hide active window if no arguments are given\n         otherwise hide a window with given id"
    echo -e "  show - show a minimized window with given id"
    echo -e "  select - display a list of minimized windows and select one"
}

function hide {
    [ -z "$1" ] && id=$(xdotool getactivewindow) || id=$1
    xdotool windowunmap $id
    echo $id >> $list
}

function show {
    [ -z "$1" ] && exit
    xdotool windowmap $1
    sed -i "/$1/d" $list
}

function sel {
    win_ids=$(cat $list)
    wins=$(for id in $win_ids; do [ ! -z "$id" ] && echo "$id: \"$(xdotool getwindowname $id)\" ($(cat /proc/$(xdotool getwindowpid $id)/comm))"; done)
    search=$($DMENU -p "show" <<< "$wins")
    [ -z "$search" ] && exit
    show ${search%%:*}
}

[ $# -eq 0 ] || [ "$1" = "help" ] && help
[ "$1" = "hide" ] && hide $2
[ "$1" = "show" ] && show $2
[ "$1" = "select" ] && sel 
