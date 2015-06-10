seq 1 20 | xargs -Iz echo "Hi there " # z

for run in {1..10}
do
  echo "${run} test"
done