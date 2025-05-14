---
# https://vitepress.dev/reference/default-theme-home-page
layout: home

hero:
  name: "WiringPi.jl"
  text: "WiringPi in Julia"
  tagline: WiringPi in Julia. Supports gpio, spi, pwm and more.
  image:
    src: /logo.png
    alt: WiringPi.jl
  actions:
    - theme: alt
      text: View on Github
      link: https://github.com/stensmo/WiringPi.jl
    - theme: alt
      text: API
      link: /api


features:
  - icon: ✅
    title: Support for all things GPIO related
    details: gpio, spi, pwm and more
    link: /api

  - icon: 🚀
    title: High performance
    details: High performance implementation
    link: /api

---


## WiringPi Installation {#WiringPi-Installation}

Install by running:

```julia
import Pkg;Pkg.add("WiringPi")
```


## SFTPClient Examples {#SFTPClient-Examples}

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

[WiringPi.jl drive an e-paper display ](https://github.com/stensmo/WiringPi.jl/tree/main/examples)
