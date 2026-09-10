1. dowland "mingw-w64" 
-------------
sudo apt update && sudo apt install mingw-w64 -y #for debian
-------------

-------------
sudo pacman -S mingw-w64-gcc # for arch
-------------
2.
-------------
nim c --os:windows --gcc.exe:x86_64-w64-mingw32-gcc --gcc.linkerexe:x86_64-w64-mingw32-gcc main.nim
-------------
its finished
