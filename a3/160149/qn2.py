from csv import *
from numpy import *
from decimal import *
import math
from numpy.linalg import inv
import matplotlib.pyplot as plt
data = reader(open('train.csv', 'r'), delimiter=",")
column1, column2 = [], []
index=0
line={}
for row in data:
    if index==0:
        index+=1
        continue
    column1.append(float(row[0]))
    column2.append(float(row[1]))
    zero_str=str(index)+' 0'
    one_str=str(index)+' 1'
    line[zero_str]=(float(row[0]))
    line[one_str]=(float(row[1]))
    index+=1    
col_length_train=index-1
#print line
#print col_length_train
    

x_train=matrix(column1).transpose()
y_train=matrix(column2).transpose()
#print x_train
#print y_train
#print x_train.size
#print y_train.shape

x_train=insert(x_train, 0, 1, axis=1)
#print x_train

w=random.rand(2,1)
#print w
#print x_train[:,1]
w_t=w.transpose()
x_train_t=x_train.transpose()
z=w_t*x_train_t
z=z.transpose()
#print z.shape
#print (x_train[:,1]).shape

plt.plot(x_train[:,1],y_train,'ro')
plt.show()

plt.plot(x_train[:,1],y_train,'ro',x_train[:,1],z,'k')
plt.show()
#w_direct###########################
mul=(x_train.transpose() * x_train)
r=(1.000/mul[0,0])
w_direct = ( inv((x_train.transpose()*x_train))*x_train.transpose())*y_train
#print w_direct
plt.plot(x_train[:,1],y_train,'ro')
plt.show()
z=w_direct.transpose()*x_train_t
z=z.transpose()
plt.plot(x_train[:,1],y_train,'ro',x_train[:,1],z,'k')
plt.show()
eta=0.00000001
interval=0.01
zero_str=str(120)+'0'
#print zero_str
for i in range(0,2): ##############check range
    for j in range(0,col_length_train):
    	#x,y=line[j]
    	zero_str=str(j+1)+' 0'
    	one_str=str(j+1)+' 1'
    	x=line[zero_str]
    	y=line[one_str]
    	x_=(matrix([1,x])).transpose()
    	y=matrix(y)
    	"""
    	print x
    	print matrix([1,x])
    	print w.transpose().shape
    	print x_.shape
    	print matrix(w.transpose()*x_).shape
    	print y,y.shape
    	print matrix(eta*x_).shape
    	"""
    	w=w - ((eta*(w.transpose()*x_ - y))[0,0])*x_
    	###############check#############
    	if j%1000==0:
    		z=w.transpose()*x_train_t
    		z=z.transpose()
    		###################################################
    		plt.plot(x_train[:,1],y_train,'ro',x_train[:,1],z,'k')
			plt.show()			



z=w.transpose()*x_train_t
z=z.transpose()    		

plt.plot(x_train[:,1],y_train,'ro',x_train[:,1],z,'k')
plt.show()   		
#print w
######################################
#Evaluation
#print "#########################################"

data2 = reader(open('test.csv', 'r'), delimiter=",")
column3, column4 = [], []
index=0
#line={}
for rows in data2:
    if index==0:
        index+=1
        continue
    column3.append(float(rows[0]))
    column4.append(float(rows[1]))
    #zero_str=str(index)+' 0'
    #one_str=str(index)+' 1'
    #line[zero_str]=(float(row[0]))
    #line[one_str]=(float(row[1]))
    index+=1    
col_length_train2=index-1
#print line
#print col_length_train2
    

x_train2=matrix(column3).transpose()
y_train2=matrix(column4).transpose()
#print x_train2
#print y_train2
#print x_train2.size
#print y_train2.shape

x_train2=insert(x_train2, 0, 1, axis=1)
#print x_train2
#print x_train2.shape
#print w.shape
y_pred1=x_train2*w
#w_direct = (1.0/(x_train2.transpose() * x_train2))* x_train2.transpose()*y_train2
#print w_direct
#print w
y_train2_error1=y_pred1 - y_train2
#print y_train2_error1.shape
sum=0
for i in y_train2_error1:
	sum+= (i*i)

root1=math.sqrt((sum/col_length_train2))


y_pred2=x_train2*w_direct


y_train2_error2=y_pred2 - y_train2
#print y_train2_error2.shape
sum=0
for i in y_train2_error2:
	sum+= (i*i)

root2=math.sqrt((sum/col_length_train2))

print root1
print root2