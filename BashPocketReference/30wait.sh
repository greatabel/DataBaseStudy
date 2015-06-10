#http://www.cnitblog.com/sysop/archive/2008/11/03/50974.aspx

for ((i=0;i<5;i++));do
{
        sleep 1;echo 1>>aa && echo "done!"
} 
done
wait
cat aa|wc -l
rm aa