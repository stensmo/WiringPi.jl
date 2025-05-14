module WiringPi

using WiringPi_jll
export WiringPi_jll

if WiringPi_jll.is_available()
    const libwiringPi = WiringPi_jll.wiringPi
end

to_c_type(t::Type) = t
to_c_type_pairs(va_list) = map(enumerate(to_c_type.(va_list))) do (ind, type)
    :(va_list[$ind]::$type)
end

function ads1115Setup(pinBase, i2cAddress)
    ccall((:ads1115Setup, libwiringPi), Cint, (Cint, Cint), pinBase, i2cAddress)
end

function bmp180Setup(pinBase)
    ccall((:bmp180Setup, libwiringPi), Cint, (Cint,), pinBase)
end

function drcSetupNet(pinBase, numPins, ipAddress, port, password)
    ccall((:drcSetupNet, libwiringPi), Cint, (Cint, Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}), pinBase, numPins, ipAddress, port, password)
end

function drcSetupSerial(pinBase, numPins, device, baud)
    ccall((:drcSetupSerial, libwiringPi), Cint, (Cint, Cint, Ptr{Cchar}, Cint), pinBase, numPins, device, baud)
end

function ds18b20Setup(pinBase, serialNum)
    ccall((:ds18b20Setup, libwiringPi), Cint, (Cint, Ptr{Cchar}), pinBase, serialNum)
end

function htu21dSetup(pinBase)
    ccall((:htu21dSetup, libwiringPi), Cint, (Cint,), pinBase)
end

function max31855Setup(pinBase, spiChannel)
    ccall((:max31855Setup, libwiringPi), Cint, (Cint, Cint), pinBase, spiChannel)
end

function max5322Setup(pinBase, spiChannel)
    ccall((:max5322Setup, libwiringPi), Cint, (Cint, Cint), pinBase, spiChannel)
end

function mcp23008Setup(pinBase, i2cAddress)
    ccall((:mcp23008Setup, libwiringPi), Cint, (Cint, Cint), pinBase, i2cAddress)
end

function mcp23016Setup(pinBase, i2cAddress)
    ccall((:mcp23016Setup, libwiringPi), Cint, (Cint, Cint), pinBase, i2cAddress)
end

function mcp23017Setup(pinBase, i2cAddress)
    ccall((:mcp23017Setup, libwiringPi), Cint, (Cint, Cint), pinBase, i2cAddress)
end

function mcp23s08Setup(pinBase, spiPort, devId)
    ccall((:mcp23s08Setup, libwiringPi), Cint, (Cint, Cint, Cint), pinBase, spiPort, devId)
end

function mcp23s17Setup(pinBase, spiPort, devId)
    ccall((:mcp23s17Setup, libwiringPi), Cint, (Cint, Cint, Cint), pinBase, spiPort, devId)
end

function mcp3002Setup(pinBase, spiChannel)
    ccall((:mcp3002Setup, libwiringPi), Cint, (Cint, Cint), pinBase, spiChannel)
end

function mcp3004Setup(pinBase, spiChannel)
    ccall((:mcp3004Setup, libwiringPi), Cint, (Cint, Cint), pinBase, spiChannel)
end

function mcp3422Setup(pinBase, i2cAddress, sampleRate, gain)
    ccall((:mcp3422Setup, libwiringPi), Cint, (Cint, Cint, Cint, Cint), pinBase, i2cAddress, sampleRate, gain)
end

function mcp4802Setup(pinBase, spiChannel)
    ccall((:mcp4802Setup, libwiringPi), Cint, (Cint, Cint), pinBase, spiChannel)
end

function pcf8574Setup(pinBase, i2cAddress)
    ccall((:pcf8574Setup, libwiringPi), Cint, (Cint, Cint), pinBase, i2cAddress)
end

function pcf8591Setup(pinBase, i2cAddress)
    ccall((:pcf8591Setup, libwiringPi), Cint, (Cint, Cint), pinBase, i2cAddress)
end

function pseudoPinsSetup(pinBase)
    ccall((:pseudoPinsSetup, libwiringPi), Cint, (Cint,), pinBase)
end

function rht03Setup(pinBase, devicePin)
    ccall((:rht03Setup, libwiringPi), Cint, (Cint, Cint), pinBase, devicePin)
end

function sn3218Setup(pinBase)
    ccall((:sn3218Setup, libwiringPi), Cint, (Cint,), pinBase)
end

function softPwmCreate(pin, value, range)
    ccall((:softPwmCreate, libwiringPi), Cint, (Cint, Cint, Cint), pin, value, range)
end

function softPwmWrite(pin, value)
    ccall((:softPwmWrite, libwiringPi), Cvoid, (Cint, Cint), pin, value)
end

function softPwmStop(pin)
    ccall((:softPwmStop, libwiringPi), Cvoid, (Cint,), pin)
end

function softServoWrite(pin, value)
    ccall((:softServoWrite, libwiringPi), Cvoid, (Cint, Cint), pin, value)
end

function softServoSetup(p0, p1, p2, p3, p4, p5, p6, p7)
    ccall((:softServoSetup, libwiringPi), Cint, (Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint), p0, p1, p2, p3, p4, p5, p6, p7)
end

function softToneCreate(pin)
    ccall((:softToneCreate, libwiringPi), Cint, (Cint,), pin)
end

function softToneStop(pin)
    ccall((:softToneStop, libwiringPi), Cvoid, (Cint,), pin)
end

function softToneWrite(pin, freq)
    ccall((:softToneWrite, libwiringPi), Cvoid, (Cint, Cint), pin, freq)
end

function sr595Setup(pinBase, numPins, dataPin, clockPin, latchPin)
    ccall((:sr595Setup, libwiringPi), Cint, (Cint, Cint, Cint, Cint, Cint), pinBase, numPins, dataPin, clockPin, latchPin)
end

struct wiringPiNodeStruct
    pinBase::Cint
    pinMax::Cint
    fd::Cint
    data0::Cuint
    data1::Cuint
    data2::Cuint
    data3::Cuint
    pinMode::Ptr{Cvoid}
    pullUpDnControl::Ptr{Cvoid}
    digitalRead::Ptr{Cvoid}
    digitalWrite::Ptr{Cvoid}
    pwmWrite::Ptr{Cvoid}
    analogRead::Ptr{Cvoid}
    analogWrite::Ptr{Cvoid}
    next::Ptr{wiringPiNodeStruct}
end

function piGpioLayoutOops(why)
    ccall((:piGpioLayoutOops, libwiringPi), Cvoid, (Ptr{Cchar},), why)
end

# automatic type deduction for variadic arguments may not be what you want, please use with caution
@generated function wiringPiFailure(fatal, message, va_list...)
        :(@ccall(libwiringPi.wiringPiFailure(fatal::Cint, message::Ptr{Cchar}; $(to_c_type_pairs(va_list)...))::Cint))
    end

function wiringPiFindNode(pin)
    ccall((:wiringPiFindNode, libwiringPi), Ptr{wiringPiNodeStruct}, (Cint,), pin)
end

function wiringPiNewNode(pinBase, numPins)
    ccall((:wiringPiNewNode, libwiringPi), Ptr{wiringPiNodeStruct}, (Cint, Cint), pinBase, numPins)
end

@enum WPIPinType::UInt32 begin
    WPI_PIN_BCM = 1
    WPI_PIN_WPI = 2
    WPI_PIN_PHYS = 3
end

function wiringPiVersion(major, minor)
    ccall((:wiringPiVersion, libwiringPi), Cvoid, (Ptr{Cint}, Ptr{Cint}), major, minor)
end

function wiringPiGlobalMemoryAccess()
    ccall((:wiringPiGlobalMemoryAccess, libwiringPi), Cint, ())
end

function wiringPiUserLevelAccess()
    ccall((:wiringPiUserLevelAccess, libwiringPi), Cint, ())
end

function wiringPiSetup()
    ccall((:wiringPiSetup, libwiringPi), Cint, ())
end

function wiringPiSetupSys()
    ccall((:wiringPiSetupSys, libwiringPi), Cint, ())
end

function wiringPiSetupGpio()
    ccall((:wiringPiSetupGpio, libwiringPi), Cint, ())
end

function wiringPiSetupPhys()
    ccall((:wiringPiSetupPhys, libwiringPi), Cint, ())
end

function wiringPiSetupPinType(pinType)
    ccall((:wiringPiSetupPinType, libwiringPi), Cint, (WPIPinType,), pinType)
end

function wiringPiSetupGpioDevice(pinType)
    ccall((:wiringPiSetupGpioDevice, libwiringPi), Cint, (WPIPinType,), pinType)
end

@enum WPIPinAlt::Int32 begin
    WPI_ALT_UNKNOWN = -1
    WPI_ALT_INPUT = 0
    WPI_ALT_OUTPUT = 1
    WPI_ALT5 = 2
    WPI_ALT4 = 3
    WPI_ALT0 = 4
    WPI_ALT1 = 5
    WPI_ALT2 = 6
    WPI_ALT3 = 7
    WPI_ALT6 = 8
    WPI_ALT7 = 9
    WPI_ALT8 = 10
    WPI_ALT9 = 11
    WPI_NONE = 31
end

# no prototype is found for this function at wiringPi.h:257:22, please use with caution
function wiringPiGpioDeviceGetFd()
    ccall((:wiringPiGpioDeviceGetFd, libwiringPi), Cint, ())
end

function pinModeAlt(pin, mode)
    ccall((:pinModeAlt, libwiringPi), Cvoid, (Cint, Cint), pin, mode)
end

function getPinModeAlt(pin)
    ccall((:getPinModeAlt, libwiringPi), WPIPinAlt, (Cint,), pin)
end

function pinMode(pin, mode)
    ccall((:pinMode, libwiringPi), Cvoid, (Cint, Cint), pin, mode)
end

function pullUpDnControl(pin, pud)
    ccall((:pullUpDnControl, libwiringPi), Cvoid, (Cint, Cint), pin, pud)
end

function digitalRead(pin)
    ccall((:digitalRead, libwiringPi), Cint, (Cint,), pin)
end

function digitalWrite(pin, value)
    ccall((:digitalWrite, libwiringPi), Cvoid, (Cint, Cint), pin, value)
end

function digitalRead8(pin)
    ccall((:digitalRead8, libwiringPi), Cuint, (Cint,), pin)
end

function digitalWrite8(pin, value)
    ccall((:digitalWrite8, libwiringPi), Cvoid, (Cint, Cint), pin, value)
end

function pwmWrite(pin, value)
    ccall((:pwmWrite, libwiringPi), Cvoid, (Cint, Cint), pin, value)
end

function analogRead(pin)
    ccall((:analogRead, libwiringPi), Cint, (Cint,), pin)
end

function analogWrite(pin, value)
    ccall((:analogWrite, libwiringPi), Cvoid, (Cint, Cint), pin, value)
end

function wiringPiSetupPiFace()
    ccall((:wiringPiSetupPiFace, libwiringPi), Cint, ())
end

function wiringPiSetupPiFaceForGpioProg()
    ccall((:wiringPiSetupPiFaceForGpioProg, libwiringPi), Cint, ())
end

function piGpioLayout()
    ccall((:piGpioLayout, libwiringPi), Cint, ())
end

function piBoardRev()
    ccall((:piBoardRev, libwiringPi), Cint, ())
end

function piBoardId(model, rev, mem, maker, overVolted)
    ccall((:piBoardId, libwiringPi), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), model, rev, mem, maker, overVolted)
end

function piBoard40Pin()
    ccall((:piBoard40Pin, libwiringPi), Cint, ())
end

function piRP1Model()
    ccall((:piRP1Model, libwiringPi), Cint, ())
end

function wpiPinToGpio(wpiPin)
    ccall((:wpiPinToGpio, libwiringPi), Cint, (Cint,), wpiPin)
end

function physPinToGpio(physPin)
    ccall((:physPinToGpio, libwiringPi), Cint, (Cint,), physPin)
end

function setPadDrive(group, value)
    ccall((:setPadDrive, libwiringPi), Cvoid, (Cint, Cint), group, value)
end

function setPadDrivePin(pin, value)
    ccall((:setPadDrivePin, libwiringPi), Cvoid, (Cint, Cint), pin, value)
end

function getAlt(pin)
    ccall((:getAlt, libwiringPi), Cint, (Cint,), pin)
end

function pwmToneWrite(pin, freq)
    ccall((:pwmToneWrite, libwiringPi), Cvoid, (Cint, Cint), pin, freq)
end

function pwmSetMode(mode)
    ccall((:pwmSetMode, libwiringPi), Cvoid, (Cint,), mode)
end

function pwmSetRange(range)
    ccall((:pwmSetRange, libwiringPi), Cvoid, (Cuint,), range)
end

function pwmSetClock(divisor)
    ccall((:pwmSetClock, libwiringPi), Cvoid, (Cint,), divisor)
end

function gpioClockSet(pin, freq)
    ccall((:gpioClockSet, libwiringPi), Cvoid, (Cint, Cint), pin, freq)
end

function digitalReadByte()
    ccall((:digitalReadByte, libwiringPi), Cuint, ())
end

function digitalReadByte2()
    ccall((:digitalReadByte2, libwiringPi), Cuint, ())
end

function digitalWriteByte(value)
    ccall((:digitalWriteByte, libwiringPi), Cvoid, (Cint,), value)
end

function digitalWriteByte2(value)
    ccall((:digitalWriteByte2, libwiringPi), Cvoid, (Cint,), value)
end

function waitForInterrupt(pin, mS)
    ccall((:waitForInterrupt, libwiringPi), Cint, (Cint, Cint), pin, mS)
end

function wiringPiISR(pin, mode, _function)
    ccall((:wiringPiISR, libwiringPi), Cint, (Cint, Cint, Ptr{Cvoid}), pin, mode, _function)
end

function wiringPiISRStop(pin)
    ccall((:wiringPiISRStop, libwiringPi), Cint, (Cint,), pin)
end

function waitForInterruptClose(pin)
    ccall((:waitForInterruptClose, libwiringPi), Cint, (Cint,), pin)
end

function piThreadCreate(fn)
    ccall((:piThreadCreate, libwiringPi), Cint, (Ptr{Cvoid},), fn)
end

function piLock(key)
    ccall((:piLock, libwiringPi), Cvoid, (Cint,), key)
end

function piUnlock(key)
    ccall((:piUnlock, libwiringPi), Cvoid, (Cint,), key)
end

function piHiPri(pri)
    ccall((:piHiPri, libwiringPi), Cint, (Cint,), pri)
end

function delay(howLong)
    ccall((:delay, libwiringPi), Cvoid, (Cuint,), howLong)
end

function delayMicroseconds(howLong)
    ccall((:delayMicroseconds, libwiringPi), Cvoid, (Cuint,), howLong)
end

function millis()
    ccall((:millis, libwiringPi), Cuint, ())
end

function micros()
    ccall((:micros, libwiringPi), Cuint, ())
end

function piMicros64()
    ccall((:piMicros64, libwiringPi), Culonglong, ())
end

function wiringPiI2CRead(fd)
    ccall((:wiringPiI2CRead, libwiringPi), Cint, (Cint,), fd)
end

function wiringPiI2CReadReg8(fd, reg)
    ccall((:wiringPiI2CReadReg8, libwiringPi), Cint, (Cint, Cint), fd, reg)
end

function wiringPiI2CReadReg16(fd, reg)
    ccall((:wiringPiI2CReadReg16, libwiringPi), Cint, (Cint, Cint), fd, reg)
end

function wiringPiI2CReadBlockData(fd, reg, values, size)
    ccall((:wiringPiI2CReadBlockData, libwiringPi), Cint, (Cint, Cint, Ptr{UInt8}, UInt8), fd, reg, values, size)
end

function wiringPiI2CRawRead(fd, values, size)
    ccall((:wiringPiI2CRawRead, libwiringPi), Cint, (Cint, Ptr{UInt8}, UInt8), fd, values, size)
end

function wiringPiI2CWrite(fd, data)
    ccall((:wiringPiI2CWrite, libwiringPi), Cint, (Cint, Cint), fd, data)
end

function wiringPiI2CWriteReg8(fd, reg, data)
    ccall((:wiringPiI2CWriteReg8, libwiringPi), Cint, (Cint, Cint, Cint), fd, reg, data)
end

function wiringPiI2CWriteReg16(fd, reg, data)
    ccall((:wiringPiI2CWriteReg16, libwiringPi), Cint, (Cint, Cint, Cint), fd, reg, data)
end

function wiringPiI2CWriteBlockData(fd, reg, values, size)
    ccall((:wiringPiI2CWriteBlockData, libwiringPi), Cint, (Cint, Cint, Ptr{UInt8}, UInt8), fd, reg, values, size)
end

function wiringPiI2CRawWrite(fd, values, size)
    ccall((:wiringPiI2CRawWrite, libwiringPi), Cint, (Cint, Ptr{UInt8}, UInt8), fd, values, size)
end

function wiringPiI2CSetupInterface(device, devId)
    ccall((:wiringPiI2CSetupInterface, libwiringPi), Cint, (Ptr{Cchar}, Cint), device, devId)
end

function wiringPiI2CSetup(devId)
    ccall((:wiringPiI2CSetup, libwiringPi), Cint, (Cint,), devId)
end

function GetPiRevisionLegacy(line, linelength, revision)
    ccall((:GetPiRevisionLegacy, libwiringPi), Ptr{Cchar}, (Ptr{Cchar}, Cint, Ptr{Cuint}), line, linelength, revision)
end

function wiringPiSPIGetFd(channel)
    ccall((:wiringPiSPIGetFd, libwiringPi), Cint, (Cint,), channel)
end

function wiringPiSPIDataRW(channel, data, len)
    ccall((:wiringPiSPIDataRW, libwiringPi), Cint, (Cint, Ptr{Cuchar}, Cint), channel, data, len)
end

function wiringPiSPISetupMode(channel, speed, mode)
    ccall((:wiringPiSPISetupMode, libwiringPi), Cint, (Cint, Cint, Cint), channel, speed, mode)
end

function wiringPiSPISetup(channel, speed)
    ccall((:wiringPiSPISetup, libwiringPi), Cint, (Cint, Cint), channel, speed)
end

function wiringPiSPIClose(channel)
    ccall((:wiringPiSPIClose, libwiringPi), Cint, (Cint,), channel)
end

function wiringPiSPIxGetFd(number, channel)
    ccall((:wiringPiSPIxGetFd, libwiringPi), Cint, (Cint, Cint), number, channel)
end

function wiringPiSPIxDataRW(number, channel, data, len)
    ccall((:wiringPiSPIxDataRW, libwiringPi), Cint, (Cint, Cint, Ptr{Cuchar}, Cint), number, channel, data, len)
end

function wiringPiSPIxSetupMode(number, channel, speed, mode)
    ccall((:wiringPiSPIxSetupMode, libwiringPi), Cint, (Cint, Cint, Cint, Cint), number, channel, speed, mode)
end

function wiringPiSPIxSetup(number, channel, speed)
    ccall((:wiringPiSPIxSetup, libwiringPi), Cint, (Cint, Cint, Cint), number, channel, speed)
end

function wiringPiSPIxClose(number, channel)
    ccall((:wiringPiSPIxClose, libwiringPi), Cint, (Cint, Cint), number, channel)
end

function serialOpen(device, baud)
    ccall((:serialOpen, libwiringPi), Cint, (Ptr{Cchar}, Cint), device, baud)
end

function serialClose(fd)
    ccall((:serialClose, libwiringPi), Cvoid, (Cint,), fd)
end

function serialFlush(fd)
    ccall((:serialFlush, libwiringPi), Cvoid, (Cint,), fd)
end

function serialPutchar(fd, c)
    ccall((:serialPutchar, libwiringPi), Cvoid, (Cint, Cuchar), fd, c)
end

function serialPuts(fd, s)
    ccall((:serialPuts, libwiringPi), Cvoid, (Cint, Ptr{Cchar}), fd, s)
end

# automatic type deduction for variadic arguments may not be what you want, please use with caution
@generated function serialPrintf(fd, message, va_list...)
        :(@ccall(libwiringPi.serialPrintf(fd::Cint, message::Ptr{Cchar}; $(to_c_type_pairs(va_list)...))::Cvoid))
    end

function serialDataAvail(fd)
    ccall((:serialDataAvail, libwiringPi), Cint, (Cint,), fd)
end

function serialGetchar(fd)
    ccall((:serialGetchar, libwiringPi), Cint, (Cint,), fd)
end

function shiftIn(dPin, cPin, order)
    ccall((:shiftIn, libwiringPi), UInt8, (UInt8, UInt8, UInt8), dPin, cPin, order)
end

function shiftOut(dPin, cPin, order, val)
    ccall((:shiftOut, libwiringPi), Cvoid, (UInt8, UInt8, UInt8, UInt8), dPin, cPin, order, val)
end

function loadWPiExtension(progName, extensionData, verbose)
    ccall((:loadWPiExtension, libwiringPi), Cint, (Ptr{Cchar}, Ptr{Cchar}, Cint), progName, extensionData, verbose)
end

const ADS1115_GAIN_6 = 0

const ADS1115_GAIN_4 = 1

const ADS1115_GAIN_2 = 2

const ADS1115_GAIN_1 = 3

const ADS1115_GAIN_HALF = 4

const ADS1115_GAIN_QUARTER = 5

const ADS1115_DR_8 = 0

const ADS1115_DR_16 = 1

const ADS1115_DR_32 = 2

const ADS1115_DR_64 = 3

const ADS1115_DR_128 = 4

const ADS1115_DR_250 = 5

const ADS1115_DR_475 = 6

const ADS1115_DR_860 = 7

const MCP23016_GP0 = 0x00

const MCP23016_GP1 = 0x01

const MCP23016_OLAT0 = 0x02

const MCP23016_OLAT1 = 0x03

const MCP23016_IPOL0 = 0x04

const MCP23016_IPOL1 = 0x05

const MCP23016_IODIR0 = 0x06

const MCP23016_IODIR1 = 0x07

const MCP23016_INTCAP0 = 0x08

const MCP23016_INTCAP1 = 0x09

const MCP23016_IOCON0 = 0x0a

const MCP23016_IOCON1 = 0x0b

const IOCON_IARES = 0x01

const IOCON_INIT = 0

const IODIRA = 0x00

const IPOLA = 0x02

const GPINTENA = 0x04

const DEFVALA = 0x06

const INTCONA = 0x08

const IOCON = 0x0a

const GPPUA = 0x0c

const INTFA = 0x0e

const INTCAPA = 0x10

const GPIOA = 0x12

const OLATA = 0x14

const IODIRB = 0x01

const IPOLB = 0x03

const GPINTENB = 0x05

const DEFVALB = 0x07

const INTCONB = 0x09

const IOCONB = 0x0b

const GPPUB = 0x0d

const INTFB = 0x0f

const INTCAPB = 0x11

const GPIOB = 0x13

const OLATB = 0x15

const IOCON_UNUSED = 0x01

const IOCON_INTPOL = 0x02

const IOCON_ODR = 0x04

const IOCON_HAEN = 0x08

const IOCON_DISSLW = 0x10

const IOCON_SEQOP = 0x20

const IOCON_MIRROR = 0x40

const IOCON_BANK_MODE = 0x80

const CMD_WRITE = 0x40

const CMD_READ = 0x41

const MCP23x08_IODIR = 0x00

const MCP23x08_IPOL = 0x01

const MCP23x08_GPINTEN = 0x02

const MCP23x08_DEFVAL = 0x03

const MCP23x08_INTCON = 0x04

const MCP23x08_IOCON = 0x05

const MCP23x08_GPPU = 0x06

const MCP23x08_INTF = 0x07

const MCP23x08_INTCAP = 0x08

const MCP23x08_GPIO = 0x09

const MCP23x08_OLAT = 0x0a

const MCP23x17_IODIRA = 0x00

const MCP23x17_IPOLA = 0x02

const MCP23x17_GPINTENA = 0x04

const MCP23x17_DEFVALA = 0x06

const MCP23x17_INTCONA = 0x08

const MCP23x17_IOCON = 0x0a

const MCP23x17_GPPUA = 0x0c

const MCP23x17_INTFA = 0x0e

const MCP23x17_INTCAPA = 0x10

const MCP23x17_GPIOA = 0x12

const MCP23x17_OLATA = 0x14

const MCP23x17_IODIRB = 0x01

const MCP23x17_IPOLB = 0x03

const MCP23x17_GPINTENB = 0x05

const MCP23x17_DEFVALB = 0x07

const MCP23x17_INTCONB = 0x09

const MCP23x17_IOCONB = 0x0b

const MCP23x17_GPPUB = 0x0d

const MCP23x17_INTFB = 0x0f

const MCP23x17_INTCAPB = 0x11

const MCP23x17_GPIOB = 0x13

const MCP23x17_OLATB = 0x15

const MCP3422_SR_240 = 0

const MCP3422_SR_60 = 1

const MCP3422_SR_15 = 2

const MCP3422_SR_3_75 = 3

const MCP3422_GAIN_1 = 0

const MCP3422_GAIN_2 = 1

const MCP3422_GAIN_4 = 2

const MCP3422_GAIN_8 = 3

const TRUE = 1 == 1

const FALSE = !TRUE

# Skipping MacroDefinition: UNU __attribute__ ( ( unused ) )

const PI_GPIO_MASK = 0xffffffc0

const WPI_MODE_PINS = 0

const WPI_MODE_GPIO = 1

const WPI_MODE_GPIO_SYS = 2

const WPI_MODE_PHYS = 3

const WPI_MODE_PIFACE = 4

const WPI_MODE_GPIO_DEVICE_BCM = 5

const WPI_MODE_GPIO_DEVICE_WPI = 6

const WPI_MODE_GPIO_DEVICE_PHYS = 7

const WPI_MODE_UNINITIALISED = -1

const INPUT = 0

const OUTPUT = 1

const PWM_OUTPUT = 2

const PWM_MS_OUTPUT = 8

const PWM_BAL_OUTPUT = 9

const GPIO_CLOCK = 3

const SOFT_PWM_OUTPUT = 4

const SOFT_TONE_OUTPUT = 5

const PWM_TONE_OUTPUT = 6

const PM_OFF = 7

const LOW = 0

const HIGH = 1

const PUD_OFF = 0

const PUD_DOWN = 1

const PUD_UP = 2

const PWM_MODE_MS = 0

const PWM_MODE_BAL = 1

const INT_EDGE_SETUP = 0

const INT_EDGE_FALLING = 1

const INT_EDGE_RISING = 2

const INT_EDGE_BOTH = 3

const PI_MODEL_A = 0

const PI_MODEL_B = 1

const PI_MODEL_AP = 2

const PI_MODEL_BP = 3

const PI_MODEL_2 = 4

const PI_ALPHA = 5

const PI_MODEL_CM = 6

const PI_MODEL_3B = 8

const PI_MODEL_ZERO = 9

const PI_MODEL_CM3 = 10

const PI_MODEL_ZERO_W = 12

const PI_MODEL_3BP = 13

const PI_MODEL_3AP = 14

const PI_MODEL_CM3P = 16

const PI_MODEL_4B = 17

const PI_MODEL_ZERO_2W = 18

const PI_MODEL_400 = 19

const PI_MODEL_CM4 = 20

const PI_MODEL_CM4S = 21

const PI_MODEL_5 = 23

const PI_MODEL_CM5 = 24

const PI_MODEL_500 = 25

const PI_MODEL_CM5L = 26

const PI_MODELS_MAX = 27

const PI_VERSION_1 = 0

const PI_VERSION_1_1 = 1

const PI_VERSION_1_2 = 2

const PI_VERSION_2 = 3

const PI_MAKER_SONY = 0

const PI_MAKER_EGOMAN = 1

const PI_MAKER_EMBEST = 2

const PI_MAKER_UNKNOWN = 3

const GPIO_LAYOUT_PI1_REV1 = 1

const GPIO_LAYOUT_DEFAULT = 2

const WPI_FATAL = 1 == 1

const WPI_ALMOST = 1 == 2

const LSBFIRST = 0

const MSBFIRST = 1

excludes =  [Symbol(:eval), Symbol(:include), Symbol("#eval"), Symbol("#include")]
# exports
for name in names(@__MODULE__; all=true)
    if name ∉ excludes     
        @eval export $name
    end
end

end # module
