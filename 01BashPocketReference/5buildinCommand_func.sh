#!/bin/sh
if ! who | grep abel > /dev/null 
then
	echo abel is not currently logged on 
else
	echo abel is here
fi


if ! who | grep jane > /dev/null 
then
	echo jane is not currently logged on 
fi



for i in {1..10}
do 
	echo -n "-"
done
echo "func:---->"
# wc语法
# -l  ：仅列出行；
# -w  ：仅列出多少字(英文单字)；
# -m  ：多少字符；
countfiles() {
	ls | wc -l
}
countfiles
# Define your function here
Hello () {
   echo "Hello World"
}
Hello
demoFun(){
    echo "This is your first shell function!"
}
echo "Function begin..."
demoFun
echo "Function end!"