#!/bin/bash

usage() {
    echo ""
    echo "Usage:"
    echo "      ./weather.sh [-h] [-l <location>] -t <update-interval>"
    echo ""
    echo "Options:"
    echo "      -h   Show help"
    echo "      -l   The location to display weather for"
    echo "      -t   Time interval to fetch updates (minutes)"
    echo ""

    exit 1
}

while getopts ":l:t:h" opt
do
    case $opt in
        l) 
            location="$OPTARG"
            ;; 
        t) 
            time_interval="$OPTARG"
            ;;
        \?)
            echo "ERROR: Invalid option: -$OPTARG" >&2; usage;;
        :)
            echo "ERROR: Option -$OPTARG requires an argument." >&2; usage;;
        h | *)
            usage;;
    esac
done

if [ -z $time_interval ]; then usage; fi

while [ 1 ]
do
    clear
    if [ -z $location ]
    then
        curl wttr.in/"?0"
    else
        curl wttr.in/"$location?0"
    fi
    sleep "$time_interval"m
done
