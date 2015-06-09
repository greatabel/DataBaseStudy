
cat ListOfFile.txt | xargs -J % cp % test01

find . -type f -name "*.sh" -print0 | xargs -0 -J % cp % test01
