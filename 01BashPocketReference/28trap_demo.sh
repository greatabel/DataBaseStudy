#http://blog.crboy.net/2012/03/trap-in-bash-zsh-script.html

function clean_up {
	echo CLEAN UP!!
}
 
trap "clean_up;exit" SIGTERM SIGINT SIGHUP
 
for (( i=0; i<5; i=i+1 ))
do
	echo $i
	sleep 1
done
 
clean_up