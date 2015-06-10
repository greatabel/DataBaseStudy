# # times
# 0m0.130s 0m0.030s
# 0m1.050s 0m0.240s
# #
# 以上是指令的執行顯示，第一行是 shell 本身耗用的時間，第二行是在 shell 中所有程序的時間累計。每行的第一欄為 utime(user)，第二欄為 stime(system)。



year_start=2009
year_end=3000
result=0
for (( year = ${year_start}; year <=${year_end}; year++ ))
do
  let result=result+year
  echo ${result}
done

echo "before times:"
times