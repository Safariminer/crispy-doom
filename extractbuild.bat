@echo off
mkdir %2
copy build\src\%1\*.exe "%2"
copy build\src\%1\*.dll "%2"