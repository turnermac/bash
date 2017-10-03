BYellow='\e[1;33m'      # Yellow
BPurple='\e[1;35m'      # Purple
On_Red='\e[41m'         # Red

NC="\e[m"               # Color Reset

ALERT=${BYellow}
ERROR=${BYellow}${On_Red}

function flags {
echo "for which bash builtin?"
read param

if [ ${#param} -eq 0 ]; then
	echo -en ${ALERT}"For a list of bash builtins look at 'compgen -b | more' or so.\n"
else	
	pos=$(compgen -b | grep $param)
	if [ ${#pos} -eq 0 ]; then
		echo -en ${ERROR}"The command $param is not a bash builtin. Sorry.\n${NC}"
	else	
		ret=$(grep -E '^[[:space:]]*-[[:alpha:]]*' <(help $param))
		if [ ${#ret} -eq 0 ]; then
			echo -en ${ALERT}"I didn't match any flags. Please check 'help $param' for more information.\n"
		else	
			echo -en ${BYellow}"${ret}\n"
		fi
	fi
fi
}

function oracle {
echo "$(shuf -n 33 $HOME/Downloads/english-words/words.txt --random-source=/dev/urandom | tr '\n' ' ')"
}
