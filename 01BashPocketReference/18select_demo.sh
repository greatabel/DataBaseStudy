#select命令，这个命令可以帮助我们完成菜单选择功能。
fruits=(
	"apple"
	"pear"
	"orange"
	"watermelon")

echo "Please guess which fruit I like:"

select var in ${fruits[@]}
do
	if [ $var = "apple" ]; then
		echo "you are right!"
		break
	else
		echo "try again"
	fi
done