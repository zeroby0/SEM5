echo "needs /proc"

gcc loop.sh -o loop
./loop &
ls /proc/$!

# https://unix.stackexchange.com/questions/30370/how-to-get-the-pid-of-the-last-executed-command-in-shell-script