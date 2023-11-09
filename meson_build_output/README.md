# Perfomance overview
Measured time includes Meson configuration, generation and Ninja build time.   
The time is an average of 10 clean builds.
## Laptop
CPU: Intel i7-11370H, 4 Cores 8 Threads
| Backend | avg. time [s] |
| --- | --- |
| Ninja | 2.940 |
## Work Laptop
CPU: Intel i5-8265U, 4 Cores 8 Threads
| Backend | avg. time [s] |
| --- | --- |
| Ninja | 7.844 |
## Desktop
TBD

## Powershell Commands
* Ninja
```Powershell
del buildresults -Recurse -Force
$executionTime = Measure-Command {
& meson setup buildresults --cross-file build/cross/arm.txt --cross-file build/cross/STM32F103VBIx.txt
& meson compile -C buildresults }
$executionTime.TotalMilliseconds | Out-File -FilePath .\ninja_time_output.txt -Append
```

