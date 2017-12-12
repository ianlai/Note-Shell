#!/bin/bash

### Check file content 
nl     #line number
less

### CPU Usage
ps aux 
top

### CPU Spec
lscpu
cat /proc/cpuinfo 

### Memory Usage
free
free -h 
cat /proc/meminfo

### Disk Usage
df  #disk 
du  #directory

### Contents of directories in tree structure
tree 
tree -I "*.class"  #not showing "*.class" files  

### Block Device 
lsblk 

### Architecture
uname -m

### Kernel version
uname -r

### Distribution version (Ubuntu)
cat /etc/lsb-release

### Hardware information
lshw -short
hwinfo --short 

### Different interfaces
lspci
lsscsi
lsusb

### Mounted file system
mount | column -t 

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
# - column of RSS should be the memory size allocated to the process <- This one
# - column of VSZ is the virtual memory size (this includes the memory size which is swapped out and from shared libraries)


################
# Check inode 
################
# Directory entry 
#  - file name1 --> inode of file1 --> data of file1 
#  - file name2 --> inode of file2 --> data of file2 
#
# 1. Check directory entry: ls <-i>
# 2. Check inode of a file: stat [filename]
# 3. Check data of a file : cat  [filename]


################
# Shared file (link)
################
# 1. Hard link 
# 2. Symbolic link

# Create a file 
touch abc.file  
# Create a hard link of the file 
ln abc.file abc.hard
# Create a symbolic link of the file 
ln -s abc.file abc.symbolic

# Check inode of the three files
ls -i 

# [Hard link]
# We can see original file and hard link have the same inode 
# We need to delete both to really delete the data 
#
# Directory entry 
#  - file name 
#         |
#         --> inode of file 
#         |
#  - hard link name
# 
# [Symbolic link]
# Symbolic link is a file which stored the path it refers to.
# So deleting symbolic link will not touch the file, 
# but deleting the file will really delete the file. 
#
#  - symbolic link name --> inode of symbolic link --> data of symbolic link [file name]
#  - file name          --> inode of file          --> data of file 
