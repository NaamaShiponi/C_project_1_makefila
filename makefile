
CC=gcc
LOOP_SOURCES = basicClassification.o advancedClassificationLoop.o 
RECURSION_SOURCES = basicClassification.o advancedClassificationRecursion.o
ALL_SOURCES=mains maindloop maindrec loops recursives recursivesd loopd


all: $(ALL_SOURCES)

mains:  main.o libclassrec.a
	$(CC) main.o libclassrec.a -o mains

maindloop: main.o libclassloops.so
	$(CC) -Wall main.o ./libclassloops.so -o maindloop

maindrec:main.o libclassrec.so
	$(CC) main.o ./libclassrec.so -o maindrec


loops: libclassloops.a

libclassloops.a: $(LOOP_SOURCES) 
	ar rcs libclassloops.a $(LOOP_SOURCES)


recursives: libclassrec.a

libclassrec.a: $(RECURSION_SOURCES) 
	ar rcs libclassrec.a $(RECURSION_SOURCES)


recursivesd:libclassrec.so

libclassrec.so: $(RECURSION_SOURCES) 
	$(CC) -shared -fPIC -o ./libclassrec.so $(RECURSION_SOURCES)



loopd: libclassloops.so

libclassloops.so: $(LOOP_SOURCES) 
	$(CC) -shared -fPIC $(LOOP_SOURCES) -o ./libclassloops.so



main.o: main.c NumClass.h
	$(CC) -Wall -c main.c 
	
basicClassification.o: basicClassification.c
	$(CC) -Wall -c basicClassification.c

advancedClassificationLoop.o: advancedClassificationLoop.c
	$(CC) -Wall -c advancedClassificationLoop.c

advancedClassificationRecursion.o: advancedClassificationRecursion.c
	$(CC) -Wall -c advancedClassificationRecursion.c


.PHONY: clean

clean:
	rm -f *.a *.o *.so mains maindloop maindrec recursives loopd recursivesd loops
