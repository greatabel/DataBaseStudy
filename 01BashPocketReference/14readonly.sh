#http://book.51cto.com/art/201411/457607.htm

readonly var
#error
readonly var=value
readonly p=/tmp/test
#error
p=/tmp/other
echo $p
#只读变量也不能unset
unset p

declare -r Z="we are friends" 
Z=10


