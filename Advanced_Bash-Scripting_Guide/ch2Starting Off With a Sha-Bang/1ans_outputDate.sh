LOG_DIR="$Home/Downloads/AbelProject/Transact-SQL/Advanced_Bash-Scripting_Guide/ch2Starting Off With a Sha-Bang"
mydate="$(date)"
echo "first $mydate"


file=exists_and_writeable.txt

if [ ! -e "$file" ] ; then
    touch "$file"
fi

if [ ! -w "$file" ] ; then
    echo "cannot write to $file"
    exit 1
fi

# 附加内容到文件 http://stackoverflow.com/questions/13181725/bash-append-file-contents-to-the-bottom-of-existing-file
#  计时的输出转向到文件 http://stackoverflow.com/questions/13356628/is-there-a-way-to-redirect-time-output-to-file-in-linux
# echo $LOG_DIR
cd $LOG_DIR
echo "here is :$(pwd)"
echo "1 write $mydate " > $file

{ time sleep 1 ; } 2>> $file

mywho="$(who -m)"
echo $mywho
echo "\n2 test:$mywho" >> $file

myuptime="$(uptime)"
echo "\n3 test:$myuptime" >> $file


