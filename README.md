# WiringPi in Julia 

**NOTE:** You must run Julia as root (or fiddle with permissions), to allow direct memory acces to GPIO. 

**NOTE:** You must install the Library WiringPi separately  https://github.com/WiringPi/WiringPi/

**NOTE:** Will only run on a Raspberry Pi

Install Julia by running: curl -fsSL https://install.julialang.org | sh


Run julia by typing: sudo $HOME/.juliaup/bin/julia

Example:
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




