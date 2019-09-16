u=up d=down blank=
echo ${u}root

echo ${u-$d}
echo ${tmp- `date`}
echo ${blank="no data"}
echo ${blank:="no data"}
echo $blank

# indexed array
message=(hi there how are you today)
echo ${message[0]}
echo ${message[1]}
echo ${message[2]}

#use element 0 of array name
echo ${message}
# use all 
echo ${message[*]}
# same as previous
echo ${message[@]}
# number of elements
echo ${#message[*]}
# previous
echo ${#message[@]}

#associative arrays
#换行 http://stackoverflow.com/questions/3372673/continue-output-on-same-line
echo -n "associative arrays"

for i in {1..10}
do 
	echo -n "-"
done
echo $'\nhello\nworld'
echo ""
data=([joe]=30 [mary]=25)
echo ${data[test]}

#Special Prompt Strings
PS1="\d \h $"
echo PS1