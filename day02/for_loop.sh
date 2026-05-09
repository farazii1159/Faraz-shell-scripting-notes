#!/bin/bash

# This is for and while loops

<< comment
 1 is argument 1 which is folder name
 2 is start range
 3 is end rangeask

comment

for (( num=$2 ; num<=$3; num++ ))
do
	mkdir "$1$num"
done


Ye ek simple Bash shell script hai jo `for loop` aur command line arguments ka use karke multiple folders automatically create karti
hai. Script `#!/bin/bash` se start hoti hai jo batata hai ke code Bash shell me run hoga. `<< comment ... comment` block multi-line 
comment ke liye use hua hai jahan `$1`, `$2`, aur `$3` arguments ka purpose explain kiya gaya hai. Yahan `$1` folder name ka base 
hai, `$2` starting range hai aur `$3` ending range hai. `for (( num=$2 ; num<=$3; num++ ))` loop start range se end range tak chalta 
hai aur har iteration me `mkdir "$1$num"` command ek naya folder create karti hai. Agar script ko `./script.sh project 1 5` se run
karein to ye `project1`, `project2`, `project3`, `project4`, aur `project5` naam ke folders automatically create kar degi. Ye script
Bash scripting me loops, variables aur automation ka basic practical example hai.
