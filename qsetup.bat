@echo off

rem Quick build setup for Visual Studio

rem cleanup
rmdir /s/q build
mkdir build

rem if sdl is so great why haven't they made SDL2?
curl -L https://github.com/libsdl-org/SDL/releases/download/release-2.32.2/SDL2-devel-2.32.2-VC.zip -o build\sdl2.zip
rem oh my god they have

curl -L https://github.com/libsdl-org/SDL_mixer/releases/download/release-2.8.1/SDL2_mixer-devel-2.8.1-VC.zip -o build\sdl2_mixer.zip

curl -L https://github.com/libsdl-org/SDL_net/releases/download/release-2.4.0/SDL2_net-devel-2.4.0-VC.zip -o build\sdl2_net.zip

mkdir build\SDL2
tar -xf build\sdl2.zip -C build\SDL2
set SDL2_DIR=build\SDL2

mkdir build\SDL2_MIXER
tar -xf build\sdl2_mixer.zip -C build\SDL2_MIXER
set SDL2_MIXER_DIR=build\SDL2_MIXER

mkdir build\SDL2_NET
tar -xf build\sdl2_net.zip -C build\SDL2_NET
del build\SDL2_NET\SDL2_net-2.4.0\cmake\sdl2_net-config.cmake
rem download a spoofed cmake
curl -L https://gist.githubusercontent.com/Safariminer/9c9144ad10916e47789e9881df190452/raw/fb49f70dce0d8da80a7b89317748805f15a6cbfa/sdl2_net-config.cmake -o "build\SDL2_NET\SDL2_net-2.4.0\cmake\sdl2_net-config.cmake"
set SDL2_NET_DIR=build\SDL2_NET

cmake -S . -B build

mkdir build\src\Debug
mkdir build\src\Release

copy build\SDL2\SDL2-2.32.2\lib\x64\SDL2.dll build\src\Debug
copy build\SDL2_MIXER\SDL2_mixer-2.8.1\lib\x64\SDL2_mixer.dll build\src\Debug
copy build\SDL2_MIXER\SDL2_mixer-2.8.1\lib\x64\optional\*.dll build\src\Debug
copy build\SDL2_NET\SDL2_net-2.4.0\lib\x64\SDL2_net.dll build\src\Debug

copy build\SDL2\SDL2-2.32.2\lib\x64\SDL2.dll build\src\Debug
copy build\SDL2_MIXER\SDL2_mixer-2.8.1\lib\x64\SDL2_mixer.dll build\src\Release
copy build\SDL2_MIXER\SDL2_mixer-2.8.1\lib\x64\optional\*.dll build\src\Release
copy build\SDL2_NET\SDL2_net-2.4.0\lib\x64\SDL2_net.dll build\src\Release


echo --------------------------------------
echo qsetup completed successfully
echo.
echo Your next step:
echo  - Visual Studio Solution: build/Crispy Doom.sln
echo  - Extract a build for release: extractbuild (Debug/Release) (path)
