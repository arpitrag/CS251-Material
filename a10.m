

### To run the code type scatter instead of plot if you want the scatter type otherwise its fine 


#Step1

train_data=dlmread("train.csv",",",1,0);
#size(train_data)


x_train=train_data(:,1);
y_train=train_data(:,2);
x_train_col1=ones(size(train_data,1),1);
x_train=[x_train_col1,x_train];

#x_trainis now a n*2 dimension matrix with all 1 in 1st col

#Step2

w=rand(2,1);

#Step3

hold on;
plot(x_train(:,2),y_train);

xlabel ("Feature");
ylabel ("Label read from Train.csv");
title ("Scatter Plot");

print -dpdf "Step3.1.pdf";
close


hold on;
plot(x_train(:,2),y_train);

xlabel ("Feature");
ylabel ("Label read from Train.csv");
title ("Scatter Plot");


x_train_t=x_train';
w_t=w';
pl=w_t*x_train_t;

hold on;
plot(x_train(:,2),pl);


print -dpdf "Step3.2.pdf";
close



####comment below !!!!!!!!!!!!!!!

#Step4

w_direct=(inv(x_train_t*x_train))*x_train_t*y_train;

hold on;
plot(x_train(:,2),y_train);

xlabel ("Feature");
ylabel ("Label read from Train.csv");
title ("Scatter Plot");

print -dpdf "Step4.1.pdf";
close


hold on;
plot(x_train(:,2),y_train);

xlabel ("Feature");
ylabel ("Label read from Train.csv");
title ("Scatter Plot");


x_train_t=x_train';
w_direct_t=w_direct';
pl=w_direct_t*x_train_t;

hold on;
plot(x_train(:,2),pl);


print -dpdf "Plot4.2.pdf";
close

#Step5

eta=0.00000001;
interval=0.01;



for i=1:2,
	#i
	for j=1:size(x_train,1),
		#j
		#size(x_train,1)
		temp_x=train_data(j,1);
		#temp_x
		temp_y=train_data(j,2);
		temp_x_mat=([1,temp_x])';
		#temp_x_mat;
		#size(w');
		#size(temp_x_mat);
		w=w-(eta*(((w')*(temp_x_mat))-temp_y)*temp_x_mat);
		#mod(j,100)
			###########commented below######
			###########change the value in mod below######
		
		if (mod(j,100)==0),
			#l=555
			#j

			hold on;
			plot(x_train(:,2),y_train);

			xlabel ("Feature");
			ylabel ("Label read from Train.csv");
			title ("Scatter Plot");


			x_train_t=x_train';
			w_t=w';
			pl=w_t*x_train_t;

			hold on;
			plot(x_train(:,2),pl);
			index1=num2str(i/100);
			index2=num2str(j/100);
			name=strcat("Plot ",index1," ",index2);
			print(name, "-dpdf");
			close
		end,	
		


	end,
end,

#Step6

hold on;
plot(x_train(:,2),y_train);

xlabel ("Feature");
ylabel ("Label read from Train.csv");
title ("Scatter Plot");


x_train_t=x_train';
w_t=w';
pl=w_t*x_train_t;

hold on;
plot(x_train(:,2),pl);

print -dpdf "Plot5.pdf";
close


#Step7

test_data=dlmread("test.csv",",",1,0);
#size(test_data)


x_test=test_data(:,1);
y_test=test_data(:,2);
x_test_col1=ones(size(test_data,1),1);
x_test=[x_test_col1,x_test];

y_pred_1=x_test*w;
y_pred_2=x_test*w_direct;

y_error1=y_pred_1 - y_test;
y_error2=y_pred_2 - y_test;


square1=0;
square2=0;

for i=1:size(x_test,1),
	square1=square1+(y_error1(i)*y_error1(i));
	square2=square2+(y_error2(i)*y_error2(i));
end,
square1=square1/size(x_test,1);
square2=square2/size(x_test,1);


root1=sqrt(square1)
root2=sqrt(square2)
