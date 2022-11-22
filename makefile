
CC=gcc
LOOP_SOURCES = basicClassification.o advancedClassificationLoop.o 
RECURSION_SOURCES = basicClassification.o advancedClassificationRecursion.o

all: mains maindloop maindrec recursives loopd recursivesd


mains:  main.o libclassrec.a
	$(CC) -fPIC main.o libclassrec.a -o mains

maindloop: main.o libclassloops.so
	$(CC) -fPIC main.o libclassloops.so -o maindloop

maindrec:main.o libclassrec.so
	$(CC) -fPIC main.o libclassrec.so -o maindrec



loop: libclassloops.a

libclassloops.a: $(LOOP_SOURCES) 
	ar rcs libclassloops.a $(LOOP_SOURCES)


recursives: libclassrec.a

libclassrec.a: $(RECURSION_SOURCES) 
	ar rcs libclassrec.a $(RECURSION_SOURCES)


recursivesd:libclassrec.so

libclassrec.so: $(RECURSION_SOURCES) 
	$(CC) -shared -o libclassrec.so $(RECURSION_SOURCES)



loopd: libclassloops.so

libclassloops.so: $(LOOP_SOURCES) 
	$(CC) -shared $(LOOP_SOURCES) -o libclassloops.so



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
	rm -f *.a *.o *.so mains maindloop maindrec recursives loopd recursivesd loop