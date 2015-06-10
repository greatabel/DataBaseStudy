#http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-7.html
COUNTER=0
while [  $COUNTER -lt 10 ]; do
 echo The counter is $COUNTER
 let COUNTER=COUNTER+1 
done