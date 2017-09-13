function flags {
echo "for which bash builtin?"
read param

if [ ${#param} -eq 0 ]; then
	echo "For a list of bash builtins look at 'compgen -b | more' or so."
else	
	pos=$(compgen -b | grep $param)
	if [ ${#pos} -eq 0 ]; then
		echo "The command $param is not a bash builtin. Sorry."
	else	
		ret=$(grep -E '^[[:space:]]*-[[:alpha:]]*' <(help $param))
		if [ ${#ret} -eq 0 ]; then
			echo "I didn't match any flags. Please check 'help $param' for more information."
		else	
			grep --color -E '^[[:space:]]*-[[:alpha:]]*' <(help $param)
		fi
	fi
fi
}
