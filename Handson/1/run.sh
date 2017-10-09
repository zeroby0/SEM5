# soft link
ln -s ./test.txt ./softlink_commandline

# hard link
ln ./test.txt hardlink_commandline

# FIFO
mkfifo fifo_commandline

# system call softlink
gcc softlink.c -o softlink
$("./softlink test.txt softlink_systemcall")

# systemcall hardlink
gcc hardlink.c -o hardlink
$("./hardlink ./test.txt hardlink_systemcall")

# systemcall mkfifo
gcc mknod.c -o mknod
$("./mknod fifo_systemcall")

$(ls)
