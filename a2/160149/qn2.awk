#!/usr/bin/gawk
BEGIN{
	
}
function time_difference(time1,time2){  ## calculate t1-t2
	split(time1, t1, /:/)
	split(time2, t2, /:/)
	t1[1]=3600*t1[1]
	t1[2]=60*t1[2]
	one=t1[1]+t1[2]+t1[3]
	t2[1]=3600*t2[1]
	t2[2]=60*t2[2]
	two=t2[1]+t2[2]+t2[3]
	total=one-two
	return total
}

function compare(time1,time2){
	if(time1>time2) return 1
	else return -1
} 



{
	len[sender " " receiver] = $NF
	sender=$3
	receiver=$5
	
	split($1, t1, /:/)
	t1[1]=3600*t1[1]
	t1[2]=60*t1[2]
	t=t1[1]+t1[2]+t1[3]
	#print t	


	calls[sender " " receiver]++;
	if (calls[sender " " receiver]==1) re[sender " " receiver]=0
	if( $NF != 0 ){	
		split($9,sequence,/,/)
		#print "yoyo"
		#print "seq=" sequence[1]
		split(sequence[1],ends,/:/)
		#print "sequence=" sequence[1]
		from = ends[1]
		#print "from"from 
		till = ends[2]
		#print "till" till
	}
	else if($r ~ /:/){
		split($r,r1sequence,/,/)
		split(r1sequence[1],r2sequence,/\]/)
		split(r2sequence[1],sequence2,/\{/)
		split(sequence2[2],sequence3,/\}/)
		desequence=sequence3[1]
		split(desequence,ends,/:/)
		from=ends[1]
		till=ends[2]
		#print "2"
	}
	else{
		#print "3"
		flag=1
	}

	for(l=from;l<till;l++){
		if ( check[sender " " receiver ">" l] == "7" ){
			re[sender " " receiver]++;
		}
		else{
			check[sender " " receiver ">" l] = "7"
		}
	}
#$1
	############################# Beware of ###########################
	#start[p[]]=
	
	if (calls[sender " " receiver]==1) dp[sender " " receiver]=0
	if (calls[sender " " receiver]==1) tmin[sender " " receiver]=t
	if (calls[sender " " receiver]==1) tmax[sender " " receiver]=t
	
	
	if ($NF !=0 ) dp[sender " " receiver]++
	data[sender " " receiver]+= $NF
	if (compare(tmin[sender " " receiver],t)==1) tmin[sender " " receiver]=t
	if (compare(tmax[sender " " receiver],t)== -1) tmax[sender " " receiver]=t
	#print $1	
}

END{
	for (i in calls){
		if (calls[i]==-1) continue;
		#print i
		split(i,j,/:/)
		#print i
		split(j[1],ips,/ /) # ips contain ips[1] and ips[2] 
		split(ips[1],ip1,/\./)# ip1[1]= ip of first # ip1[2]= port of first  
		split(ips[2],ip2,/\./)# ip2[1]= ip of second
		#print calls[ips[1] " " ips[2] ":"]
		#print ips[1] " " ips[2]
		printf("Connection (A=")
		for (i=1;i<=5;i++){
			if(i==5){
				 printf(":%s",ip1[i]) 
				 continue;
			}
			if(i==4){
				 printf("%s",ip1[i]) 
				 continue;
			}
			printf("%s.",ip1[i])
			
		}
		printf(" B=")
		for (i=1;i<=5;i++){
			if(i==5){
				 printf(":%s",ip2[i]) 
				 continue;
			}
			if(i==4){
				 printf("%s",ip2[i]) 
				 continue;
			}
			printf("%s.",ip2[i])
			
		}printf(")\n")
		#print ips[1] " " ips[2] ":"
		if (compare(tmax[ips[1] " " ips[2] ":"],tmax[ips[2] " " ips[1] ":"])== -1){
			max=tmax[ips[2] " " ips[1] ":"]
		}
		else{
			max=tmax[ips[1] " " ips[2] ":"]
		}		
		if (compare(tmin[sender " " receiver],tmin[ips[2] " " ips[1] ":"])== -1){
			min=tmin[ips[1] " " ips[2] ":"]
		}
		else{
			min=tmin[ips[2] " " ips[1] ":"]	
		}

		diff=max-min
		#print diff

		xput1=data[ips[1] " " ips[2] ":"]/diff
		xput2=data[ips[2] " " ips[1] ":"]/diff

		
		#####Include Retrans Term in Prinf and XPUT######
		printf("A-->B #packets=%s, #datapacks=%s, #bytes=%s, #retrans=%s, xput=%0.f bytes/sec\n",calls[ips[2] " " ips[1] ":"], dp[ips[2] " " ips[1] ":"], data[ips[2] " " ips[1] ":"], re[ips[2] " " ips[1] ":"],  xput2)
		printf("A-->B #packets=%s, #datapacks=%s, #bytes=%s, #retrans=%s, xput=%0.f bytes/sec\n",calls[ips[1] " " ips[2] ":"], dp[ips[1] " " ips[2] ":"], data[ips[1] " " ips[2] ":"], re[ips[1] " " ips[2] ":"], xput1)




		calls[ips[2] " " ips[1] ":"]=-1
	}
}