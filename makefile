
LOOP_SOURCES = basicClassification.o advancedClassificationLoop.o 
RECURSION_SOURCES = basicClassification.o advancedClassificationRecursion.o

mains:  main.o recursives
	gcc -fPIC main.o libclassrec.a -o mains

loop: $(LOOP_SOURCES) 
	ar rcs libclassloops.a $(LOOP_SOURCES)

recursives: $(RECURSION_SOURCES) 
	ar rcs libclassrec.a $(RECURSION_SOURCES)

recursivesd: $(RECURSION_SOURCES) 
	gcc -shared libclassrec.so $(RECURSION_SOURCES)

loopd: $(LOOP_SOURCES) 
	gcc -shared $(LOOP_SOURCES) -o libclassloops.so

main.o: main.c NumClass.h
	gcc -Wall -c main.c 
	
basicClassification.o: basicClassification.c
	gcc -Wall -c basicClassification.c

advancedClassificationLoop.o: advancedClassificationLoop.c
	gcc -Wall -c advancedClassificationLoop.c

advancedClassificationRecursion.o: advancedClassificationRecursion.c
	gcc -Wall -c advancedClassificationRecursion.c



