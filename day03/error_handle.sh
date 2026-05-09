#!/bin/bash

create_directory() {
	mkdir demo
}

if ! create_directory; then
	echo "The code is being exited as the directory already exists"
	exit 1
fi

echo "this should not work beacuse the code is interrupted"


Ye ek simple Bash shell script hai jo function, condition checking aur error handling ko demonstrate karti hai.
Script me `create_directory()` naam ka function banaya gaya hai jo `mkdir demo` command ki help se `demo` naam ka folder create
karta hai. `if ! create_directory; then` ka matlab hai ke agar directory create na ho, yani folder pehle se exist karta ho, to
condition true ho jayegi aur script error message `"The code is being exited as the directory already exists"` print karegi.
Uske baad `exit 1` script ko immediately stop kar deta hai jahan `1` error status code ko represent karta hai. Agar folder successfully
create ho jaye to script next line execute karegi aur `"this should not work because the code is interrupted"` print hoga. 
Ye script Bash scripting me functions, logical NOT operator `!`, conditional statements aur exit status handling ka practical
example hai.
