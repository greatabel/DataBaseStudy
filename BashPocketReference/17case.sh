echo "select the operation *********  1)operation 1 2)operation 2 3)operation 3 4)operation 4 "

read n
case $n in
    1) echo "options 1 test" ;;
    2) echo "options 2 test" ;;
    3) echo "options 3 test" ;;
    4) echo "options 4 test" ;;
    *) invalid option;;
esac