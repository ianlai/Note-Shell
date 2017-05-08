# Simple note of GDB (GNU Debugger)

## [Preparation]
**Compile & Start**
* gcc -g -o run main.c myclass.c    //compile with -g
* gdb run                      //binary 

**With parameters**
* gdb --args  executable arg1 arg2 arg3  

**Store the breakpoints info into a file** 
* source [gdbfile]
  * Ex. 
  * b func1
  * b func2
  * b file1:100
  * b file2:300
		
## [Debugging]
**Run & Quit**
* r   //run, from beginning 
* q  //quit

**Breakpoints**
* b 20  //breakpoint at line 20
* b myclass.c:100  //file name and line number (when there are mutiple source files)
* b myfunction      //function name 
* info b   //show breakpoint info 
* disable [# of breakpoint]

**Both n & s are step by step, but actions are different when encountering a function**
* n   //next, pass the function 
* s   //step, step into the function      
* fin //finish, jump out from a function (if used 's' to step into a function)

**Backtrace** 
* bt   //print out the function stacks (execellent tool!) 

**Print out the value (if n1 is a pointer)**
* p n1->name  //print  n1->name   
* p *n1            //all members in the object 
* p/d myvar     //print myvar as a decimal 
