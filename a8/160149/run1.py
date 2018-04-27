import os
from csv import *
import commands

data = reader(open('threads.txt', 'r'), delimiter=" ")
data2=reader(open('params.txt', 'r'), delimiter=" ")
threads, params = [], []
thread_n=0
param_n=0

theFile = open("params.txt", "r")
params = []
for val in theFile.read().split():
    params.append(int(val))
theFile.close()

# My input read assumes that every.entry in params and threads is in seperate lines 
# otherwise we have to change the input format
for row in data:
    threads.append(int(row[0]))
    thread_n+=1    
#for row in data2:
#    params.append(int(row[0]))
#    param_n+=1    

th=1
t1=open("t1_full.txt","w")
for pa in params:
    i=0
    while i<100 :
        op=commands.getoutput("./app "+str(pa) +" "+ str(th))
        st=op[13:]
        a,b=st.split(" ")
        

        t1.write(""+str(pa)+" "+a+"\n")
        i+=1
      
t1.close()

th=2
t2=open("t2_full.txt","w")
for pa in params:
    i=0
    while i<100 :
        op=commands.getoutput("./app "+str(pa) +" "+ str(th))
        st=op[13:]
        a,b=st.split(" ")
        
        t2.write(""+str(pa)+" "+a+"\n")
        i+=1
      
t2.close()

th=4
t4=open("t4_full.txt","w")
for pa in params:
    i=0
    while i<100 :
        op=commands.getoutput("./app "+str(pa) +" "+ str(th))
        st=op[13:]
        a,b=st.split(" ")
        
        t4.write(""+str(pa)+" "+a+"\n")
        i+=1
      
t4.close()

th=8
t8=open("t8_full.txt","w")
for pa in params:
    i=0
    while i<100 :
        op=commands.getoutput("./app "+str(pa) +" "+ str(th))
        st=op[13:]
        a,b=st.split(" ")
        
        t8.write(""+str(pa)+" "+a+"\n")
        i+=1
      
t8.close()

th=16
t16=open("t16_full.txt","w")
for pa in params:
    i=0
    while i<100 :
        op=commands.getoutput("./app "+str(pa) +" "+ str(th))
        st=op[13:]
        a,b=st.split(" ")
        
        t16.write(""+str(pa)+" "+a+"\n")
        i+=1
      
t16.close()

