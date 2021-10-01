#!/bin/bash

#Initialization
initCount=0
logs=/home/[username]/logs.txt #Change the [username] path with your username without square brackets

#Telegram temporary message
message=/tmp/message.txt

#Chat id and bot telegram token
chat_id=""
token=""

#Send Alert Function
function sendAlert
{
        curl -s -F chat_id=$chat_id -F text="$text" https://api.telegram.org/bot$token/sendMessage
}

#Running the program
while true
do
    lastCount=$(wc -c $logs | awk '{print $1}') #getSizeFileLogs

    if(($(($lastCount)) > $initCount));
       then
        msg=$(tail -n 2 $logs) #GetLastLineLog
        echo -e "To Admin\n Telah terjadi penyerangan terhadap website anda\n\nServer Time : $(date +"%d %b %Y %T")\n\n"$msg > $message
        text=$(<$message)
        sendAlert
        echo " Alert sent!"
        initCount=$lastCount
        rm -f $message
        sleep 1
    fi
    sleep 2
done
