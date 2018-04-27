#!/usr/bin/gawk

BEGIN{
	comment=0
	string=0
	start=0
	comline=0
}

{
	comline=0
	if ( start == 1 ) # If multi line comment is going on
	{
		if($0 ~ /\*\//){
			split($0,f, /\*\//);
			start=0
			comline=1
			comment++;
			e=f[2]
			split( e, a, /\".[^"]*\"/);	
			flag=0
			for (i in a)
		{
			flag=1
			#print a[i]
			if (start==0) string++;
			if (start==1){
				if (comline==0) comment++;
				comline=1
				if ( a[i] ~ /\*\// ){ # encounter */
					start=0
					
				}
				break;

			}
			else 
			{
				split( a[i], b, /\/\// );
				if ( a[i] ~ /\/\// ){ # // is encountered
					
					if ( b[1] ~ /\/\*.[^*/]*\*\// ){ # Multi Line Comment start and end
						start=0
						if (comline==0) comment++;
						#print "dad"
						comline=1

					}
					else if ( b[1] ~ /\/\*/ ){ # Multi line comment has started
						if (comline==0 )comment++;
						comline=1
						start=1;
					}
					else 
					{
						if(comline==0) comment ++;		
						break;			
					}
				}
				else
				{
					if ( b[1] ~ /\/\*.[^*/]*\*\// ){ # Multi Line Comment start and end
						start=0
						if (comline==0) comment++;
						comline=1

					}
					else if( b[1] ~ /\/\*/ ){ # Multi line comment has started
						if (comline==0 )comment++;
						comline=1
						start=1;
					}
					else {}
				}
			}
						
		}

		if (flag==1) string--;
		#print a[i]
		#print "strings="string
		#print "comments="comment
		#debug
			
		}
		else 
		{
			comment++
		}
	}
	else
	{
		split( $0, a, /\".[^"]*\"/);
		flag=0
		for (i in a)
		{
			flag=1
			#print a[i]
			if (start==0) string++;
			#print "dada"
			if (start==1){
				if (comline==0) comment++;
				comline=1
				if ( a[i] ~ /\*\// ){ # encounter */
					start=0
					
				}
				break;

			}
			else 
			{
				split( a[i], b, /\/\// );
				if ( a[i] ~ /\/\// ){ # // is encountered
					
					if ( b[1] ~ /\/\*.[^*/]*\*\// ){ # Multi Line Comment start and end
						start=0
						if (comline==0) comment++;
						#print "dad"
						comline=1

					}
					else if ( b[1] ~ /\/\*/ ){ # Multi line comment has started
						if (comline==0 )comment++;
						comline=1
						start=1;
					}
					else 
					{
						if (comline==0) comment ++;		
						break;			
					}
				}
				else
				{
					if ( b[1] ~ /\/\*.[^*/]*\*\// ){ # Multi Line Comment start and end
						start=0
						if (comline==0) comment++;
						comline=1

					}
					else if( b[1] ~ /\/\*/ ){ # Multi line comment has started
						if (comline==0 )comment++;
						comline=1
						start=1;
					}
					else {}
				}
			}
						
		}
		if (flag==1) string--;
		#print a[i]
		#print "strings="string
		#print "comments="comment
		#print "debug"

	}





}

END{
	print comment " " string
	
	
}
