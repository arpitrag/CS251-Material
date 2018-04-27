#!/bin/bash
## the question has been done with the help of case statements again and again 
## could have been done with help of function also using same concept

regex='[^0-9]+'

## discarding invalid inputs
if [[ $1 =~ $regex ]];then
	echo "invalid input"
	exit -1
fi


declare -i my=$1
if [ $my -lt 0 ] 
then
	echo "invalid input"
	exit -1
fi




th=$1
i=1
length=`echo $1 | wc -m`
#echo "length=$length"
ten_power=1
while [ $i -lt $length ];do
	ten_power=$(($ten_power *10))
	i=$(($i +1))
done	

zero=0
sum=0
i=0
### deleting initial zeroes
while [ $i -lt $length ];
do
	charac=`echo ${th:$i:1}`
	ten_power=$(($ten_power /10))
	declare -i temp=$charac
	#echo "temp=$temp"
	sum=$(($sum + $(($temp *$ten_power))))
	#echo "sum=$sum"
	#echo $charac
	i=$(($i +1))
done
#echo $sum



my=$sum

### taking out the specific digits
four=$(($my /10000000))
four4=$(($four/1000))
four_three=$(($four%1000))
four_two=$(($four_three %100))
four_ten=$(($four_two /10))
four_one=$(($four_two %10))
four_hund=$((four_three/100))


three=$(($my %1000))
two1=$(($three %100))
ten1=$(($two1 /10))
one1=$(($two1 %10))
hund1=$(($three /100))

two3=$(($my /100000))
two3=$(($(($my - $(($four * 10000000)))) /100000))
one3=$(($two3 %10))

ten3=$(($two3 /10))
two2=$(($(($(($my %100000)) -$three)) /1000))
one2=$(($two2 %10))
ten2=$(($two2 /10))

zero=0




########## Check valid input 
########## Get rid of initial zeros








if [ $my -eq 0 ]; then
	echo "zero"
	exit -1
fi

#### Printing number of crores

	case "$four4" in
		0)
		;;
		1)
		echo -n "one thousand "
		;;
		2)
		echo -n "two thousand "
		;;
		3)
		echo -n "three thousand "
		;;
		4)
		echo -n "four thousand "
		;;
		5)
		echo -n "five thousand "
		;;
		6)
		echo -n "six thousand "
		;;
		7)
		echo -n "seven thousand "
		;;
		8)
		echo -n "eight thousand "
		;;
		9)
		echo -n "nine thousand "
		;;
	esac


if [ $four_three -eq 0 ];then
	zero=0
elif [ $(($four_three /100)) -eq $zero ]; then
	zero=0
else
	##echo $hund1 ###debug
	case $four_hund in
		1)
		echo -n "one hundred "
		;;
		2)
		echo -n "two hundred "
		;;
		3)
		echo -n "three hundred "
		;;
		4)
		echo -n "four hundred "
		;;
		5)
		echo -n "five hundred "
		;;
		6)
		echo -n "six hundred "
		;;
		7)
		echo -n "seven hundred "
		;;
		8)
		echo -n "eight hundred "
		;;
		9)
		echo -n "nine hundred "
		;;
	esac
fi


#### Printing the last two digits
if [ $four_two -le 19 ];then
	case "$four_two" in
		0)
		;;
		1)
		echo -n "one "
		;;
		2)
		echo -n "two "
		;;
		3)
		echo -n "three "
		;;
		4)
		echo -n "four "
		;;
		5)
		echo -n "five "
		;;
		6)
		echo -n "six "
		;;
		7)
		echo -n "seven "
		;;
		8)
		echo -n "eight "
		;;
		9)
		echo -n "nine "
		;;
		10)
		echo -n "ten "
		;;
		11)
		echo -n "eleven "
		;;
		12)
		echo -n "twelve "
		;;
		13)
		echo -n "thirteen "
		;;
		14)
		echo -n "fourteen "
		;;
		15)
		echo -n "fifteen "
		;;
		16)
		echo -n "sixteen "
		;;
		17)
		echo -n "seventeen "
		;;
		18)
		echo -n "eighteen "
		;;
		19)
		echo -n "nineteen "
		;;
	esac
else
	case "$four_ten" in
		2)
		echo -n  "twenty "
		case "$four_one" in
			0)
			;;
			1)
			echo -n "one "
			;;
			2)
			echo -n "two "
			;;
			3)
			echo -n "three "
			;;
			4)
			echo -n "four "
			;;
			5)
			echo -n "five "
			;;
			6)
			echo -n "six "
			;;
			7)
			echo -n "seven "
			;;
			8)
			echo -n "eight "
			;;
			9)
			echo -n "nine "
			;;
		esac
		;;
		3)
		echo -n "thirty "
		case "$four_one" in
			0)
			;;
			1)
			echo -n "one "
			;;
			2)
			echo -n "two "
			;;
			3)
			echo -n "three "
			;;
			4)
			echo -n "four "
			;;
			5)
			echo -n "five "
			;;
			6)
			echo -n "six "
			;;
			7)
			echo -n "seven "
			;;
			8)
			echo -n "eight "
			;;
			9)
			echo -n "nine "
			;;
		esac
		;;
		4)
		echo -n "forty "
		case "$four_one" in
			0)
			;;
			1)
			echo -n "one "
			;;
			2)
			echo -n "two "
			;;
			3)
			echo -n "three "
			;;
			4)
			echo -n "four "
			;;
			5)
			echo -n "five "
			;;
			6)
			echo -n "six "
			;;
			7)
			echo -n "seven "
			;;
			8)
			echo -n "eight "
			;;
			9)
			echo -n "nine "
			;;
		esac
		;;
		5)
		echo -n "fifty "
		case "$four_one" in
			0)
			;;
			1)
			echo -n "one "
			;;
			2)
			echo -n "two "
			;;
			3)
			echo -n "three "
			;;
			4)
			echo -n "four "
			;;
			5)
			echo -n "five "
			;;
			6)
			echo -n "six "
			;;
			7)
			echo -n "seven "
			;;
			8)
			echo -n "eight "
			;;
			9)
			echo -n "nine "
			;;
		esac
		;;
		6)
		echo -n "sixty "
		case "$four_one" in
			0)
			;;
			1)
			echo -n "one "
			;;
			2)
			echo -n "two "
			;;
			3)
			echo -n "three "
			;;
			4)
			echo -n "four "
			;;
			5)
			echo -n "five "
			;;
			6)
			echo -n "six "
			;;
			7)
			echo -n "seven "
			;;
			8)
			echo -n "eight "
			;;
			9)
			echo -n "nine "
			;;
		esac
		;;
		7)
		echo -n "seventy "
		case "$four_one" in
			0)
			;;
			1)
			echo -n "one "
			;;
			2)
			echo -n "two "
			;;
			3)
			echo -n "three "
			;;
			4)
			echo -n "four "
			;;
			5)
			echo -n "five "
			;;
			6)
			echo -n "six "
			;;
			7)
			echo -n "seven "
			;;
			8)
			echo -n "eight "
			;;
			9)
			echo -n "nine "
			;;
		esac
		;;
		8)
		echo -n "eighty "
		case "$four_one" in
			0)
			;;
			1)
			echo -n "one "
			;;
			2)
			echo -n "two "
			;;
			3)
			echo -n "three "
			;;
			4)
			echo -n "four "
			;;
			5)
			echo -n "five "
			;;
			6)
			echo -n "six "
			;;
			7)
			echo -n "seven "
			;;
			8)
			echo -n "eight "
			;;
			9)
			echo -n "nine "
			;;
		esac
		;;
		9)
		echo -n "ninety "
		case "$four_one" in
			0)
			;;
			1)
			echo -n "one "
			;;
			2)
			echo -n "two "
			;;
			3)
			echo -n "three "
			;;
			4)
			echo -n "four "
			;;
			5)
			echo -n "five "
			;;
			6)
			echo -n "six "
			;;
			7)
			echo -n "seven "
			;;
			8)
			echo -n "eight "
			;;
			9)
			echo -n "nine "
			;;
		esac
		;;
	esac
fi



if [ $four -ne $zero ];then
	echo -n "crore "

fi


#### Printing Number of lakhs
###one3

if [ $two3 -le 19 ];then
	case "$two3" in
		0)
		;;
		1)
		echo -n "one lakh "
		;;
		2)
		echo -n "two lakh "
		;;
		3)
		echo -n "three lakh "
		;;
		4)
		echo -n "four lakh "
		;;
		5)
		echo -n "five lakh "
		;;
		6)
		echo -n "six lakh "
		;;
		7)
		echo -n "seven lakh "
		;;
		8)
		echo -n "eight lakh "
		;;
		9)
		echo -n "nine lakh "
		;;
		10)
		echo -n "ten lakh "
		;;
		11)
		echo -n "eleven lakh "
		;;
		12)
		echo -n "twelve lakh "
		;;
		13)
		echo -n "thirteen lakh "
		;;
		14)
		echo -n "fourteen lakh "
		;;
		15)
		echo -n "fifteen lakh "
		;;
		16)
		echo -n "sixteen lakh "
		;;
		17)
		echo -n "seventeen lakh "
		;;
		18)
		echo -n "eighteen lakh "
		;;
		19)
		echo -n "nineteen lakh "
		;;
	esac
else
	case "$ten3" in
		2)
		echo -n  "twenty "
		case "$one3" in
########## Add Lakh  echo
			0)
			echo -n "lakh "
			;;
			1)
			echo -n "one lakh "
			;;
			2)
			echo -n "two lakh "
			;;
			3)
			echo -n "three lakh "
			;;
			4)
			echo -n "four lakh "
			;;
			5)
			echo -n "five lakh "
			;;
			6)
			echo -n "six lakh "
			;;
			7)
			echo -n "seven lakh "
			;;
			8)
			echo -n "eight lakh "
			;;
			9)
			echo -n "nine lakh "
			;;
		esac
		;;
		3)
		echo -n "thirty "
		case "$one3" in
			0)
			echo -n "lakh "
			;;
			1)
			echo -n "one lakh "
			;;
			2)
			echo -n "two lakh "
			;;
			3)
			echo -n "three lakh "
			;;
			4)
			echo -n "four lakh "
			;;
			5)
			echo -n "five lakh "
			;;
			6)
			echo -n "six lakh "
			;;
			7)
			echo -n "seven lakh "
			;;
			8)
			echo -n "eight lakh "
			;;
			9)
			echo -n "nine lakh "
			;;
		esac
		;;
		4)
		echo -n "forty "
		case "$one3" in
			0)
			echo -n "lakh "
			;;
			1)
			echo -n "one lakh "
			;;
			2)
			echo -n "two lakh "
			;;
			3)
			echo -n "three lakh "
			;;
			4)
			echo -n "four lakh "
			;;
			5)
			echo -n "five lakh "
			;;
			6)
			echo -n "six lakh "
			;;
			7)
			echo -n "seven lakh "
			;;
			8)
			echo -n "eight lakh "
			;;
			9)
			echo -n "nine lakh "
			;;
		esac
		;;
		5)
		echo -n "fifty "
		case "$one3" in
			0)
			echo -n "lakh "
			;;
			1)
			echo -n "one lakh "
			;;
			2)
			echo -n "two lakh "
			;;
			3)
			echo -n "three lakh "
			;;
			4)
			echo -n "four lakh "
			;;
			5)
			echo -n "five lakh "
			;;
			6)
			echo -n "six lakh "
			;;
			7)
			echo -n "seven lakh "
			;;
			8)
			echo -n "eight lakh "
			;;
			9)
			echo -n "nine lakh "
			;;
		esac
		;;
		6)
		echo -n "sixty "
		case "$one3" in
			0)
			echo -n "lakh "
			;;
			1)
			echo -n "one lakh "
			;;
			2)
			echo -n "two lakh "
			;;
			3)
			echo -n "three lakh "
			;;
			4)
			echo -n "four lakh "
			;;
			5)
			echo -n "five lakh "
			;;
			6)
			echo -n "six lakh "
			;;
			7)
			echo -n "seven lakh "
			;;
			8)
			echo -n "eight lakh "
			;;
			9)
			echo -n "nine lakh "
			;;
		esac
		;;
		7)
		echo -n "seventy "
		case "$one3" in
			0)
			echo -n "lakh "
			;;
			1)
			echo -n "one lakh "
			;;
			2)
			echo -n "two lakh "
			;;
			3)
			echo -n "three lakh "
			;;
			4)
			echo -n "four lakh "
			;;
			5)
			echo -n "five lakh "
			;;
			6)
			echo -n "six lakh "
			;;
			7)
			echo -n "seven lakh "
			;;
			8)
			echo -n "eight lakh "
			;;
			9)
			echo -n "nine lakh "
			;;
		esac
		;;
		8)
		echo -n "eighty "
		case "$one3" in
			0)
			echo -n "lakh "
			;;
			1)
			echo -n "one lakh "
			;;
			2)
			echo -n "two lakh "
			;;
			3)
			echo -n "three lakh "
			;;
			4)
			echo -n "four lakh "
			;;
			5)
			echo -n "five lakh "
			;;
			6)
			echo -n "six lakh "
			;;
			7)
			echo -n "seven lakh "
			;;
			8)
			echo -n "eight lakh "
			;;
			9)
			echo -n "nine lakh "
			;;
		esac
		;;
		9)
		echo -n "ninety "
		case "$one3" in
			0)
			echo -n "lakh "
			;;
			1)
			echo -n "one lakh "
			;;
			2)
			echo -n "two lakh "
			;;
			3)
			echo -n "three lakh "
			;;
			4)
			echo -n "four lakh "
			;;
			5)
			echo -n "five lakh "
			;;
			6)
			echo -n "six lakh "
			;;
			7)
			echo -n "seven lakh "
			;;
			8)
			echo -n "eight lakh "
			;;
			9)
			echo -n "nine lakh "
			;;
		esac
		;;
	esac
fi


#### Printing Thousands
if [ $two2 -le 19 ];then
	case "$two2" in
		0)
		;;
		1)
		echo -n "one thousand "
		;;
		2)
		echo -n "two thousand "
		;;
		3)
		echo -n "three thousand "
		;;
		4)
		echo -n "four thousand "
		;;
		5)
		echo -n "five thousand "
		;;
		6)
		echo -n "six thousand "
		;;
		7)
		echo -n "seven thousand "
		;;
		8)
		echo -n "eight thousand "
		;;
		9)
		echo -n "nine thousand "
		;;
		10)
		echo -n "ten thousand "
		;;
		11)
		echo -n "eleven thousand "
		;;
		12)
		echo -n "twelve thousand "
		;;
		13)
		echo -n "thirteen thousand "
		;;
		14)
		echo -n "fourteen thousand "
		;;
		15)
		echo -n "fifteen thousand "
		;;
		16)
		echo -n "sixteen thousand "
		;;
		17)
		echo -n "seventeen thousand "
		;;
		18)
		echo -n "eighteen thousand "
		;;
		19)
		echo -n "nineteen thousand "
		;;
	esac
else
	case "$ten2" in
		2)
		echo -n  "twenty "
		case "$one2" in
########## Add thousand  echo
			0)
			echo -n "thousand "
			;;
			1)
			echo -n "one thousand "
			;;
			2)
			echo -n "two thousand "
			;;
			3)
			echo -n "three thousand "
			;;
			4)
			echo -n "four thousand "
			;;
			5)
			echo -n "five thousand "
			;;
			6)
			echo -n "six thousand "
			;;
			7)
			echo -n "seven thousand "
			;;
			8)
			echo -n "eight thousand "
			;;
			9)
			echo -n "nine thousand "
			;;
		esac
		;;
		3)
		echo -n "thirty "
		case "$one2" in
			0)
			echo -n "thousand "
			;;
			1)
			echo -n "one thousand "
			;;
			2)
			echo -n "two thousand "
			;;
			3)
			echo -n "three thousand "
			;;
			4)
			echo -n "four thousand "
			;;
			5)
			echo -n "five thousand "
			;;
			6)
			echo -n "six thousand "
			;;
			7)
			echo -n "seven thousand "
			;;
			8)
			echo -n "eight thousand "
			;;
			9)
			echo -n "nine thousand "
			;;
		esac
		;;
		4)
		echo -n "forty "
		case "$one2" in
			0)
			echo -n "thousand "
			;;
			1)
			echo -n "one thousand "
			;;
			2)
			echo -n "two thousand "
			;;
			3)
			echo -n "three thousand "
			;;
			4)
			echo -n "four thousand "
			;;
			5)
			echo -n "five thousand "
			;;
			6)
			echo -n "six thousand "
			;;
			7)
			echo -n "seven thousand "
			;;
			8)
			echo -n "eight thousand "
			;;
			9)
			echo -n "nine thousand "
			;;
		esac
		;;
		5)
		echo -n "fifty "
		case "$one2" in
			0)
			echo -n "thousand "
			;;
			1)
			echo -n "one thousand "
			;;
			2)
			echo -n "two thousand "
			;;
			3)
			echo -n "three thousand "
			;;
			4)
			echo -n "four thousand "
			;;
			5)
			echo -n "five thousand "
			;;
			6)
			echo -n "six thousand "
			;;
			7)
			echo -n "seven thousand "
			;;
			8)
			echo -n "eight thousand "
			;;
			9)
			echo -n "nine thousand "
			;;
		esac
		;;
		6)
		echo -n "sixty "
		case "$one2" in
			0)
			echo -n "thousand "
			;;
			1)
			echo -n "one thousand "
			;;
			2)
			echo -n "two thousand "
			;;
			3)
			echo -n "three thousand "
			;;
			4)
			echo -n "four thousand "
			;;
			5)
			echo -n "five thousand "
			;;
			6)
			echo -n "six thousand "
			;;
			7)
			echo -n "seven thousand "
			;;
			8)
			echo -n "eight thousand "
			;;
			9)
			echo -n "nine thousand "
			;;
		esac
		;;
		7)
		echo -n "seventy "
		case "$one2" in
			0)
			echo -n "thousand "
			;;
			1)
			echo -n "one thousand "
			;;
			2)
			echo -n "two thousand "
			;;
			3)
			echo -n "three thousand "
			;;
			4)
			echo -n "four thousand "
			;;
			5)
			echo -n "five thousand "
			;;
			6)
			echo -n "six thousand "
			;;
			7)
			echo -n "seven thousand "
			;;
			8)
			echo -n "eight thousand "
			;;
			9)
			echo -n "nine thousand "
			;;
		esac
		;;
		8)
		echo -n "eighty "
		case "$one2" in
			0)
			echo -n "thousand "
			;;
			1)
			echo -n "one thousand "
			;;
			2)
			echo -n "two thousand "
			;;
			3)
			echo -n "three thousand "
			;;
			4)
			echo -n "four thousand "
			;;
			5)
			echo -n "five thousand "
			;;
			6)
			echo -n "six thousand "
			;;
			7)
			echo -n "seven thousand "
			;;
			8)
			echo -n "eight thousand "
			;;
			9)
			echo -n "nine thousand "
			;;
		esac
		;;
		9)
		echo -n "ninety "
		case "$one2" in
			0)
			echo -n "thousand "
			;;
			1)
			echo -n "one thousand "
			;;
			2)
			echo -n "two thousand "
			;;
			3)
			echo -n "three thousand "
			;;
			4)
			echo -n "four thousand "
			;;
			5)
			echo -n "five thousand "
			;;
			6)
			echo -n "six thousand "
			;;
			7)
			echo -n "seven thousand "
			;;
			8)
			echo -n "eight thousand "
			;;
			9)
			echo -n "nine thousand "
			;;
		esac
		;;
	esac
fi

		
###Printing last three digits

if [ $three -eq 0 ];then
	zero=0
elif [ $(($three /100)) -eq $zero ]; then
	zero=0
else
	##echo $hund1 ###debug
	case $hund1 in
		1)
		echo -n "one hundred "
		;;
		2)
		echo -n "two hundred "
		;;
		3)
		echo -n "three hundred "
		;;
		4)
		echo -n "four hundred "
		;;
		5)
		echo -n "five hundred "
		;;
		6)
		echo -n "six hundred "
		;;
		7)
		echo -n "seven hundred "
		;;
		8)
		echo -n "eight hundred "
		;;
		9)
		echo -n "nine hundred "
		;;
	esac
fi


#### Printing the last two digits
if [ $two1 -le 19 ];then
	case "$two1" in
		0)
		;;
		1)
		echo -n "one "
		;;
		2)
		echo -n "two "
		;;
		3)
		echo -n "three "
		;;
		4)
		echo -n "four "
		;;
		5)
		echo -n "five "
		;;
		6)
		echo -n "six "
		;;
		7)
		echo -n "seven "
		;;
		8)
		echo -n "eight "
		;;
		9)
		echo -n "nine "
		;;
		10)
		echo -n "ten "
		;;
		11)
		echo -n "eleven "
		;;
		12)
		echo -n "twelve "
		;;
		13)
		echo -n "thirteen "
		;;
		14)
		echo -n "fourteen "
		;;
		15)
		echo -n "fifteen "
		;;
		16)
		echo -n "sixteen "
		;;
		17)
		echo -n "seventeen "
		;;
		18)
		echo -n "eighteen "
		;;
		19)
		echo -n "nineteen "
		;;
	esac
else
	case "$ten1" in
		2)
		echo -n  "twenty "
		case "$one1" in
			0)
			;;
			1)
			echo -n "one "
			;;
			2)
			echo -n "two "
			;;
			3)
			echo -n "three "
			;;
			4)
			echo -n "four "
			;;
			5)
			echo -n "five "
			;;
			6)
			echo -n "six "
			;;
			7)
			echo -n "seven "
			;;
			8)
			echo -n "eight "
			;;
			9)
			echo -n "nine "
			;;
		esac
		;;
		3)
		echo -n "thirty "
		case "$one1" in
			0)
			;;
			1)
			echo -n "one "
			;;
			2)
			echo -n "two "
			;;
			3)
			echo -n "three "
			;;
			4)
			echo -n "four "
			;;
			5)
			echo -n "five "
			;;
			6)
			echo -n "six "
			;;
			7)
			echo -n "seven "
			;;
			8)
			echo -n "eight "
			;;
			9)
			echo -n "nine "
			;;
		esac
		;;
		4)
		echo -n "forty "
		case "$one1" in
			0)
			;;
			1)
			echo -n "one "
			;;
			2)
			echo -n "two "
			;;
			3)
			echo -n "three "
			;;
			4)
			echo -n "four "
			;;
			5)
			echo -n "five "
			;;
			6)
			echo -n "six "
			;;
			7)
			echo -n "seven "
			;;
			8)
			echo -n "eight "
			;;
			9)
			echo -n "nine "
			;;
		esac
		;;
		5)
		echo -n "fifty "
		case "$one1" in
			0)
			;;
			1)
			echo -n "one "
			;;
			2)
			echo -n "two "
			;;
			3)
			echo -n "three "
			;;
			4)
			echo -n "four "
			;;
			5)
			echo -n "five "
			;;
			6)
			echo -n "six "
			;;
			7)
			echo -n "seven "
			;;
			8)
			echo -n "eight "
			;;
			9)
			echo -n "nine "
			;;
		esac
		;;
		6)
		echo -n "sixty "
		case "$one1" in
			0)
			;;
			1)
			echo -n "one "
			;;
			2)
			echo -n "two "
			;;
			3)
			echo -n "three "
			;;
			4)
			echo -n "four "
			;;
			5)
			echo -n "five "
			;;
			6)
			echo -n "six "
			;;
			7)
			echo -n "seven "
			;;
			8)
			echo -n "eight "
			;;
			9)
			echo -n "nine "
			;;
		esac
		;;
		7)
		echo -n "seventy "
		case "$one1" in
			0)
			;;
			1)
			echo -n "one "
			;;
			2)
			echo -n "two "
			;;
			3)
			echo -n "three "
			;;
			4)
			echo -n "four "
			;;
			5)
			echo -n "five "
			;;
			6)
			echo -n "six "
			;;
			7)
			echo -n "seven "
			;;
			8)
			echo -n "eight "
			;;
			9)
			echo -n "nine "
			;;
		esac
		;;
		8)
		echo -n "eighty "
		case "$one1" in
			0)
			;;
			1)
			echo -n "one "
			;;
			2)
			echo -n "two "
			;;
			3)
			echo -n "three "
			;;
			4)
			echo -n "four "
			;;
			5)
			echo -n "five "
			;;
			6)
			echo -n "six "
			;;
			7)
			echo -n "seven "
			;;
			8)
			echo -n "eight "
			;;
			9)
			echo -n "nine "
			;;
		esac
		;;
		9)
		echo -n "ninety "
		case "$one1" in
			0)
			;;
			1)
			echo -n "one "
			;;
			2)
			echo -n "two "
			;;
			3)
			echo -n "three "
			;;
			4)
			echo -n "four "
			;;
			5)
			echo -n "five "
			;;
			6)
			echo -n "six "
			;;
			7)
			echo -n "seven "
			;;
			8)
			echo -n "eight "
			;;
			9)
			echo -n "nine "
			;;
		esac
		;;
	esac		
fi

#### To shift cursor in terminal to next line
echo "" 

