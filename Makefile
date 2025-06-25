TARGET = ./build

.PHONY: all
all: ./build/main.exe
	echo 'Build Done'
./build/main.exe: ./build/main.o ./build/Count.o
	g++ ./build/main.o ./build/Count.o -o ./build/main.exe

./build/main.o: main.cpp ./include/Count.h
	mkdir -p build
	g++ -I./include -c main.cpp -o ./build/main.o

./build/Count.o: ./src/Count.cpp ./include/Count.h
	mkdir -p build
	g++ -I./include -c ./src/Count.cpp -o ./build/Count.o

.PHONY: staticlib
staticlib:
	g++ -I./include -c src/Count.cpp -o ./build/Count.o
	mkdir lib
	ar rvs ./lib/Count.a ./build/Count.o
	echo 'Create static lib done'
.PHONY: clean
clean:
	rm -rf ./build

.PHONY: run 
run:
	./build/main.exe