# bash 9for.sh "file"
for ((x=1; x <= 20; x += 2)) do
grep $1 test$x 
done