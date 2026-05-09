#!/bin/bash

# This is Jetha Lal ki Duniya

<< comment
Anything 
written 
here will not be execute
comment

name="babitaji"

echo "Name is $name, and date is $(date)"

echo "enter the name:"

read username

echo "You entered $username"

echo "The characters in $0 are:  $1 $2"


# Ye ek simple Bash shell script hai jo variables, comments, user input aur command line arguments ko demonstrate karti hai.
# Script `#!/bin/bash` se start hoti hai jo batata hai ke ye Bash shell me run hogi. `<< comment ... comment` multi-line comment 
# ki tarah use hua hai jisme likha gaya text execute nahi hota. Is script me `name="babitaji"` naam ka variable banaya gaya hai
# aur `echo` command ki help se variable aur current date `$(date)` display ki ja rahi hai. Uske baad `read username` user se input
# leta hai aur jo naam user enter karta hai wo `username` variable me save ho jata hai, phir usko print kiya jata hai. Aakhri line
# me `$0`, `$1`, aur `$2` use hue hain jahan `$0` script ka naam show karta hai aur `$1`, `$2` command line arguments ko represent
# karte hain jo script run karte waqt pass kiye jate hain. Ye script Bash scripting ke basic concepts ko simple aur practical way me 
# samjhane ke liye banayi gayi hai.
