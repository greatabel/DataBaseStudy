PS3="Select the item number:"
file="test.txt"
select event in Format Page View Exit
do
	case "$event" in
		Format) nroff $file | lp;;
		Page)   pr $file | lp;;
		View)	more $file;;
		Exit)	exit 0;;
		*	)	echo "Invalid selection";;
	esac
done