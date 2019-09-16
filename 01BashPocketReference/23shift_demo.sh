until [ -z "$1" ]  # Until all parameters used up
do
  echo "$@ test"
  shift
done
