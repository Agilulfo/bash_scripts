#! /bin/bash
# Script to help control backlight

DIRECTION=$1
MAX_VALUE=120000
MIN_VALUE=0
FILE=/sys/class/backlight/intel_backlight/brightness

read_level() {
    current_level=`cat $FILE`
}

set_level() {
    echo $1 > $FILE
}

set_delta() {
    if [[ $current_level -gt 10000 ]] ; then
        delta=10000
    elif [[ $current_level -gt 2000 ]] ; then
        delta=2000
    else
        delta=500
    fi
}

inc() {
    let new_level=$current_level+$delta
    normalize
    set_level $new_level
}

dec() {
    let new_level=$current_level-$delta
    normalize
    set_level $new_level
}

normalize() {
    if [[ $new_level -gt $MAX_VALUE ]] ; then
        new_level=$MAX_VALUE
    elif [[ $new_level -lt $MIN_VALUE ]] ; then
        new_level=$MIN_VALUE
    fi
}

read_level
set_delta

if [[ $DIRECTION = "+" ]] ; then
    inc
elif [[ $DIRECTION = "-" ]] ; then
    dec
fi
