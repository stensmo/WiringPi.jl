# WiringPi in Julia 

**NOTE:** You must run Julia as root (or fiddle with permissions), to allow direct memory acces to GPIO. 

**NOTE:** You must install the Library WiringPi separately  https://github.com/WiringPi/WiringPi/

**NOTE:** Will only run on a Raspberry Pi

Install Julia by running: curl -fsSL https://install.julialang.org | sh


Run julia by typing: sudo $HOME/.juliaup/bin/julia

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


