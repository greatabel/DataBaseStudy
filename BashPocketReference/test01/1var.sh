clear

echo "begin test"
i=5+3 ; echo $i
# decalre -i  声明整形
declare -i jj ; jj=5+3 ; echo $jj

name=Arnold
name+=" Robbins" ; echo $name
#array variable
pets=(blacky rusty)
echo ${pets[*]}
pets+=(rain clound)
echo ${pets[*]}

#assign
greet="Hello, world"
friendly_message=greet
# ${!vars} Use value of var as name of variable whose val- ue should be used (indirect reference).
echo ${!friendly_message}
