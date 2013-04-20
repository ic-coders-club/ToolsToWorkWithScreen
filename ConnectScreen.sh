#! /bin/bash

#Get ID's for all running screen sessions:
sessions=($(screen -ls|grep --color=never -G ')$'| sed -e 's/^[ \t]*//' -e 's/[ \t](.*)$/ /' |tr '\n' ' '))

#If there's only one session, reconnect to it:
if [ ${#sessions[@]} -lt 2 ];then
    exec screen -d -R
fi

#If no command line arguments then request screen session interactively:
if [ $# -lt 1 ]; then
    i=1
    # This loop just prints the information prettily:
    screen -ls |while read line; do
	echo $line|grep ')$'&>/dev/null
	if [ $? -eq 0 ];then
	    echo -e "  [$i] \t $line" 
	    i=$((i+1))
	else
	    echo "$line" 
	fi
    done
    echo  -n "Choose which session you want (1-${#sessions[@]}): " 
    #Read value from stdin
    read SELECTED
else 
# Else session is given as an argument to this command
    SELECTED=$1
fi

#Check everything is ok and connect to selected screen
if [[ "$SELECTED" =~ ^[^0-9]*$ ]]; then
    echo "You can only give me a number" 
elif [ -z "${sessions}" ] ; then
    echo "No screen sessions open..." 
elif [ "$SELECTED" -gt "${#sessions[@]}" ] || [ "$SELECTED" -le 0 ]; then 
    echo "No corresponding screen session" 
else
   exec screen -d -r ${sessions[$((SELECTED-1))]}
fi
