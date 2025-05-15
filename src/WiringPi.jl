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

"""
    ads1115Setup(pinBase, i2cAddress)

$(_doc_external(:ads1115Setup))
"""
function ads1115Setup(pinBase, i2cAddress)
    ccall((:ads1115Setup, libwiringPi), Cint, (Cint, Cint), pinBase, i2cAddress)
end

"""
    bmp180Setup(pinBase)

$(_doc_external(:bmp180Setup))
"""
function bmp180Setup(pinBase)
    ccall((:bmp180Setup, libwiringPi), Cint, (Cint,), pinBase)
end

"""
    drcSetupNet(pinBase, numPins, ipAddress, port, password)

$(_doc_external(:drcSetupNet))
"""
function drcSetupNet(pinBase, numPins, ipAddress, port, password)
    ccall((:drcSetupNet, libwiringPi), Cint, (Cint, Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}), pinBase, numPins, ipAddress, port, password)
end

"""
    drcSetupSerial(pinBase, numPins, device, baud)

$(_doc_external(:drcSetupSerial))
"""
function drcSetupSerial(pinBase, numPins, device, baud)
    ccall((:drcSetupSerial, libwiringPi), Cint, (Cint, Cint, Ptr{Cchar}, Cint), pinBase, numPins, device, baud)
end

"""
    ds18b20Setup(pinBase, serialNum)

$(_doc_external(:ds18b20Setup))
"""
function ds18b20Setup(pinBase, serialNum)
    ccall((:ds18b20Setup, libwiringPi), Cint, (Cint, Ptr{Cchar}), pinBase, serialNum)
end

"""
    htu21dSetup(pinBase)

$(_doc_external(:htu21dSetup))
"""
function htu21dSetup(pinBase)
    ccall((:htu21dSetup, libwiringPi), Cint, (Cint,), pinBase)
end

"""
    max31855Setup(pinBase, spiChannel)

$(_doc_external(:max31855Setup))
"""
function max31855Setup(pinBase, spiChannel)
    ccall((:max31855Setup, libwiringPi), Cint, (Cint, Cint), pinBase, spiChannel)
end

"""
    max5322Setup(pinBase, spiChannel)

$(_doc_external(:max5322Setup))
"""
function max5322Setup(pinBase, spiChannel)
    ccall((:max5322Setup, libwiringPi), Cint, (Cint, Cint), pinBase, spiChannel)
end

"""
    mcp23008Setup(pinBase, i2cAddress)

$(_doc_external(:mcp23008Setup))
"""
function mcp23008Setup(pinBase, i2cAddress)
    ccall((:mcp23008Setup, libwiringPi), Cint, (Cint, Cint), pinBase, i2cAddress)
end

"""
    mcp23016Setup(pinBase, i2cAddress)

$(_doc_external(:mcp23016Setup))
"""
function mcp23016Setup(pinBase, i2cAddress)
    ccall((:mcp23016Setup, libwiringPi), Cint, (Cint, Cint), pinBase, i2cAddress)
end

"""
    mcp23017Setup(pinBase, i2cAddress)

$(_doc_external(:mcp23017Setup))
"""
function mcp23017Setup(pinBase, i2cAddress)
    ccall((:mcp23017Setup, libwiringPi), Cint, (Cint, Cint), pinBase, i2cAddress)
end

"""
    mcp23s08Setup(pinBase, spiPort, devId)

$(_doc_external(:mcp23s08Setup))
"""
function mcp23s08Setup(pinBase, spiPort, devId)
    ccall((:mcp23s08Setup, libwiringPi), Cint, (Cint, Cint, Cint), pinBase, spiPort, devId)
end

"""
    mcp23s17Setup(pinBase, spiPort, devId)

$(_doc_external(:mcp23s17Setup))
"""
function mcp23s17Setup(pinBase, spiPort, devId)
    ccall((:mcp23s17Setup, libwiringPi), Cint, (Cint, Cint, Cint), pinBase, spiPort, devId)
end

"""
    mcp3002Setup(pinBase, spiChannel)

$(_doc_external(:mcp3002Setup))
"""
function mcp3002Setup(pinBase, spiChannel)
    ccall((:mcp3002Setup, libwiringPi), Cint, (Cint, Cint), pinBase, spiChannel)
end

"""
    mcp3004Setup(pinBase, spiChannel)

$(_doc_external(:mcp3004Setup))
"""
function mcp3004Setup(pinBase, spiChannel)
    ccall((:mcp3004Setup, libwiringPi), Cint, (Cint, Cint), pinBase, spiChannel)
end

"""
    mcp3422Setup(pinBase, i2cAddress, sampleRate, gain)

$(_doc_external(:mcp3422Setup))
"""
function mcp3422Setup(pinBase, i2cAddress, sampleRate, gain)
    ccall((:mcp3422Setup, libwiringPi), Cint, (Cint, Cint, Cint, Cint), pinBase, i2cAddress, sampleRate, gain)
end

"""
    mcp4802Setup(pinBase, spiChannel)

$(_doc_external(:mcp4802Setup))
"""
function mcp4802Setup(pinBase, spiChannel)
    ccall((:mcp4802Setup, libwiringPi), Cint, (Cint, Cint), pinBase, spiChannel)
end

"""
    pcf8574Setup(pinBase, i2cAddress)

$(_doc_external(:pcf8574Setup))
"""
function pcf8574Setup(pinBase, i2cAddress)
    ccall((:pcf8574Setup, libwiringPi), Cint, (Cint, Cint), pinBase, i2cAddress)
end

"""
    pcf8591Setup(pinBase, i2cAddress)

$(_doc_external(:pcf8591Setup))
"""
function pcf8591Setup(pinBase, i2cAddress)
    ccall((:pcf8591Setup, libwiringPi), Cint, (Cint, Cint), pinBase, i2cAddress)
end

"""
    pseudoPinsSetup(pinBase)

$(_doc_external(:pseudoPinsSetup))
"""
function pseudoPinsSetup(pinBase)
    ccall((:pseudoPinsSetup, libwiringPi), Cint, (Cint,), pinBase)
end

"""
    rht03Setup(pinBase, devicePin)

$(_doc_external(:rht03Setup))
"""
function rht03Setup(pinBase, devicePin)
    ccall((:rht03Setup, libwiringPi), Cint, (Cint, Cint), pinBase, devicePin)
end

"""
    sn3218Setup(pinBase)

$(_doc_external(:sn3218Setup))
"""
function sn3218Setup(pinBase)
    ccall((:sn3218Setup, libwiringPi), Cint, (Cint,), pinBase)
end

"""
    softPwmCreate(pin, value, range)

$(_doc_external(:softPwmCreate))
"""
function softPwmCreate(pin, value, range)
    ccall((:softPwmCreate, libwiringPi), Cint, (Cint, Cint, Cint), pin, value, range)
end

"""
    softPwmWrite(pin, value)

$(_doc_external(:softPwmWrite))
"""
function softPwmWrite(pin, value)
    ccall((:softPwmWrite, libwiringPi), Cvoid, (Cint, Cint), pin, value)
end

"""
    softPwmStop(pin)

$(_doc_external(:softPwmStop))
"""
function softPwmStop(pin)
    ccall((:softPwmStop, libwiringPi), Cvoid, (Cint,), pin)
end

"""
    softServoWrite(pin, value)

$(_doc_external(:softServoWrite))
"""
function softServoWrite(pin, value)
    ccall((:softServoWrite, libwiringPi), Cvoid, (Cint, Cint), pin, value)
end

"""
    softServoSetup(p0, p1, p2, p3, p4, p5, p6, p7)

$(_doc_external(:softServoSetup))
"""
function softServoSetup(p0, p1, p2, p3, p4, p5, p6, p7)
    ccall((:softServoSetup, libwiringPi), Cint, (Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint), p0, p1, p2, p3, p4, p5, p6, p7)
end

"""
    softToneCreate(pin)

$(_doc_external(:softToneCreate))
"""
function softToneCreate(pin)
    ccall((:softToneCreate, libwiringPi), Cint, (Cint,), pin)
end

"""
    softToneStop(pin)

$(_doc_external(:softToneStop))
"""
function softToneStop(pin)
    ccall((:softToneStop, libwiringPi), Cvoid, (Cint,), pin)
end

"""
    softToneWrite(pin, freq)

$(_doc_external(:softToneWrite))
"""
function softToneWrite(pin, freq)
    ccall((:softToneWrite, libwiringPi), Cvoid, (Cint, Cint), pin, freq)
end

"""
    sr595Setup(pinBase, numPins, dataPin, clockPin, latchPin)

$(_doc_external(:sr595Setup))
"""
function sr595Setup(pinBase, numPins, dataPin, clockPin, latchPin)
    ccall((:sr595Setup, libwiringPi), Cint, (Cint, Cint, Cint, Cint, Cint), pinBase, numPins, dataPin, clockPin, latchPin)
end

"""
    wiringPiNodeStruct

$(_doc_external(:wiringPiNodeStruct))
"""
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

"""
    piGpioLayoutOops(why)

$(_doc_external(:piGpioLayoutOops))
"""
function piGpioLayoutOops(why)
    ccall((:piGpioLayoutOops, libwiringPi), Cvoid, (Ptr{Cchar},), why)
end

# automatic type deduction for variadic arguments may not be what you want, please use with caution
@generated function wiringPiFailure(fatal, message, va_list...)
        :(@ccall(libwiringPi.wiringPiFailure(fatal::Cint, message::Ptr{Cchar}; $(to_c_type_pairs(va_list)...))::Cint))
    end

"""
    wiringPiFindNode(pin)

$(_doc_external(:wiringPiFindNode))
"""
function wiringPiFindNode(pin)
    ccall((:wiringPiFindNode, libwiringPi), Ptr{wiringPiNodeStruct}, (Cint,), pin)
end

"""
    wiringPiNewNode(pinBase, numPins)

$(_doc_external(:wiringPiNewNode))
"""
function wiringPiNewNode(pinBase, numPins)
    ccall((:wiringPiNewNode, libwiringPi), Ptr{wiringPiNodeStruct}, (Cint, Cint), pinBase, numPins)
end

"""
    WPIPinType

$(_doc_external(:WPIPinType))
"""
@enum WPIPinType::UInt32 begin
    WPI_PIN_BCM = 1
    WPI_PIN_WPI = 2
    WPI_PIN_PHYS = 3
end

"""
    wiringPiVersion(major, minor)

$(_doc_external(:wiringPiVersion))
"""
function wiringPiVersion(major, minor)
    ccall((:wiringPiVersion, libwiringPi), Cvoid, (Ptr{Cint}, Ptr{Cint}), major, minor)
end

"""
    wiringPiGlobalMemoryAccess()

$(_doc_external(:wiringPiGlobalMemoryAccess))
"""
function wiringPiGlobalMemoryAccess()
    ccall((:wiringPiGlobalMemoryAccess, libwiringPi), Cint, ())
end

"""
    wiringPiUserLevelAccess()

$(_doc_external(:wiringPiUserLevelAccess))
"""
function wiringPiUserLevelAccess()
    ccall((:wiringPiUserLevelAccess, libwiringPi), Cint, ())
end

"""
    wiringPiSetup()

$(_doc_external(:wiringPiSetup))
"""
function wiringPiSetup()
    ccall((:wiringPiSetup, libwiringPi), Cint, ())
end

"""
    wiringPiSetupSys()

$(_doc_external(:wiringPiSetupSys))
"""
function wiringPiSetupSys()
    ccall((:wiringPiSetupSys, libwiringPi), Cint, ())
end

"""
    wiringPiSetupGpio()

$(_doc_external(:wiringPiSetupGpio))
"""
function wiringPiSetupGpio()
    ccall((:wiringPiSetupGpio, libwiringPi), Cint, ())
end

"""
    wiringPiSetupPhys()

$(_doc_external(:wiringPiSetupPhys))
"""
function wiringPiSetupPhys()
    ccall((:wiringPiSetupPhys, libwiringPi), Cint, ())
end

"""
    wiringPiSetupPinType(pinType)

$(_doc_external(:wiringPiSetupPinType))
"""
function wiringPiSetupPinType(pinType)
    ccall((:wiringPiSetupPinType, libwiringPi), Cint, (WPIPinType,), pinType)
end

"""
    wiringPiSetupGpioDevice(pinType)

$(_doc_external(:wiringPiSetupGpioDevice))
"""
function wiringPiSetupGpioDevice(pinType)
    ccall((:wiringPiSetupGpioDevice, libwiringPi), Cint, (WPIPinType,), pinType)
end

"""
    WPIPinAlt

$(_doc_external(:WPIPinAlt))
"""
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
"""
    wiringPiGpioDeviceGetFd()

$(_doc_external(:wiringPiGpioDeviceGetFd))
"""
function wiringPiGpioDeviceGetFd()
    ccall((:wiringPiGpioDeviceGetFd, libwiringPi), Cint, ())
end

"""
    pinModeAlt(pin, mode)

$(_doc_external(:pinModeAlt))
"""
function pinModeAlt(pin, mode)
    ccall((:pinModeAlt, libwiringPi), Cvoid, (Cint, Cint), pin, mode)
end

"""
    getPinModeAlt(pin)

$(_doc_external(:getPinModeAlt))
"""
function getPinModeAlt(pin)
    ccall((:getPinModeAlt, libwiringPi), WPIPinAlt, (Cint,), pin)
end

"""
    pinMode(pin, mode)

$(_doc_external(:pinMode))
"""
function pinMode(pin, mode)
    ccall((:pinMode, libwiringPi), Cvoid, (Cint, Cint), pin, mode)
end

"""
    pullUpDnControl(pin, pud)

$(_doc_external(:pullUpDnControl))
"""
function pullUpDnControl(pin, pud)
    ccall((:pullUpDnControl, libwiringPi), Cvoid, (Cint, Cint), pin, pud)
end

"""
    digitalRead(pin)

$(_doc_external(:digitalRead))
"""
function digitalRead(pin)
    ccall((:digitalRead, libwiringPi), Cint, (Cint,), pin)
end

"""
    digitalWrite(pin, value)

$(_doc_external(:digitalWrite))
"""
function digitalWrite(pin, value)
    ccall((:digitalWrite, libwiringPi), Cvoid, (Cint, Cint), pin, value)
end

"""
    digitalRead8(pin)

$(_doc_external(:digitalRead8))
"""
function digitalRead8(pin)
    ccall((:digitalRead8, libwiringPi), Cuint, (Cint,), pin)
end

"""
    digitalWrite8(pin, value)

$(_doc_external(:digitalWrite8))
"""
function digitalWrite8(pin, value)
    ccall((:digitalWrite8, libwiringPi), Cvoid, (Cint, Cint), pin, value)
end

"""
    pwmWrite(pin, value)

$(_doc_external(:pwmWrite))
"""
function pwmWrite(pin, value)
    ccall((:pwmWrite, libwiringPi), Cvoid, (Cint, Cint), pin, value)
end

"""
    analogRead(pin)

$(_doc_external(:analogRead))
"""
function analogRead(pin)
    ccall((:analogRead, libwiringPi), Cint, (Cint,), pin)
end

"""
    analogWrite(pin, value)

$(_doc_external(:analogWrite))
"""
function analogWrite(pin, value)
    ccall((:analogWrite, libwiringPi), Cvoid, (Cint, Cint), pin, value)
end

"""
    wiringPiSetupPiFace()

$(_doc_external(:wiringPiSetupPiFace))
"""
function wiringPiSetupPiFace()
    ccall((:wiringPiSetupPiFace, libwiringPi), Cint, ())
end

"""
    wiringPiSetupPiFaceForGpioProg()

$(_doc_external(:wiringPiSetupPiFaceForGpioProg))
"""
function wiringPiSetupPiFaceForGpioProg()
    ccall((:wiringPiSetupPiFaceForGpioProg, libwiringPi), Cint, ())
end

"""
    piGpioLayout()

$(_doc_external(:piGpioLayout))
"""
function piGpioLayout()
    ccall((:piGpioLayout, libwiringPi), Cint, ())
end

"""
    piBoardRev()

$(_doc_external(:piBoardRev))
"""
function piBoardRev()
    ccall((:piBoardRev, libwiringPi), Cint, ())
end

"""
    piBoardId(model, rev, mem, maker, overVolted)

$(_doc_external(:piBoardId))
"""
function piBoardId(model, rev, mem, maker, overVolted)
    ccall((:piBoardId, libwiringPi), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), model, rev, mem, maker, overVolted)
end

"""
    piBoard40Pin()

$(_doc_external(:piBoard40Pin))
"""
function piBoard40Pin()
    ccall((:piBoard40Pin, libwiringPi), Cint, ())
end

"""
    piRP1Model()

$(_doc_external(:piRP1Model))
"""
function piRP1Model()
    ccall((:piRP1Model, libwiringPi), Cint, ())
end

"""
    wpiPinToGpio(wpiPin)

$(_doc_external(:wpiPinToGpio))
"""
function wpiPinToGpio(wpiPin)
    ccall((:wpiPinToGpio, libwiringPi), Cint, (Cint,), wpiPin)
end

"""
    physPinToGpio(physPin)

$(_doc_external(:physPinToGpio))
"""
function physPinToGpio(physPin)
    ccall((:physPinToGpio, libwiringPi), Cint, (Cint,), physPin)
end

"""
    setPadDrive(group, value)

$(_doc_external(:setPadDrive))
"""
function setPadDrive(group, value)
    ccall((:setPadDrive, libwiringPi), Cvoid, (Cint, Cint), group, value)
end

"""
    setPadDrivePin(pin, value)

$(_doc_external(:setPadDrivePin))
"""
function setPadDrivePin(pin, value)
    ccall((:setPadDrivePin, libwiringPi), Cvoid, (Cint, Cint), pin, value)
end

"""
    getAlt(pin)

$(_doc_external(:getAlt))
"""
function getAlt(pin)
    ccall((:getAlt, libwiringPi), Cint, (Cint,), pin)
end

"""
    pwmToneWrite(pin, freq)

$(_doc_external(:pwmToneWrite))
"""
function pwmToneWrite(pin, freq)
    ccall((:pwmToneWrite, libwiringPi), Cvoid, (Cint, Cint), pin, freq)
end

"""
    pwmSetMode(mode)

$(_doc_external(:pwmSetMode))
"""
function pwmSetMode(mode)
    ccall((:pwmSetMode, libwiringPi), Cvoid, (Cint,), mode)
end

"""
    pwmSetRange(range)

$(_doc_external(:pwmSetRange))
"""
function pwmSetRange(range)
    ccall((:pwmSetRange, libwiringPi), Cvoid, (Cuint,), range)
end

"""
    pwmSetClock(divisor)

$(_doc_external(:pwmSetClock))
"""
function pwmSetClock(divisor)
    ccall((:pwmSetClock, libwiringPi), Cvoid, (Cint,), divisor)
end

"""
    gpioClockSet(pin, freq)

$(_doc_external(:gpioClockSet))
"""
function gpioClockSet(pin, freq)
    ccall((:gpioClockSet, libwiringPi), Cvoid, (Cint, Cint), pin, freq)
end

"""
    digitalReadByte()

$(_doc_external(:digitalReadByte))
"""
function digitalReadByte()
    ccall((:digitalReadByte, libwiringPi), Cuint, ())
end

"""
    digitalReadByte2()

$(_doc_external(:digitalReadByte2))
"""
function digitalReadByte2()
    ccall((:digitalReadByte2, libwiringPi), Cuint, ())
end

"""
    digitalWriteByte(value)

$(_doc_external(:digitalWriteByte))
"""
function digitalWriteByte(value)
    ccall((:digitalWriteByte, libwiringPi), Cvoid, (Cint,), value)
end

"""
    digitalWriteByte2(value)

$(_doc_external(:digitalWriteByte2))
"""
function digitalWriteByte2(value)
    ccall((:digitalWriteByte2, libwiringPi), Cvoid, (Cint,), value)
end

"""
    waitForInterrupt(pin, mS)

$(_doc_external(:waitForInterrupt))
"""
function waitForInterrupt(pin, mS)
    ccall((:waitForInterrupt, libwiringPi), Cint, (Cint, Cint), pin, mS)
end

"""
    wiringPiISR(pin, mode, _function)

$(_doc_external(:wiringPiISR))
"""
function wiringPiISR(pin, mode, _function)
    ccall((:wiringPiISR, libwiringPi), Cint, (Cint, Cint, Ptr{Cvoid}), pin, mode, _function)
end

"""
    wiringPiISRStop(pin)

$(_doc_external(:wiringPiISRStop))
"""
function wiringPiISRStop(pin)
    ccall((:wiringPiISRStop, libwiringPi), Cint, (Cint,), pin)
end

"""
    waitForInterruptClose(pin)

$(_doc_external(:waitForInterruptClose))
"""
function waitForInterruptClose(pin)
    ccall((:waitForInterruptClose, libwiringPi), Cint, (Cint,), pin)
end

"""
    piThreadCreate(fn)

$(_doc_external(:piThreadCreate))
"""
function piThreadCreate(fn)
    ccall((:piThreadCreate, libwiringPi), Cint, (Ptr{Cvoid},), fn)
end

"""
    piLock(key)

$(_doc_external(:piLock))
"""
function piLock(key)
    ccall((:piLock, libwiringPi), Cvoid, (Cint,), key)
end

"""
    piUnlock(key)

$(_doc_external(:piUnlock))
"""
function piUnlock(key)
    ccall((:piUnlock, libwiringPi), Cvoid, (Cint,), key)
end

"""
    piHiPri(pri)

$(_doc_external(:piHiPri))
"""
function piHiPri(pri)
    ccall((:piHiPri, libwiringPi), Cint, (Cint,), pri)
end

"""
    delay(howLong)

$(_doc_external(:delay))
"""
function delay(howLong)
    ccall((:delay, libwiringPi), Cvoid, (Cuint,), howLong)
end

"""
    delayMicroseconds(howLong)

$(_doc_external(:delayMicroseconds))
"""
function delayMicroseconds(howLong)
    ccall((:delayMicroseconds, libwiringPi), Cvoid, (Cuint,), howLong)
end

"""
    millis()

$(_doc_external(:millis))
"""
function millis()
    ccall((:millis, libwiringPi), Cuint, ())
end

"""
    micros()

$(_doc_external(:micros))
"""
function micros()
    ccall((:micros, libwiringPi), Cuint, ())
end

"""
    piMicros64()

$(_doc_external(:piMicros64))
"""
function piMicros64()
    ccall((:piMicros64, libwiringPi), Culonglong, ())
end

"""
    wiringPiI2CRead(fd)

$(_doc_external(:wiringPiI2CRead))
"""
function wiringPiI2CRead(fd)
    ccall((:wiringPiI2CRead, libwiringPi), Cint, (Cint,), fd)
end

"""
    wiringPiI2CReadReg8(fd, reg)

$(_doc_external(:wiringPiI2CReadReg8))
"""
function wiringPiI2CReadReg8(fd, reg)
    ccall((:wiringPiI2CReadReg8, libwiringPi), Cint, (Cint, Cint), fd, reg)
end

"""
    wiringPiI2CReadReg16(fd, reg)

$(_doc_external(:wiringPiI2CReadReg16))
"""
function wiringPiI2CReadReg16(fd, reg)
    ccall((:wiringPiI2CReadReg16, libwiringPi), Cint, (Cint, Cint), fd, reg)
end

"""
    wiringPiI2CReadBlockData(fd, reg, values, size)

$(_doc_external(:wiringPiI2CReadBlockData))
"""
function wiringPiI2CReadBlockData(fd, reg, values, size)
    ccall((:wiringPiI2CReadBlockData, libwiringPi), Cint, (Cint, Cint, Ptr{UInt8}, UInt8), fd, reg, values, size)
end

"""
    wiringPiI2CRawRead(fd, values, size)

$(_doc_external(:wiringPiI2CRawRead))
"""
function wiringPiI2CRawRead(fd, values, size)
    ccall((:wiringPiI2CRawRead, libwiringPi), Cint, (Cint, Ptr{UInt8}, UInt8), fd, values, size)
end

"""
    wiringPiI2CWrite(fd, data)

$(_doc_external(:wiringPiI2CWrite))
"""
function wiringPiI2CWrite(fd, data)
    ccall((:wiringPiI2CWrite, libwiringPi), Cint, (Cint, Cint), fd, data)
end

"""
    wiringPiI2CWriteReg8(fd, reg, data)

$(_doc_external(:wiringPiI2CWriteReg8))
"""
function wiringPiI2CWriteReg8(fd, reg, data)
    ccall((:wiringPiI2CWriteReg8, libwiringPi), Cint, (Cint, Cint, Cint), fd, reg, data)
end

"""
    wiringPiI2CWriteReg16(fd, reg, data)

$(_doc_external(:wiringPiI2CWriteReg16))
"""
function wiringPiI2CWriteReg16(fd, reg, data)
    ccall((:wiringPiI2CWriteReg16, libwiringPi), Cint, (Cint, Cint, Cint), fd, reg, data)
end

"""
    wiringPiI2CWriteBlockData(fd, reg, values, size)

$(_doc_external(:wiringPiI2CWriteBlockData))
"""
function wiringPiI2CWriteBlockData(fd, reg, values, size)
    ccall((:wiringPiI2CWriteBlockData, libwiringPi), Cint, (Cint, Cint, Ptr{UInt8}, UInt8), fd, reg, values, size)
end

"""
    wiringPiI2CRawWrite(fd, values, size)

$(_doc_external(:wiringPiI2CRawWrite))
"""
function wiringPiI2CRawWrite(fd, values, size)
    ccall((:wiringPiI2CRawWrite, libwiringPi), Cint, (Cint, Ptr{UInt8}, UInt8), fd, values, size)
end

"""
    wiringPiI2CSetupInterface(device, devId)

$(_doc_external(:wiringPiI2CSetupInterface))
"""
function wiringPiI2CSetupInterface(device, devId)
    ccall((:wiringPiI2CSetupInterface, libwiringPi), Cint, (Ptr{Cchar}, Cint), device, devId)
end

"""
    wiringPiI2CSetup(devId)

$(_doc_external(:wiringPiI2CSetup))
"""
function wiringPiI2CSetup(devId)
    ccall((:wiringPiI2CSetup, libwiringPi), Cint, (Cint,), devId)
end

"""
    GetPiRevisionLegacy(line, linelength, revision)

$(_doc_external(:GetPiRevisionLegacy))
"""
function GetPiRevisionLegacy(line, linelength, revision)
    ccall((:GetPiRevisionLegacy, libwiringPi), Ptr{Cchar}, (Ptr{Cchar}, Cint, Ptr{Cuint}), line, linelength, revision)
end

"""
    wiringPiSPIGetFd(channel)

$(_doc_external(:wiringPiSPIGetFd))
"""
function wiringPiSPIGetFd(channel)
    ccall((:wiringPiSPIGetFd, libwiringPi), Cint, (Cint,), channel)
end

"""
    wiringPiSPIDataRW(channel, data, len)

$(_doc_external(:wiringPiSPIDataRW))
"""
function wiringPiSPIDataRW(channel, data, len)
    ccall((:wiringPiSPIDataRW, libwiringPi), Cint, (Cint, Ptr{Cuchar}, Cint), channel, data, len)
end

"""
    wiringPiSPISetupMode(channel, speed, mode)

$(_doc_external(:wiringPiSPISetupMode))
"""
function wiringPiSPISetupMode(channel, speed, mode)
    ccall((:wiringPiSPISetupMode, libwiringPi), Cint, (Cint, Cint, Cint), channel, speed, mode)
end

"""
    wiringPiSPISetup(channel, speed)

$(_doc_external(:wiringPiSPISetup))
"""
function wiringPiSPISetup(channel, speed)
    ccall((:wiringPiSPISetup, libwiringPi), Cint, (Cint, Cint), channel, speed)
end

"""
    wiringPiSPIClose(channel)

$(_doc_external(:wiringPiSPIClose))
"""
function wiringPiSPIClose(channel)
    ccall((:wiringPiSPIClose, libwiringPi), Cint, (Cint,), channel)
end

"""
    wiringPiSPIxGetFd(number, channel)

$(_doc_external(:wiringPiSPIxGetFd))
"""
function wiringPiSPIxGetFd(number, channel)
    ccall((:wiringPiSPIxGetFd, libwiringPi), Cint, (Cint, Cint), number, channel)
end

"""
    wiringPiSPIxDataRW(number, channel, data, len)

$(_doc_external(:wiringPiSPIxDataRW))
"""
function wiringPiSPIxDataRW(number, channel, data, len)
    ccall((:wiringPiSPIxDataRW, libwiringPi), Cint, (Cint, Cint, Ptr{Cuchar}, Cint), number, channel, data, len)
end

"""
    wiringPiSPIxSetupMode(number, channel, speed, mode)

$(_doc_external(:wiringPiSPIxSetupMode))
"""
function wiringPiSPIxSetupMode(number, channel, speed, mode)
    ccall((:wiringPiSPIxSetupMode, libwiringPi), Cint, (Cint, Cint, Cint, Cint), number, channel, speed, mode)
end

"""
    wiringPiSPIxSetup(number, channel, speed)

$(_doc_external(:wiringPiSPIxSetup))
"""
function wiringPiSPIxSetup(number, channel, speed)
    ccall((:wiringPiSPIxSetup, libwiringPi), Cint, (Cint, Cint, Cint), number, channel, speed)
end

"""
    wiringPiSPIxClose(number, channel)

$(_doc_external(:wiringPiSPIxClose))
"""
function wiringPiSPIxClose(number, channel)
    ccall((:wiringPiSPIxClose, libwiringPi), Cint, (Cint, Cint), number, channel)
end

"""
    serialOpen(device, baud)

$(_doc_external(:serialOpen))
"""
function serialOpen(device, baud)
    ccall((:serialOpen, libwiringPi), Cint, (Ptr{Cchar}, Cint), device, baud)
end

"""
    serialClose(fd)

$(_doc_external(:serialClose))
"""
function serialClose(fd)
    ccall((:serialClose, libwiringPi), Cvoid, (Cint,), fd)
end

"""
    serialFlush(fd)

$(_doc_external(:serialFlush))
"""
function serialFlush(fd)
    ccall((:serialFlush, libwiringPi), Cvoid, (Cint,), fd)
end

"""
    serialPutchar(fd, c)

$(_doc_external(:serialPutchar))
"""
function serialPutchar(fd, c)
    ccall((:serialPutchar, libwiringPi), Cvoid, (Cint, Cuchar), fd, c)
end

"""
    serialPuts(fd, s)

$(_doc_external(:serialPuts))
"""
function serialPuts(fd, s)
    ccall((:serialPuts, libwiringPi), Cvoid, (Cint, Ptr{Cchar}), fd, s)
end

# automatic type deduction for variadic arguments may not be what you want, please use with caution
@generated function serialPrintf(fd, message, va_list...)
        :(@ccall(libwiringPi.serialPrintf(fd::Cint, message::Ptr{Cchar}; $(to_c_type_pairs(va_list)...))::Cvoid))
    end

"""
    serialDataAvail(fd)

$(_doc_external(:serialDataAvail))
"""
function serialDataAvail(fd)
    ccall((:serialDataAvail, libwiringPi), Cint, (Cint,), fd)
end

"""
    serialGetchar(fd)

$(_doc_external(:serialGetchar))
"""
function serialGetchar(fd)
    ccall((:serialGetchar, libwiringPi), Cint, (Cint,), fd)
end

"""
    shiftIn(dPin, cPin, order)

$(_doc_external(:shiftIn))
"""
function shiftIn(dPin, cPin, order)
    ccall((:shiftIn, libwiringPi), UInt8, (UInt8, UInt8, UInt8), dPin, cPin, order)
end

"""
    shiftOut(dPin, cPin, order, val)

$(_doc_external(:shiftOut))
"""
function shiftOut(dPin, cPin, order, val)
    ccall((:shiftOut, libwiringPi), Cvoid, (UInt8, UInt8, UInt8, UInt8), dPin, cPin, order, val)
end

"""
    loadWPiExtension(progName, extensionData, verbose)

$(_doc_external(:loadWPiExtension))
"""
function loadWPiExtension(progName, extensionData, verbose)
    ccall((:loadWPiExtension, libwiringPi), Cint, (Ptr{Cchar}, Ptr{Cchar}, Cint), progName, extensionData, verbose)
end

"""
$(_doc_external(:ADS1115_GAIN_6))
"""
const ADS1115_GAIN_6 = 0

"""
$(_doc_external(:ADS1115_GAIN_4))
"""
const ADS1115_GAIN_4 = 1

"""
$(_doc_external(:ADS1115_GAIN_2))
"""
const ADS1115_GAIN_2 = 2

"""
$(_doc_external(:ADS1115_GAIN_1))
"""
const ADS1115_GAIN_1 = 3

"""
$(_doc_external(:ADS1115_GAIN_HALF))
"""
const ADS1115_GAIN_HALF = 4

"""
$(_doc_external(:ADS1115_GAIN_QUARTER))
"""
const ADS1115_GAIN_QUARTER = 5

"""
$(_doc_external(:ADS1115_DR_8))
"""
const ADS1115_DR_8 = 0

"""
$(_doc_external(:ADS1115_DR_16))
"""
const ADS1115_DR_16 = 1

"""
$(_doc_external(:ADS1115_DR_32))
"""
const ADS1115_DR_32 = 2

"""
$(_doc_external(:ADS1115_DR_64))
"""
const ADS1115_DR_64 = 3

"""
$(_doc_external(:ADS1115_DR_128))
"""
const ADS1115_DR_128 = 4

"""
$(_doc_external(:ADS1115_DR_250))
"""
const ADS1115_DR_250 = 5

"""
$(_doc_external(:ADS1115_DR_475))
"""
const ADS1115_DR_475 = 6

"""
$(_doc_external(:ADS1115_DR_860))
"""
const ADS1115_DR_860 = 7

"""
$(_doc_external(:MCP23016_GP0))
"""
const MCP23016_GP0 = 0x00

"""
$(_doc_external(:MCP23016_GP1))
"""
const MCP23016_GP1 = 0x01

"""
$(_doc_external(:MCP23016_OLAT0))
"""
const MCP23016_OLAT0 = 0x02

"""
$(_doc_external(:MCP23016_OLAT1))
"""
const MCP23016_OLAT1 = 0x03

"""
$(_doc_external(:MCP23016_IPOL0))
"""
const MCP23016_IPOL0 = 0x04

"""
$(_doc_external(:MCP23016_IPOL1))
"""
const MCP23016_IPOL1 = 0x05

"""
$(_doc_external(:MCP23016_IODIR0))
"""
const MCP23016_IODIR0 = 0x06

"""
$(_doc_external(:MCP23016_IODIR1))
"""
const MCP23016_IODIR1 = 0x07

"""
$(_doc_external(:MCP23016_INTCAP0))
"""
const MCP23016_INTCAP0 = 0x08

"""
$(_doc_external(:MCP23016_INTCAP1))
"""
const MCP23016_INTCAP1 = 0x09

"""
$(_doc_external(:MCP23016_IOCON0))
"""
const MCP23016_IOCON0 = 0x0a

"""
$(_doc_external(:MCP23016_IOCON1))
"""
const MCP23016_IOCON1 = 0x0b

"""
$(_doc_external(:IOCON_IARES))
"""
const IOCON_IARES = 0x01

"""
$(_doc_external(:IOCON_INIT))
"""
const IOCON_INIT = 0

"""
$(_doc_external(:IODIRA))
"""
const IODIRA = 0x00

"""
$(_doc_external(:IPOLA))
"""
const IPOLA = 0x02

"""
$(_doc_external(:GPINTENA))
"""
const GPINTENA = 0x04

"""
$(_doc_external(:DEFVALA))
"""
const DEFVALA = 0x06

"""
$(_doc_external(:INTCONA))
"""
const INTCONA = 0x08

"""
$(_doc_external(:IOCON))
"""
const IOCON = 0x0a

"""
$(_doc_external(:GPPUA))
"""
const GPPUA = 0x0c

"""
$(_doc_external(:INTFA))
"""
const INTFA = 0x0e

"""
$(_doc_external(:INTCAPA))
"""
const INTCAPA = 0x10

"""
$(_doc_external(:GPIOA))
"""
const GPIOA = 0x12

"""
$(_doc_external(:OLATA))
"""
const OLATA = 0x14

"""
$(_doc_external(:IODIRB))
"""
const IODIRB = 0x01

"""
$(_doc_external(:IPOLB))
"""
const IPOLB = 0x03

"""
$(_doc_external(:GPINTENB))
"""
const GPINTENB = 0x05

"""
$(_doc_external(:DEFVALB))
"""
const DEFVALB = 0x07

"""
$(_doc_external(:INTCONB))
"""
const INTCONB = 0x09

"""
$(_doc_external(:IOCONB))
"""
const IOCONB = 0x0b

"""
$(_doc_external(:GPPUB))
"""
const GPPUB = 0x0d

"""
$(_doc_external(:INTFB))
"""
const INTFB = 0x0f

"""
$(_doc_external(:INTCAPB))
"""
const INTCAPB = 0x11

"""
$(_doc_external(:GPIOB))
"""
const GPIOB = 0x13

"""
$(_doc_external(:OLATB))
"""
const OLATB = 0x15

"""
$(_doc_external(:IOCON_UNUSED))
"""
const IOCON_UNUSED = 0x01

"""
$(_doc_external(:IOCON_INTPOL))
"""
const IOCON_INTPOL = 0x02

"""
$(_doc_external(:IOCON_ODR))
"""
const IOCON_ODR = 0x04

"""
$(_doc_external(:IOCON_HAEN))
"""
const IOCON_HAEN = 0x08

"""
$(_doc_external(:IOCON_DISSLW))
"""
const IOCON_DISSLW = 0x10

"""
$(_doc_external(:IOCON_SEQOP))
"""
const IOCON_SEQOP = 0x20

"""
$(_doc_external(:IOCON_MIRROR))
"""
const IOCON_MIRROR = 0x40

"""
$(_doc_external(:IOCON_BANK_MODE))
"""
const IOCON_BANK_MODE = 0x80

"""
$(_doc_external(:CMD_WRITE))
"""
const CMD_WRITE = 0x40

"""
$(_doc_external(:CMD_READ))
"""
const CMD_READ = 0x41

"""
$(_doc_external(:MCP23x08_IODIR))
"""
const MCP23x08_IODIR = 0x00

"""
$(_doc_external(:MCP23x08_IPOL))
"""
const MCP23x08_IPOL = 0x01

"""
$(_doc_external(:MCP23x08_GPINTEN))
"""
const MCP23x08_GPINTEN = 0x02

"""
$(_doc_external(:MCP23x08_DEFVAL))
"""
const MCP23x08_DEFVAL = 0x03

"""
$(_doc_external(:MCP23x08_INTCON))
"""
const MCP23x08_INTCON = 0x04

"""
$(_doc_external(:MCP23x08_IOCON))
"""
const MCP23x08_IOCON = 0x05

"""
$(_doc_external(:MCP23x08_GPPU))
"""
const MCP23x08_GPPU = 0x06

"""
$(_doc_external(:MCP23x08_INTF))
"""
const MCP23x08_INTF = 0x07

"""
$(_doc_external(:MCP23x08_INTCAP))
"""
const MCP23x08_INTCAP = 0x08

"""
$(_doc_external(:MCP23x08_GPIO))
"""
const MCP23x08_GPIO = 0x09

"""
$(_doc_external(:MCP23x08_OLAT))
"""
const MCP23x08_OLAT = 0x0a

"""
$(_doc_external(:MCP23x17_IODIRA))
"""
const MCP23x17_IODIRA = 0x00

"""
$(_doc_external(:MCP23x17_IPOLA))
"""
const MCP23x17_IPOLA = 0x02

"""
$(_doc_external(:MCP23x17_GPINTENA))
"""
const MCP23x17_GPINTENA = 0x04

"""
$(_doc_external(:MCP23x17_DEFVALA))
"""
const MCP23x17_DEFVALA = 0x06

"""
$(_doc_external(:MCP23x17_INTCONA))
"""
const MCP23x17_INTCONA = 0x08

"""
$(_doc_external(:MCP23x17_IOCON))
"""
const MCP23x17_IOCON = 0x0a

"""
$(_doc_external(:MCP23x17_GPPUA))
"""
const MCP23x17_GPPUA = 0x0c

"""
$(_doc_external(:MCP23x17_INTFA))
"""
const MCP23x17_INTFA = 0x0e

"""
$(_doc_external(:MCP23x17_INTCAPA))
"""
const MCP23x17_INTCAPA = 0x10

"""
$(_doc_external(:MCP23x17_GPIOA))
"""
const MCP23x17_GPIOA = 0x12

"""
$(_doc_external(:MCP23x17_OLATA))
"""
const MCP23x17_OLATA = 0x14

"""
$(_doc_external(:MCP23x17_IODIRB))
"""
const MCP23x17_IODIRB = 0x01

"""
$(_doc_external(:MCP23x17_IPOLB))
"""
const MCP23x17_IPOLB = 0x03

"""
$(_doc_external(:MCP23x17_GPINTENB))
"""
const MCP23x17_GPINTENB = 0x05

"""
$(_doc_external(:MCP23x17_DEFVALB))
"""
const MCP23x17_DEFVALB = 0x07

"""
$(_doc_external(:MCP23x17_INTCONB))
"""
const MCP23x17_INTCONB = 0x09

"""
$(_doc_external(:MCP23x17_IOCONB))
"""
const MCP23x17_IOCONB = 0x0b

"""
$(_doc_external(:MCP23x17_GPPUB))
"""
const MCP23x17_GPPUB = 0x0d

"""
$(_doc_external(:MCP23x17_INTFB))
"""
const MCP23x17_INTFB = 0x0f

"""
$(_doc_external(:MCP23x17_INTCAPB))
"""
const MCP23x17_INTCAPB = 0x11

"""
$(_doc_external(:MCP23x17_GPIOB))
"""
const MCP23x17_GPIOB = 0x13

"""
$(_doc_external(:MCP23x17_OLATB))
"""
const MCP23x17_OLATB = 0x15

"""
$(_doc_external(:MCP3422_SR_240))
"""
const MCP3422_SR_240 = 0

"""
$(_doc_external(:MCP3422_SR_60))
"""
const MCP3422_SR_60 = 1

"""
$(_doc_external(:MCP3422_SR_15))
"""
const MCP3422_SR_15 = 2

"""
$(_doc_external(:MCP3422_SR_3_75))
"""
const MCP3422_SR_3_75 = 3

"""
$(_doc_external(:MCP3422_GAIN_1))
"""
const MCP3422_GAIN_1 = 0

"""
$(_doc_external(:MCP3422_GAIN_2))
"""
const MCP3422_GAIN_2 = 1

"""
$(_doc_external(:MCP3422_GAIN_4))
"""
const MCP3422_GAIN_4 = 2

"""
$(_doc_external(:MCP3422_GAIN_8))
"""
const MCP3422_GAIN_8 = 3

"""
$(_doc_external(:__WIRING_PI_H__))
"""
"""
$(_doc_external(:TRUE))
"""
const TRUE = 1 == 1

"""
$(_doc_external(:FALSE))
"""
const FALSE = !TRUE

"""
$(_doc_external(:UNU))
"""
# Skipping MacroDefinition: UNU __attribute__ ( ( unused ) )

"""
$(_doc_external(:PI_GPIO_MASK))
"""
const PI_GPIO_MASK = 0xffffffc0

"""
$(_doc_external(:WPI_MODE_PINS))
"""
const WPI_MODE_PINS = 0

"""
$(_doc_external(:WPI_MODE_GPIO))
"""
const WPI_MODE_GPIO = 1

"""
$(_doc_external(:WPI_MODE_GPIO_SYS))
"""
const WPI_MODE_GPIO_SYS = 2

"""
$(_doc_external(:WPI_MODE_PHYS))
"""
const WPI_MODE_PHYS = 3

"""
$(_doc_external(:WPI_MODE_PIFACE))
"""
const WPI_MODE_PIFACE = 4

"""
$(_doc_external(:WPI_MODE_GPIO_DEVICE_BCM))
"""
const WPI_MODE_GPIO_DEVICE_BCM = 5

"""
$(_doc_external(:WPI_MODE_GPIO_DEVICE_WPI))
"""
const WPI_MODE_GPIO_DEVICE_WPI = 6

"""
$(_doc_external(:WPI_MODE_GPIO_DEVICE_PHYS))
"""
const WPI_MODE_GPIO_DEVICE_PHYS = 7

"""
$(_doc_external(:WPI_MODE_UNINITIALISED))
"""
const WPI_MODE_UNINITIALISED = -1

"""
$(_doc_external(:INPUT))
"""
const INPUT = 0

"""
$(_doc_external(:OUTPUT))
"""
const OUTPUT = 1

"""
$(_doc_external(:PWM_OUTPUT))
"""
const PWM_OUTPUT = 2

"""
$(_doc_external(:PWM_MS_OUTPUT))
"""
const PWM_MS_OUTPUT = 8

"""
$(_doc_external(:PWM_BAL_OUTPUT))
"""
const PWM_BAL_OUTPUT = 9

"""
$(_doc_external(:GPIO_CLOCK))
"""
const GPIO_CLOCK = 3

"""
$(_doc_external(:SOFT_PWM_OUTPUT))
"""
const SOFT_PWM_OUTPUT = 4

"""
$(_doc_external(:SOFT_TONE_OUTPUT))
"""
const SOFT_TONE_OUTPUT = 5

"""
$(_doc_external(:PWM_TONE_OUTPUT))
"""
const PWM_TONE_OUTPUT = 6

"""
$(_doc_external(:PM_OFF))
"""
const PM_OFF = 7

"""
$(_doc_external(:LOW))
"""
const LOW = 0

"""
$(_doc_external(:HIGH))
"""
const HIGH = 1

"""
$(_doc_external(:PUD_OFF))
"""
const PUD_OFF = 0

"""
$(_doc_external(:PUD_DOWN))
"""
const PUD_DOWN = 1

"""
$(_doc_external(:PUD_UP))
"""
const PUD_UP = 2

"""
$(_doc_external(:PWM_MODE_MS))
"""
const PWM_MODE_MS = 0

"""
$(_doc_external(:PWM_MODE_BAL))
"""
const PWM_MODE_BAL = 1

"""
$(_doc_external(:INT_EDGE_SETUP))
"""
const INT_EDGE_SETUP = 0

"""
$(_doc_external(:INT_EDGE_FALLING))
"""
const INT_EDGE_FALLING = 1

"""
$(_doc_external(:INT_EDGE_RISING))
"""
const INT_EDGE_RISING = 2

"""
$(_doc_external(:INT_EDGE_BOTH))
"""
const INT_EDGE_BOTH = 3

"""
$(_doc_external(:PI_MODEL_A))
"""
const PI_MODEL_A = 0

"""
$(_doc_external(:PI_MODEL_B))
"""
const PI_MODEL_B = 1

"""
$(_doc_external(:PI_MODEL_AP))
"""
const PI_MODEL_AP = 2

"""
$(_doc_external(:PI_MODEL_BP))
"""
const PI_MODEL_BP = 3

"""
$(_doc_external(:PI_MODEL_2))
"""
const PI_MODEL_2 = 4

"""
$(_doc_external(:PI_ALPHA))
"""
const PI_ALPHA = 5

"""
$(_doc_external(:PI_MODEL_CM))
"""
const PI_MODEL_CM = 6

"""
$(_doc_external(:PI_MODEL_3B))
"""
const PI_MODEL_3B = 8

"""
$(_doc_external(:PI_MODEL_ZERO))
"""
const PI_MODEL_ZERO = 9

"""
$(_doc_external(:PI_MODEL_CM3))
"""
const PI_MODEL_CM3 = 10

"""
$(_doc_external(:PI_MODEL_ZERO_W))
"""
const PI_MODEL_ZERO_W = 12

"""
$(_doc_external(:PI_MODEL_3BP))
"""
const PI_MODEL_3BP = 13

"""
$(_doc_external(:PI_MODEL_3AP))
"""
const PI_MODEL_3AP = 14

"""
$(_doc_external(:PI_MODEL_CM3P))
"""
const PI_MODEL_CM3P = 16

"""
$(_doc_external(:PI_MODEL_4B))
"""
const PI_MODEL_4B = 17

"""
$(_doc_external(:PI_MODEL_ZERO_2W))
"""
const PI_MODEL_ZERO_2W = 18

"""
$(_doc_external(:PI_MODEL_400))
"""
const PI_MODEL_400 = 19

"""
$(_doc_external(:PI_MODEL_CM4))
"""
const PI_MODEL_CM4 = 20

"""
$(_doc_external(:PI_MODEL_CM4S))
"""
const PI_MODEL_CM4S = 21

"""
$(_doc_external(:PI_MODEL_5))
"""
const PI_MODEL_5 = 23

"""
$(_doc_external(:PI_MODEL_CM5))
"""
const PI_MODEL_CM5 = 24

"""
$(_doc_external(:PI_MODEL_500))
"""
const PI_MODEL_500 = 25

"""
$(_doc_external(:PI_MODEL_CM5L))
"""
const PI_MODEL_CM5L = 26

"""
$(_doc_external(:PI_MODELS_MAX))
"""
const PI_MODELS_MAX = 27

"""
$(_doc_external(:PI_VERSION_1))
"""
const PI_VERSION_1 = 0

"""
$(_doc_external(:PI_VERSION_1_1))
"""
const PI_VERSION_1_1 = 1

"""
$(_doc_external(:PI_VERSION_1_2))
"""
const PI_VERSION_1_2 = 2

"""
$(_doc_external(:PI_VERSION_2))
"""
const PI_VERSION_2 = 3

"""
$(_doc_external(:PI_MAKER_SONY))
"""
const PI_MAKER_SONY = 0

"""
$(_doc_external(:PI_MAKER_EGOMAN))
"""
const PI_MAKER_EGOMAN = 1

"""
$(_doc_external(:PI_MAKER_EMBEST))
"""
const PI_MAKER_EMBEST = 2

"""
$(_doc_external(:PI_MAKER_UNKNOWN))
"""
const PI_MAKER_UNKNOWN = 3

"""
$(_doc_external(:GPIO_LAYOUT_PI1_REV1))
"""
const GPIO_LAYOUT_PI1_REV1 = 1

"""
$(_doc_external(:GPIO_LAYOUT_DEFAULT))
"""
const GPIO_LAYOUT_DEFAULT = 2

"""
$(_doc_external(:PI_THREAD))
"""
"""
$(_doc_external(:WPI_FATAL))
"""
const WPI_FATAL = 1 == 1

"""
$(_doc_external(:WPI_ALMOST))
"""
const WPI_ALMOST = 1 == 2

"""
$(_doc_external(:LSBFIRST))
"""
const LSBFIRST = 0

"""
$(_doc_external(:MSBFIRST))
"""
const MSBFIRST = 1

excludes =  [Symbol(:eval), Symbol(:include), Symbol("#eval"), Symbol("#include")]
# exports
for name in names(@__MODULE__; all=true)
    if name ∉ excludes     
        @eval export $name
    end
end

end # module
