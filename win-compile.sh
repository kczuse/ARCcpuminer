#!/bin/sh
mkdir -p win-x64

make distclean
LIBCURL="-lcurldll"  CFLAGS="-O3 -march=corei7-avx -pipe" ./configure --host=x86_64-w64-mingw32 --prefix=/usr/x86_64-w64-mingw32 --with-libcurl=/usr/x86_64-w64-mingw32
make -j4
strip minerd.exe
mv minerd.exe win-x64//minerd-avx.exe

make distclean
LIBCURL="-lcurldll"  CFLAGS="-O3 -march=core2 -pipe" ./configure --host=x86_64-w64-mingw32 --prefix=/usr/x86_64-w64-mingw32 --with-libcurl=/usr/x86_64-w64-mingw32
make -j4
strip minerd.exe
mv minerd.exe win-x64//minerd-ssse3.exe

make distclean
LIBCURL="-lcurldll"  CFLAGS="-O3 -msse2 -msse -pipe" ./configure --host=x86_64-w64-mingw32 --prefix=/usr/x86_64-w64-mingw32 --with-libcurl=/usr/x86_64-w64-mingw32
make -j4
strip minerd.exe
mv minerd.exe win-x64//minerd-sse2.exe

mkdir -p win-x86

make distclean
LIBCURL="-lcurldll"  CFLAGS="-O3 -march=corei7-avx -pipe" ./configure --host=mingw32 --prefix=/usr/mingw32 --with-libcurl=/usr/mingw32
make -j4
strip minerd.exe
mv minerd.exe win-x86/minerd-avx.exe

make distclean
LIBCURL="-lcurldll"  CFLAGS="-O3 -march=core2 -pipe" ./configure --host=mingw32 --prefix=/usr/mingw32 --with-libcurl=/usr/mingw32
make -j4
strip minerd.exe
mv minerd.exe win-x86/minerd-ssse3.exe

make distclean
LIBCURL="-lcurldll"  CFLAGS="-O3 -mtune=generic -msse -msse2 -pipe" ./configure --host=mingw32 --prefix=/usr/mingw32 --with-libcurl=/usr/mingw32
make -j4
strip minerd.exe
mv minerd.exe win-x86/minerd-sse2.exe
