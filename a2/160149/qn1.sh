#/bin/bash

#comment=0
string=0
regex='\.c$'
walk() {
        entry=$1   
        if [[ -f "$entry" ]];then
                if [[ "$entry" =~ $regex ]];then
                        comment_com=`awk -f qn1.awk "$1" | cut -f1 -d ' '`
                        comment=$(($comment+$comment_com))
                        string_com=`awk -f qn1.awk "$1" | cut -f2 -d ' '`
                        string=$(($string+$string_com))
                fi
                
        fi        	

        for entry in "$1"/*; do
                [[ -d "$entry" ]] && walk "$entry"
                [[ -f "$entry" ]] && walk "$entry"
        done
}
walk "$1"

echo $comment " " $string

##comment+=
#string+=
#q