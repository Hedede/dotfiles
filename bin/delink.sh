for file in $@
do
	if [[ -L "$file" ]]
	then
		link=$(readlink -f "$file")
		[[ ! -z "$link" ]] && mv "$link" "$file"
	fi
done
