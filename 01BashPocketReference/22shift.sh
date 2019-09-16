#22shift.sh 1 2 3 4 5 6 7 8 9 10
until [ $# -eq 0 ]
do
echo "$@"
shift
done