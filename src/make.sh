#!/bin/bash
rm -rf build
mkdir build
cd build

GODST=""
if [ "$GOROOT" != "" ]
then
       	GODST=$GOROOT
else
	echo "you must set  GOROOT"
	exit 1
fi

CC=g++
CXXFLAGS="-Wall -g"
LDFLAGS="-Wall -g"

cp ../c++/thostmduserapi.so ../c++/thosttraderapi.so /usr/lib/

#create share libarary
cp ../ctp.swig ./
swig -go -c++ -intgosize 64 -soname libctp.so ./ctp.swig
$CC $CXXFLAGS -I../c++/ -I../helper/ -fpic -c ctp_wrap.cxx -o ctp_wrap.o
$CC $CXXFLAGS -I../helper/ -fpic -c ../helper/helper.cpp -o helper.o
$CC $LDFLAGS -shared -o libctp.so ctp_wrap.o helper.o /usr/lib/thostmduserapi.so /usr/lib/thosttraderapi.so
cp ./libctp.so /usr/lib/


#create go stub
go tool 6c -I "$GODST/pkg/linux_amd64" -D _64BIT ctp_gc.c
go tool 6g ctp.go
go tool pack grc ctp.a ctp.6 ctp_gc.6
cp ctp.a $GODST/pkg/linux_amd64/ctp.a
mkdir $GODST/src/pkg/ctp
cp ctp.go $GODST/src/pkg/ctp/


