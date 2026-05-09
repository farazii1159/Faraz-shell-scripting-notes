#!/bin/bash

<< disclaimer
This is just for infotainment purpose
disclaimer

# This is function definition

function is_loyal() {
read -p "$1 ne mud ke kise dekha: " bandi
read -p "$1 ka pyaar %" pyaar

if [[ $bandi == "daya bhabhi"  ]];
then
	echo "$1 is loyal"
elif [[ $pyaar -ge 100 ]];
then
	echo "$1 is loyal"
else
	echo "$1 is not loyal"
fi
}

# This is function call
is_loyal "tom"

# Ye ek simple **Bash shell scripting** project hai jo **function**, **user input**, **variables** aur **conditional statements** ko
# practice karne ke liye banaya gaya hai. Script `#!/bin/bash` se start hoti hai jo batata hai ke code **Bash shell** me run hoga.
# Isme `is_loyal()` naam ka function banaya gaya hai jo user se do inputs leta hai: pehla ke usne “mud ke kise dekha” aur doosra uska 
# “pyaar percentage”. `read -p` command user se input lene ke liye use hoti hai, jabke `$1` function ka first argument hota hai jo yahan 
# `"tom"` hai. Uske baad `if`, `elif`, aur `else` conditions check karti hain ke agar input `"daya bhabhi"` ho ya pyaar `100` ya 
# usse zyada ho to output `"tom is loyal"` show kare, warna `"tom is not loyal"` print kare. Ye script **Bash scripting** ke basic
# concepts jaise **functions**, **variables**, **conditions** aur **user interaction** ko simple aur fun way me samjhane 
# ke liye banayi gayi hai.

