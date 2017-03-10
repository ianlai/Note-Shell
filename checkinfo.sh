#!/bin/bash

### CPU Usage
ps aux 
top

### CPU Spec
lscpu

### Memory Usage
free

### Disk Usage
df

### Architecture
uname -m

### Kernel version
uname -r

### Distribution version (Ubuntu)
cat /etc/lsb-release

#---------------------------------------------------

################
#Check disk IO
################

iostat -x 1


################
#Check disk IO (need to install, more readable)
################
nmon 


################
# Check IO 
################
blktrace -d $DEV 
blkparse -i $DEV.blktrace.* > $OUTPUT

# Ex. Trace the IO onto /dev/sda    
# blkparse -i /dev/sda ; blkparse -i sda.blktrace.* > out.log


################
# Check System call
################
strace -p $TARGET_PID

# Ex. Trace the syscall called by mysqld 
# shell> ps aux | grep mysql[d] | awk '{print $2}' | xargs -i sudo strace -ttt -yp {} -f
# - grep mysql[d]: grep mysql but ignore grep command itself
# - xargs -i {}  : direct the output to {} to be an argument of the next command 
# - strace -f    : see not only the parent process but also the child processes


################
# Check Memory Usage of a process 
################
ps aux 

# Ex. Show memory usage of SQLite every 0.05 seconds 
# shell> ps aux | grep USE[R] ; while sleep 0.05; do ps aux | grep -v vi | grep sqlit[e]; done 
# - grep USE[R]  : print out the first row 
# - use while and sleep to achieve every 0.05 seconds
# - grep -v vi   : not show vi (might be process the sqlite related file)



