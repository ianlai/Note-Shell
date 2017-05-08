Simple note of GDB (GNU Debugger)

[Preparation]
	• gcc -g -o run main.c myclass.c    //compile with -g
	• gdb run                      //binary 

	With parameters
	• gdb --args  executable arg1 arg2 arg3  

	• source [gdbfile]   //store the breakpoints info into a file 
		○ Ex. 
		○ b func1
		○ b func2
		○ b file1:100
		○ b file2:300
		
[Debugging]
	• b 20  //breakpoint at line 20
	• b myclass.c:100  //file name and line number (when there are mutiple source files)
	• b myfunction      //function name 
	• info b   //show breakpoint info 
	• disable [# of breakpoint]

	• r   //run, from beginning 
	• q  //quit

	Both step by step, but different when encounter a function 
	• n   //next, pass the function 
	• s   //step, step into the function     
	
	• fin  //finish, jump out from a function (if used 's' to step into a function)
	• bt   //backtrace, print out the function stacks (execellent tool!) 
	
	Print out the value (if n1 is a pointer)
	• p n1->name  //print  n1->name   
	• p *n1            //all members in the object 
	• p/d myvar     //print myvar as a decimal 
