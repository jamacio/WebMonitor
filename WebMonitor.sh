#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo -e "Usage: $0 <website_url> <string_to_check>\n"
    exit 1
fi

URL=$1
STRING=$2
TIME_OFFLINE=0
RESET_BAR=0
LOADING_BAR=""
TIME_OFFLINE_MSG_END=""

check_website() {
clear 
    echo -e " _    _      _      ___  ___            _ _             "
    echo -e "| |  | |    | |     |  \/  |           (_) |            "
    echo -e "| |  | | ___| |__   | .  . | ___  _ __  _| |_ ___  _ __ "
    echo -e "| |/\| |/ _ \ '_ \  | |\/| |/ _ \| '_ \| | __/ _ \| '__|"
    echo -e "\  /\  /  __/ |_) | | |  | | (_) | | | | | || (_) | |   "
    echo -e " \/  \/ \___|_.__/  \_|  |_/\___/|_| |_|_|\__\___/|_|   "
    echo -e ""


    LOADING_BAR="${LOADING_BAR}="
    echo -e "${LOADING_BAR}> \n \nChecking website status for $URL"
    
    if curl -s "$URL" | grep "$STRING" > /dev/null; then
        if [ $TIME_OFFLINE -ne 0 ]; then
            OFFLINE_HOURS=$(($TIME_OFFLINE / 3600))
            OFFLINE_MINUTES=$((($TIME_OFFLINE % 3600) / 60))
            OFFLINE_SECONDS=$(($TIME_OFFLINE % 60))
            TIME_OFFLINE_MSG=""
            [ $OFFLINE_HOURS -ne 0 ] && TIME_OFFLINE_MSG="${TIME_OFFLINE_MSG}${OFFLINE_HOURS} hour(s), "
            [ $OFFLINE_MINUTES -ne 0 ] && TIME_OFFLINE_MSG="${TIME_OFFLINE_MSG}${OFFLINE_MINUTES} minute(s), and "
            TIME_OFFLINE_MSG="${TIME_OFFLINE_MSG}${OFFLINE_SECONDS} second(s)."
            echo -e "\n \n\033[1;32mThe site is back online!\033[0m It was offline for $TIME_OFFLINE_MSG \n \n \n"
            TIME_OFFLINE_MSG_END=$TIME_OFFLINE_MSG
            TIME_OFFLINE=0
            LOADING_BAR=""
        else
           LOADING_BAR=""
            if [ -z "$TIME_OFFLINE_MSG_END" ]; then
                echo -e "\n \n\033[1;32mThe site is online.\033[0m \n \n \n"
            else
                echo -e "\n \n\033[1;32mThe site is back online!\033[0m It was offline for $TIME_OFFLINE_MSG_END \n \n \n"
            fi
        fi
    else
        TIME_OFFLINE=$(($TIME_OFFLINE+5))
        OFFLINE_HOURS=$(($TIME_OFFLINE / 3600))
        OFFLINE_MINUTES=$((($TIME_OFFLINE % 3600) / 60))
        OFFLINE_SECONDS=$(($TIME_OFFLINE % 60))
        TIME_OFFLINE_MSG=""
        TIME_OFFLINE_MSG_END=""
        [ $OFFLINE_HOURS -ne 0 ] && TIME_OFFLINE_MSG="${TIME_OFFLINE_MSG}${OFFLINE_HOURS} hour(s), "
        [ $OFFLINE_MINUTES -ne 0 ] && TIME_OFFLINE_MSG="${TIME_OFFLINE_MSG}${OFFLINE_MINUTES} minute(s), and "
        TIME_OFFLINE_MSG="${TIME_OFFLINE_MSG}${OFFLINE_SECONDS} second(s)."
        echo -e "\n \n\\033[1;33mThe site has been offline for $TIME_OFFLINE_MSG\033[0m"
    fi


    if [ $RESET_BAR -ge 600 ]; then
        LOADING_BAR=''
        RESET_BAR=0
    fi

     RESET_BAR=$(($RESET_BAR+5))
}

while true; do
    check_website
    sleep 5
done
