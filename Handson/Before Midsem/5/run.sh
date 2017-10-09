gcc file.c -o file
./file &

echo "/proc/$!/fd"

echo "cat or ls?"
ls "/proc/$!/fd"
cat "/proc/$!/fd"