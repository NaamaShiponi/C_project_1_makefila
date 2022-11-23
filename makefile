
CC=gcc
CFLAGS = -g -Wall
AR= ar
MAIN_OBJFILES=main.o
ALL_OBJFILES=mains maindloop maindrec loops recursives recursived loopd
LOOP_OBJFILES = basicClassification.o advancedClassificationLoop.o 
RECURSION_OBJFILES = basicClassification.o advancedClassificationRecursion.o


all: $(ALL_OBJFILES)

mains:  $(MAIN_OBJFILES) libclassrec.a
	$(CC) $(MAIN_OBJFILES) libclassrec.a -o mains

maindloop: $(MAIN_OBJFILES) libclassloops.so
	$(CC) $(CFLAGS) $(MAIN_OBJFILES) ./libclassloops.so -o maindloop

maindrec:$(MAIN_OBJFILES) libclassrec.so
	$(CC) $(MAIN_OBJFILES) ./libclassrec.so -o maindrec


loops: libclassloops.a

libclassloops.a: $(LOOP_OBJFILES) 
	$(AR) -rcs libclassloops.a $(LOOP_OBJFILES)


recursives: libclassrec.a

libclassrec.a: $(RECURSION_OBJFILES) 
	$(AR) -rcs libclassrec.a $(RECURSION_OBJFILES)


recursived:libclassrec.so

libclassrec.so: $(RECURSION_OBJFILES) 
	$(CC) -shared $(RECURSION_OBJFILES) -o ./libclassrec.so



loopd: libclassloops.so

libclassloops.so: $(LOOP_OBJFILES) 
	$(CC) -shared $(LOOP_OBJFILES) -o ./libclassloops.so



$(MAIN_OBJFILES): main.c NumClass.h
	$(CC) $(CFLAGS) -c main.c 
	
basicClassification.o: basicClassification.c
	$(CC) $(CFLAGS) -fPIC -c basicClassification.c

advancedClassificationLoop.o: advancedClassificationLoop.c
	$(CC) $(CFLAGS) -fPIC -c advancedClassificationLoop.c

advancedClassificationRecursion.o: advancedClassificationRecursion.c
	$(CC) $(CFLAGS) -fPIC -c advancedClassificationRecursion.c


.PHONY: clean

clean:
	rm -f *.a *.o *.so $(ALL_OBJFILES) 
