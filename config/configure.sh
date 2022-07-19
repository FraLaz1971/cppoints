#/usr/bin/env bash
echo "generating total makefile for $(uname) $OS ..." >/dev/stderr
a=0;t=0;TARGETS="";RMTARGETS=""; EEXT="";OEXT=".o"
echo 'CC=gcc -g '
echo 'CXX=g++ -g '
echo 'LD=g++ '
echo 'CXXFLAGS = '
echo 'CFLAGS = '
echo 'RM = rm -f'
echo 'MV = mv '
echo 'CP = cp '
echo 'MAKE = make'
echo 'SRC = $(wildcard src/*.cpp)'
echo "OBJ = src/*.o"
echo 'CPPFLAGS = -Isrc'
echo 'LIBS = '
echo 'LDFLAGS ='
echo 'EEXT='
echo 'OEXT=.o'

for t in $(ls -1 src/*.c)
do
	TARGET=$(basename ${t%.*})
	echo 'TARGET'$a = $TARGET
	TARGETS="$TARGET $TARGETS"
	if [[ ( $TARGET != "usepoints" ) && ($TARGET != "usepoints") ]]
	then
        RMTARGETS="src/$TARGET$EEXT $RMTARGETS"
	fi
	a=$(($a+1))
done
echo 'TARGETS' = $TARGETS src/usepoints$(EEXT)
echo 'RMTARGETS' = $RMTARGETS src/usepoints$(EEXT)
echo 'all: $(TARGETS) '
a=0
for s in $(ls -1 src/*.cpp)
do
	TARGET=$(basename ${s%.*})
        if [[ ($TARGET != "points") && ($TARGET != "usepoints") ]]
        then
                echo 'src/$(TARGET'$a')$(EEXT): src/$(TARGET'$a')'.c
                echo -e "\t"'$(CC) $(CPPFLAGS) src/$(TARGET'$a').c  -o src/'$TARGET$EEXT' $(LDFLAGS)'
                echo '$(TARGET'$a'): src/$(TARGET'$a')$(EEXT)'
        fi
	a=$(($a+1)) 
done
#handle multifile targets
echo 'src/point$(OEXT): src/point.cpp src/point.h src/defines.h'
echo -e "\t"'$(CXX)  $(CPPFLAGS) -c src/point.cpp   -o src/point$(OEXT) '
echo 'src/usepoints$(OEXT): src/usepoints.cpp src/point.h src/defines.h '
echo -e "\t"'$(CXX)  $(CPPFLAGS) -c src/usepoints.cpp  -o  src/usepoints$(OEXT) '
echo 'src/usepoints$(EEXT): src/point$(OEXT) src/usepoints$(OEXT)'
echo -e "\t"'$(LD) $? -o src/usepoints$(EEXT) $(LDFLAGS)'
echo 'usepoints: src/usepoints$(EEXT)'
echo 'points: usepoints'
echo 'echo created all targets' >/dev/stderr
echo 'install: all'
echo -e '\tmv $(RMTARGETS) bin'
echo '.PHONY: clean distclean '
echo 'clean: '
echo -e "\t"'$(RM) $(OBJ) $(RMTARGETS)'
echo 'distclean: clean'
echo -e "\t"'$(RM) bin/* Makefile* *.fit *.fits *.csv *.ssv *.tsv *.dat *.txt *.log log/*.log'
echo "generating dirs" >/dev/stderr
if ! test -d bin; then mkdir  bin; fi
if ! test -d obj; then mkdir  obj; fi
