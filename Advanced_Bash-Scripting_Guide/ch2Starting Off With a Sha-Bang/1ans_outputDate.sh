LOG_DIR="$Home/Downloads/AbelProject/Transact-SQL/Advanced_Bash-Scripting_Guide/ch2Starting Off With a Sha-Bang"
mydate="$(date)"
echo "1 $mydate"


file=exists_and_writeable.txt

if [ ! -e "$file" ] ; then
    touch "$file"
fi

if [ ! -w "$file" ] ; then
    echo "cannot write to $file"
    exit 1
fi


echo $LOG_DIR
cd $LOG_DIR
echo "here is :$(pwd)"
echo "2 $mydate" > $file