#/bin/bash
walk() {
        local indent="${2:-0}" 
        ## if $2 is unassigned then set indent to 0 else $2
        #echo "$entry"
        entry=$1   ##declaration
        #echo $entry
        current=`echo $entry | rev | cut -d '/' -f1 | rev` 
        ## taking out only the name of file and folder not the whole of location
        sentence1=`grep -rE "[\!|\.|\?]" -o "$1"| wc -w`
        ## Counting total ./? in doc
        decimal=`grep -rE "[0-9]\.[0-9]" -o "$1"| wc -w`
        ## counting number with decimals
        sentence=$(($sentence1-$decimal))
        ## counting exact sentences
        integer1=`grep -rE "[0-9]+" -o "$1"| wc -w`
        ## counting total integers with decimals
        integer=$(($integer1-$((2*$decimal))))
        ## deleting numbers with decimals
		#echo -n "esntence1=$sentence1 decimal=$decimal integer1=$integer1 integer=$integer sentence=$sentence"
        if [[ -d "$entry" ]];then
        ## if directory
        	printf  "%*s(D)%s\n" $indent '' "$current-$sentence-$integer"  
        else
			printf  "%*s(F)%s\n" $indent '' "$current-$sentence-$integer"
		fi        	
        ##recursively calling
        for entry in "$1"/*; do
                [[ -d "$entry" ]] && walk "$entry" $((indent+4))
                [[ -f "$entry" ]] && walk "$entry" $((indent+4))
        done
}
walk "$1"

####/home/arpitrag/Downloads/exercise-1b/ | wc -w