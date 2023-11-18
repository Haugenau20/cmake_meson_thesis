# Perfomance overview
Measured time includes CMake configuration, generation and backend build time.   
Average times are calculated from 10 clean builds.
## Laptop:
CPU: Intel i7-11370H, 4 Cores 8 Threads
| Backend | avg. time [s] |
| --- | --- |
| Make | 4.498 |
| Make (Parallel) | 2.936 |
| Ninja | 3.054 |

## Work Laptop:
CPU: Intel i5-8265U, 4 Cores 8 Threads
| Backend | avg. time [s] |
| --- | --- |
| Make | 10.565 |   
| Make (Parallel) | 7.847 |
| Ninja | 5.085 |

## Dekstop:
CPU: Intel i7-10700K, 8 Cores 16 Threads
| Backend | avg. time [s] |
| --- | --- |
| Make | 3.859 |   
| Make (Parallel) | 2.418 |
| Ninja | 1.571 |

## Powershell commands:
* Make:
```powershell
del buildresults -Recurse -Force
$executionTime = Measure-Command {
& cmake -B buildresults -G "Unix Makefiles" -DCMAKE_TOOLCHAIN_FILE="cmake\toolchains\cross\STM32F103VBIx.cmake"
& cmake --build buildresults }
$executionTime.TotalMilliseconds | Out-File -FilePath .\makefile_time_output.txt -Append
```

* Make (parallel 8 jobs)
```powershell
del buildresults -Recurse -Force
$executionTime = Measure-Command {
& cmake -B buildresults -G "Unix Makefiles" -DCMAKE_TOOLCHAIN_FILE="cmake\toolchains\cross\STM32F103VBIx.cmake"
& cmake --build buildresults --parallel 8 }
$executionTime.TotalMilliseconds | Out-File -FilePath .\makefile_parallel_time_output.txt -Append
```

* Ninja
```powershell
del buildresults -Recurse -Force
$executionTime = Measure-Command {
& cmake -B buildresults -G Ninja -DCMAKE_TOOLCHAIN_FILE="cmake\toolchains\cross\STM32F103VBIx.cmake"
& cmake --build buildresults }
$executionTime.TotalMilliseconds | Out-File -FilePath .\ninja_time_output.txt -Append
```
