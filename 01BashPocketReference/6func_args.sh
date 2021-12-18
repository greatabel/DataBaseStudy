#http://man.linuxde.net/xargs
echo "xargs的默认命令是echo，空格是默认定界符。这意味着通过管道传递给xargs的输入将会包含换行和空白，不过通过xargs的处理，换行和空白将被空格取代"
cat test.txt
cat test.txt | xargs
echo "-n选项多行输出："
cat test.txt | xargs -n3
echo "nameXnameXnameXname" | xargs -dX

#osx  .sh: Permission denied 
#chmod 777 sk6.sh

cat arg.txt | xargs -I {} ./sk6.sh -p {} -l

find . -type f -name "*.log" -print0 | xargs -0 rm -f


#http://stackoverflow.com/questions/1358540/how-to-count-all-the-lines-of-code-in-a-directory-recursively
find . -type f -name "*.sh" -print0 | xargs -0 wc -l

find . -type f -name "*.txt" -print | xargs tar -czvf txt.tar.gz


