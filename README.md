# WiringPi in Julia 

Raspberry Pi 5 support for GPIO, SPI, I2C (will also work on older models)

**NOTE:** You must run Julia as root (or fiddle with permissions), to allow direct memory acces to GPIO. 

**NOTE:** More documentation can be found at  https://github.com/WiringPi/WiringPi/

**NOTE:** Will only run on a Raspberry Pi (tested on a Raspberry Pi 5). Remember to enable SPI and I2C using "sudo raspi-config".

Install Julia by running: curl -fsSL https://install.julialang.org | sh


Run julia by typing: sudo $HOME/.juliaup/bin/julia

It's even possible to generate some simple code via Gemini (Google AI Studio). Example prompt: "Generate Julia code: Set pin 17 high on a Raspberry Pi 5 using WiringPi.jl"

Examples:
```julia

using WiringPi

# You can cut & paste simple examples in C and run it
wiringPiSetupGpio();
pinMode(17, INPUT);
pullUpDnControl(17, PUD_DOWN);

value = digitalRead(17)



```

Working with interrupts:
```julia
using WiringPi

wiringPiSetupGpio();
pinMode(17, INPUT);
pullUpDnControl(17, PUD_UP);


function myInterrupt()::Cvoid
       println("Triggered")
end

 const myInterruptC = @cfunction(myInterrupt, Cvoid, ())

wiringPiISR(17, INT_EDGE_FALLING, myInterruptC)

```

SPI
```julia
using WiringPi
using Random

wiringPiSPISetup(0, 1000000)


myData = Vector{Cuchar}(undef, 4096)
size = 4096

# Populate the data with some random info. Normally you would not overwrite the vector above.
myData = rand(UInt8, 4096)

# A copy
sentData = deepcopy(myData)

wiringPiSPIDataRW(0, myData, size)

# If you connect MOSI to MISO, the buffer will have the same data as sent. Otherwise it will be zeroes

sentData == myData

```

Full example where WiringPi is driving an e-paper display, and draws a diagram using Makie. Can also be used for displaying SVG.


[WiringPi.jl drive an e-paper display ](https://github.com/stensmo/WiringPi.jl/tree/main/docs/examples)

data acquisition examples is coming soon 

