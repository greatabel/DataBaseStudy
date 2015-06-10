PS3 = "Please enter your choice:"
options=("Options1" "Options2" "Options3" "Quit")
select opt in "${options[@]}"
do
	case $opt in
		"Options1")
			echo "you chose 1"
			;;
		"Options2")
			echo "you chose 2"
			;;
		"Options3")
			echo "you chose 3"
			;;
		"Quit")
			break
			;;
		*) echo invalid option;;
    esac
done

