touch test.txt
gcc fileseek.c -o fileseek
./fileseek test.txt
echo "\n"
cat test.txt
echo "\n"
od -a test.txt