num_samples <- 50000
v_dim<-100
data <- rexp(num_samples, 0.2)
data_raw<-data
##print(data)
sorted <- data.frame(X = seq(1, num_samples , 1), Y = sort(data))
x <- data.frame(X = seq(1, num_samples , 1), Y = data)
plot(sorted, main="Scatter Plot Step 1")
#print(x[[2]])
dash<-"----------------"
#print(dash)
mat <- matrix(x[[2]],v_dim, num_samples/v_dim )
#each col length is 100 total col is 500
#print(dim(mat))
##print(xcols)
##print(mat)


# xcols <- c(0:99)
# #print(length(xcols))
##print(mat[,2])
# cur<-mat[,2]
# #print(cur)
# pdata <- rep(0, v_dim);
# for(i in 1:v_dim){
#     val=round(cur[i],0);

#     ##print(val)
#     if(val <= 100){
#        pdata[val] <- pdata[val] + 1.0/ v_dim; 
#     }
# }


#xcols <- seq(from=0,to=24.75,by=0.25)
######Note that we need to make both cdf and pdf acc. to its range 0-1####


##print(mat)
#dash<-"----------------"
##print(dash)
#str(mat)

################________________##############
################________________##############
################________________##############

# for(i in 1:5){
# 	plot(density(mat[,i]))
# 	plot(ecdf(mat[,i]))
# }
################________________##############
################________________##############
################________________##############

################________________##############
for(i in 2:6){	
	xcols <- c(0:29)
	#print("yo")
	#print(length(xcols))
	cur<-mat[,i]
	#print(cur)
	pdata <- rep(0, 30);
	for(i in 1:v_dim){
	    val=round(cur[i],0);
			
	    ##print(val)
	    if(val <= 29){
	       pdata[round(val)] <- pdata[round(val)] + 1.0/ v_dim; 
	    }
	}

	#print(table(pdata))
	#print(length(pdata))
	#print(length(xcols))
	plot(xcols, pdata, "l", xlab="X", ylab="PDF(X)",col="red",main="PDF of Next Vector")


	cdata <- rep(0, 30)
	cdata[1]<-(pdata[1])
	for(i in 2:30){
	    cdata[i] = (cdata[i-1] + pdata[i])
	}
	plot(xcols, cdata, "o", col="blue", xlab="X", ylab="CDF(X)",main="CDF of Next Vector");
}

################________________##############

#print("debug1")
mean_data<-rep(0,500)
sd_data<-rep(0,500)
cur<-rep(0,500)
#print("Calculating Mean And Standard Deviation")
for (i in 1:500){
	cur<-mat[,i]
	sd_data[i]<-sd(cur)
	mean_data[i]<-mean(cur)
}
print("Printing Mean of First Five Vectors")
for (i in 1:5){
	#print(sd_data[i])
	print(mean_data[i])
}
print("Printing Standard Deviation of First Five Vectors")
for (i in 1:5){
	#print(sd_data[i])
	print(sd_data[i])
}

### Calculating mean of ith row of matrix
#print("Calculating Mean of Rows")

data_m<-rep(0,100)
# for (i in 1:100){
# 	data_m[i]<-mean(mat[i,])
# }
data_m<-mean_data

tab<-table(round(data_m,1))
plot(tab, "h", col="green",xlab="Value", ylab="Frequency" , main="Frequency of Means")

xcols<-seq(from=4,to=5.9,by=0.1)
pdata<-rep(0,20)
for (i in 1:500){
	val<-round(data_m[i],1)
	if(val<=5.9 && val>=4){
		pdata[(val-3.9)*10]<-pdata[(val-3.9)*10]+1/500
	}
}
plot(xcols, pdata, "o", col="blue", xlab="X", ylab="PDF(X)",main="PDF of Means");

cdata<-rep(0,20)
cdata[1]<-pdata[1]
for (i in 2:20){
	cdata[i]<-cdata[i-1]+pdata[i]
}
plot(xcols, cdata, "o", col="blue", xlab="X", ylab="CDF(X)",main="CDF of Means");

########____________##########
################________________##############
################________________##############
################________________##############

# plot(density(data_m))
# plot(ecdf(data_m))

########____________##########
################________________##############
################________________##############
################________________##############
################________________##############

overall_mean<-0
overall_sd<-0

#print("Calculating Mean and Standard Deviation of Means")
overall_mean<-mean(mean_data)
overall_sd<-sd(mean_data)
#print()
print("According to the Central Limit Theorem For the distribution of Means")
print("Mean is close to Mean of Original Distribution")
print("Standard Deviation tends to zero as we go on having more number of Sample Vectors")
print("Following are the Mean and Standard Deviation of Means Respectively")
print(overall_mean)
print(overall_sd)
print("Following are the Mean and Standard Deviation of Initial Distribution Respectively")
print(mean(data_raw))
print(sd(data_raw))
