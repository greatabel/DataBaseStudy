function mytest()
{
	echo "arg1 = $1"
	if [ $1 = "1" ] ;then 
		return 1
	else
		return 0
	fi
}

echo "mytest 1"
mytest 1
#The exit code for the last command is always available in the $? variable.
echo $? # print return result 

echo   
echo "mytest 0"  
mytest 0  
echo $?         # print return result  
  
echo   
echo "mytest 2"  
mytest 2  
echo $? 


echo "----"
if mytest 1 ; then
	echo "mytest 1"
fi