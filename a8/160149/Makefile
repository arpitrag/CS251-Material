
CC=gcc
CFLAGS= -g -I. -DDBG
OBJS = graphics.o math.o io.o main.o
LDFLAGS= -lpthread -lm
# 

all: cs251.ex1

cs251.ex1: build run analyse plots lat

build: app

app: prog.o thread_function.o 
	$(CC) prog.o thread_function.o common.h $(CFLAGS) $(LDFLAGS) -o app

prog.o: prog.c common.h
	$(CC) -c prog.c common.h $(CFLAGS)  

thread_function.o: thread_function.c common.h
	$(CC) -c thread_function.c common.h $(CFLAGS) 


run : t1_full.txt t16_full.txt t8_full.txt t4_full.txt t2_full.txt

t1_full.txt: params.txt threads.txt app run1.py
	python run1.py

t2_full.txt: params.txt threads.txt app run1.py
	python run1.py

t4_full.txt: params.txt threads.txt app run1.py
	python run1.py

t8_full.txt: params.txt threads.txt app run1.py
	python run1.py

t16_full.txt: params.txt threads.txt app run1.py
	python run1.py



analyse: result.txt

result.txt: t1_full.txt t16_full.txt t8_full.txt t4_full.txt t2_full.txt 
	python analyse.py

plots: Variance.eps speedup.eps  sca1.eps sca2.eps sca4.eps sca8.eps sca16.eps  aver.eps

sca1.eps:  t1_full.txt t16_full.txt t8_full.txt t4_full.txt t2_full.txt  result.txt scatter.p 
	gnuplot -e "filename='t1_full.txt' ; out='sca1.eps'" scatter.p	

sca2.eps:  t1_full.txt t16_full.txt t8_full.txt t4_full.txt t2_full.txt  result.txt scatter.p
	gnuplot -e "filename='t2_full.txt' ; out='sca2.eps'" scatter.p	

sca4.eps:  t1_full.txt t16_full.txt t8_full.txt t4_full.txt t2_full.txt  result.txt scatter.p
	gnuplot -e "filename='t4_full.txt' ; out='sca4.eps'" scatter.p	

sca8.eps:  t1_full.txt t16_full.txt t8_full.txt t4_full.txt t2_full.txt  result.txt scatter.p
	gnuplot -e "filename='t8_full.txt' ; out='sca8.eps'" scatter.p	

sca16.eps:  t1_full.txt t16_full.txt t8_full.txt t4_full.txt t2_full.txt  result.txt scatter.p
	gnuplot -e "filename='t16_full.txt' ; out='sca16.eps'" scatter.p	

aver.eps: t1_full.txt t16_full.txt t8_full.txt t4_full.txt t2_full.txt result.txt aver.p 
	gnuplot aver.p

speedup.eps: t1_full.txt t16_full.txt t8_full.txt t4_full.txt t2_full.txt  result.txt sp.p 
	gnuplot sp.p

Variance.eps: t1_full.txt t16_full.txt t8_full.txt t4_full.txt t2_full.txt  result.txt er.p 
	gnuplot er.p

###########################
##scatter_t1 -o scatter pc
lat: report.pdf

report.pdf: Variance.eps speedup.eps  sca1.eps sca2.eps sca4.eps sca8.eps sca16.eps  aver.eps report.tex
	pdflatex report.tex


clean: file_o file_gch file_eps application file_tex file_txt

file_txt:
	rm -f t1_full.txt t2_full.txt t4_full.txt t8_full.txt t16_full.txt result.txt

file_o:	
	rm -f *.o 

file_gch:
	rm -f *.gch

file_eps: 
	rm -f *.eps

application:
	rm -f app			

file_tex:
	rm -f *.pdf report.aux report.dvi report.log 