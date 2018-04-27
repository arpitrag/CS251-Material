def con(char):
    if char=='0':
        return 0
    elif char=='1':
        return 1
    elif char=='2':
        return 2
    elif char=='3':
        return 3
    elif char=='4':
        return 4
    elif char=='5':
        return 5
    elif char=='6':
        return 6
    elif char=='7':
        return 7
    elif char=='8':
        return 8
    elif char=='9':
        return 9
    elif char=='A':
        return 10
    elif char=='B':
        return 11
    elif char=='C':
        return 12
    elif char=='D':
        return 13
    elif char=='E':
        return 14
    elif char=='F':
        return 15
    elif char=='G':
        return 16
    elif char=='H':
        return 17
    elif char=='I':
        return 18
    elif char=='J':
        return 19
    elif char=='K':
        return 20
    elif char=='L':
        return 21
    elif char=='N':
        return 22
    elif char=='M':
        return 23
    elif char=='O':
        return 24
    elif char=='P':
        return 25
    elif char=='Q':
        return 26
    elif char=='R':
        return 27
    elif char=='S':
        return 28
    elif char=='T':
        return 29
    elif char=='U':
        return 30
    elif char=='V':
        return 31
    elif char=='W':
        return 32
    elif char=='X':
        return 33
    elif char=='Y':
        return 34
    elif char=='Z':
        return 35
    else:
        return -1

def leng(str):
    i=0
    for j in str:
        i+=1
    return i

def leng_decimal(str):
    i=0
    for j in str:
        if j=='.':
            break
        i+=1
    return i

def leng_decimalpart(str):
    i=0
    flag=0
    for j in str:
        if flag==1:
            i+=1   
        if j=='.':
            flag=1
        
    return i


def ten_power(ex):
    ans=1
    for t in range(0,ex):
        ans*=10
    #ans /=10
    return ans
    
def ex_power(ex,power):
    ans=1
    for t in range(0,power):
        ans*=ex
    #ans /=10
    return ans
 

#a=con('a')
##print a
from sys import *
from decimal import *
decimal_str2=argv[1]
base_str=argv[2]

#r="-00000dfjkh.fhh"
if decimal_str2[0]=='-':
    negative=1
else :
    negative=0

inde=0
for i in decimal_str2:
    #print i
    if i=='-' and inde==0 :
        inde+=1
        continue
    if i!='0':
        break
    inde+=1
    #print inde

if negative==1:
    decimal_str="-"+decimal_str2[inde:]
else:
    decimal_str=decimal_str2[inde:]

#print decimal_str

##print decimal_str
##print base_str
#print type(base_str)

base=0
ten_pow=1
base_len=leng(base_str)
ten_pow = ten_power(base_len-1)
#print base_len
#print ten_pow
for i in base_str:
    #print i
    base+= (Decimal(con(i)*ten_pow))
    #print "base=",base,"i=",i
    ten_pow /=10
#base+=35   
#print base

if decimal_str[0]=='-':
    negative=1
else :
    negative=0

#positive_part=''
#pos_in=0
#for i in decimal_str:
#    if i=='.':
#        break
#    positive_part[pos_in]=decimal_str[pos_in]
#    pos_in+=1
#
##print positive_part

##print negative

decimal_len=leng_decimal(decimal_str)
#print "decimal len=",decimal_len

decimalpart_len=leng_decimalpart(decimal_str)
#print "decimal part len=",decimalpart_len


ex=0
for v in decimal_str:
    if decimal_str[ex]=='.' and ex==decimal_len:
        ex+=1
        continue
    if decimal_str[ex]=='-' and ex==0:
        ex+=1
        #basepower/=base
        continue
    if con(decimal_str[ex]) >= base or con(decimal_str[ex])==-1 :
        #print decimal_str[ex]
        if (con(decimal_str[ex]) >= base):
            m=1
        else:
            m=0 
        if (con(decimal_str[ex])==-1):
            n=1
        else:
            n=0
        #print m,n
        #print "yoyo"
        #print con(decimal_str[ex])
        print "Invalid Input"
        exit()
    ex+=1

total=decimal_len+decimalpart_len    
if total==0:
    print "0"
    exit()

basepower=ex_power(base,(decimal_len-1))
answer=0
index=0
for t in range(0,decimal_len):
    if decimal_str[t]=='-' and index==0:
        index+=1
        basepower/=base
        continue
    #print "value of element=",con(decimal_str[t])
    element=Decimal(con(decimal_str[t]))
    answer+= (basepower*element)
    basepower=basepower/base
    #print "element=",element,"answer=",answer
    index+=1
index+=1
basenegpower=Decimal(1/base)
#print answer
#t
for l in range(0,decimalpart_len):
    #print "basenegpower=",basenegpower
    #print "decimal number=", decimal_str[index]
    #print basenegpower*Decimal(con(decimal_str[index])) 
    answer+=basenegpower*Decimal(con(decimal_str[index]))
    #print answer
    basenegpower/=base
    index+=1

#print answer
if negative==1:
    answer=Decimal(0)-answer

print answer

#x=1.0
#x/=100000
##print x
