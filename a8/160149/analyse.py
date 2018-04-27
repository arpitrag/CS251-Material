import os
import commands

s1 = open("t1_full.txt", "r")
s2 = open("t2_full.txt", "r")
s4 = open("t4_full.txt", "r")
s8 = open("t8_full.txt", "r")
s16 = open("t16_full.txt", "r")
i=0
result=open("result.txt","w")
for j in s1.read().split():
    i+=1
s1.close()
#print i
# since i counts 2 for each line : one for first integer and second for the other integer
length=i/2  
#print length
i=0
param=length/100
to1=0
sq1=0
# to : total (sum) sq: square sum var: variance
var1=0
to2=0
sq2=0
var2=0
to4=0
sq4=0
var4=0
to8=0
sq8=0
var8=0
to16=0
sq16=0
var16=0
s1 = open("t1_full.txt", "r")
a1=s1.read().split()
a2=s2.read().split()
a4=s4.read().split()
a8=s8.read().split()
a16=s16.read().split()
#print len(a2)
#print a1
i=0
while i<length:
	if (i%100==0 and i!=0):
		to1=to1/100
		sq1=sq1/100
		to2=to2/100
		sq2=sq2/100
		to4=to4/100
		sq4=sq4/100
		to8=to8/100
		sq8=sq8/100
		to16=to16/100
		sq16=sq16/100
		var1=sq1-(to1*to1)
		var2=sq2-(to2*to2)
		var4=sq4-(to4*to4)
		var8=sq8-(to8*to8)
		var16=sq16-(to16*to16)
		result.write(""+str(w1)+" "+str(to1)+" "+str(var1)+" "+str(to2)+" "+str(var2)+" "+str(to4)+" "+str(var4)+" "+str(to8)+" "+str(var8)+" "+str(to16)+" "+str(var16)+"\n")
		to1=0
		sq1=0
		to2=0
		sq2=0
		to4=0
		sq4=0
		to8=0
		sq8=0
		to16=0
		sq16=0
		
	w1=int(a1[2*i])
	to1+=int(a1[(2*i)+1])
	to2+=int(a2[(2*i)+1])
	to4+=int(a4[(2*i)+1])
	to8+=int(a8[(2*i)+1])
	to16+=int(a16[(2*i)+1])
	sq1+=int(int(a1[(2*i)+1]) * int(a1[(2*i)+1]))
	sq2+=int(int(a2[(2*i)+1]) * int(a2[(2*i)+1]))
	sq4+=int(int(a4[(2*i)+1]) * int(a4[(2*i)+1]))
	sq8+=int(int(a8[(2*i)+1]) * int(a8[(2*i)+1]))
	sq16+=int(int(a16[(2*i)+1]) * int(a16[(2*i)+1]))
	i+=1
to1=to1/100
sq1=sq1/100
to2=to2/100
sq2=sq2/100
to4=to4/100
sq4=sq4/100
to8=to8/100
sq8=sq8/100
to16=to16/100
sq16=sq16/100
var1=sq1-(to1*to1)
var2=sq2-(to2*to2)
var4=sq4-(to4*to4)
var8=sq8-(to8*to8)
var16=sq16-(to16*to16)
result.write(""+str(w1)+" "+str(to1)+" "+str(var1)+" "+str(to2)+" "+str(var2)+" "+str(to4)+" "+str(var4)+" "+str(to8)+" "+str(var8)+" "+str(to16)+" "+str(var16)+"\n")
		
#print i
result.close()
s1.close()
s2.close()
s4.close()
s8.close()
s16.close()