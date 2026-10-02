@echo off

rem Quick build setup for Visual Studio

rem cleanup
rmdir /s/q build
mkdir build

rem if sdl is so great why haven't they made SDL2?
curl -L https://github.com/libsdl-org/SDL/releases/download/release-2.32.2/SDL2-devel-2.32.2-VC.zip -o build\sdl2.zip
rem oh my god they have

mkdir build\SDL2
tar -xf build\sdl2.zip -C build\SDL2
set SDL2_DIR=build\SDL2

cmake -S . -B build -DENABLE_SDL2_NET=Off -DENABLE_SDL2_MIXER=Off

mkdir build\src\Debug
mkdir build\src\Release
copy build\SDL2\SDL2-2.32.2\lib\x64\SDL2.dll build\src\Debug
copy build\SDL2\SDL2-2.32.2\lib\x64\SDL2.dll build\src\Release


echo --------------------------------------
echo qsetup completed successfully
echo.
echo Your next step:
echo  - Visual Studio Solution: build/Crispy Doom.sln
echo  - Extract a build for release: extractbuild (Debug/Release) (path)
