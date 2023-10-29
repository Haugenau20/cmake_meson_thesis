# cmake_meson_thesis
This repository contains a project that can be built using both CMake and Meson build systems. Additionally, it includes the terminal outputs and .hex files from three different machines.

## Project Overview
The project is organized into the following directories:

cmake: Contains the project source code and configuration files for building with CMake.  
meson: Contains the project source code and configuration files for building with Meson.  
cmake_build_output: Terminal output and .hex file generated when project was built with CMake on different machines.   
meson_build_output: Terminal output and .hex file generated when project was built with Meson on different machines.  

## Dependencies
Dependencies and versions used to create the output files.
| Dependency | Version | choco install |
| --- | --- | --- |
| CMake                  | 3.27.7 | cmake |
| Meson | 1.2.3 | meson | 
| Ninja                  | 1.11.1 | ninja |
| GNU embedded toolchain | 10.3.1 | gcc-arm-embedded | 
| mingw | 13.1.0 | mingw | 
| Python | 3.12.0 | python |

## Building with CMake
To build the project with CMake, follow these steps.
1. Open powershell and navigate to the 'cmake' directory
2. Run the following commands
```powershell
cmake -B buildresults -G Ninja -DCMAKE_TOOLCHAIN_FILE="cmake\toolchains\cross\STM32F103VBIx.cmake"
```
```powershell
ninja -C buildresults
```
3. All built files are located in the 'buildresults' directory

## Building with Meson
To build the project with Meson, follow these steps.
1. Open powershell and navigate to the 'meson' directory
2. Run the following commands
```powershell
meson setup buildresults --cross-file build/cross/arm.txt --cross-file build/cross/STM32F103VBIx.txt
```
```powershell
meson compile -C buildresults
```
