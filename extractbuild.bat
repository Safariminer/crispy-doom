@echo off
mkdir %2
copy build\src\%1\*.exe "%2"
copy build\SDL2\SDL2-2.32.2\lib\x64\SDL2.dll "%2"