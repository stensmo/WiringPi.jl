module WiringPi

#using WiringPi_jll
#export WiringPi_jll

to_c_type(t::Type) = t
to_c_type_pairs(va_list) = map(enumerate(to_c_type.(va_list))) do (ind, type)
    :(va_list[$ind]::$type)
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
    ccall((:piGpioLayoutOops, WiringPi), Cvoid, (Ptr{Cchar},), why)
end

# automatic type deduction for variadic arguments may not be what you want, please use with caution
@generated function wiringPiFailure(fatal::Cint, message, va_list...)
        :(@ccall(WiringPi.wiringPiFailure(fatal::Cint, message::Ptr{Cchar}; $(to_c_type_pairs(va_list)...))::Cint))
    end

function wiringPiFindNode(pin::Cint)
    ccall((:wiringPiFindNode, WiringPi), Ptr{wiringPiNodeStruct}, (Cint,), pin)
end

function wiringPiNewNode(pinBase::Cint, numPins::Cint)
    ccall((:wiringPiNewNode, WiringPi), Ptr{wiringPiNodeStruct}, (Cint, Cint), pinBase, numPins)
end

@enum WPIPinType::UInt32 begin
    WPI_PIN_BCM = 1
    WPI_PIN_WPI = 2
    WPI_PIN_PHYS = 3
end

function wiringPiVersion(major, minor)
    ccall((:wiringPiVersion, WiringPi), Cvoid, (Ptr{Cint}, Ptr{Cint}), major, minor)
end

function wiringPiGlobalMemoryAccess()
    ccall((:wiringPiGlobalMemoryAccess, WiringPi), Cint, ())
end

function wiringPiUserLevelAccess()
    ccall((:wiringPiUserLevelAccess, WiringPi), Cint, ())
end

function wiringPiSetup()
    ccall((:wiringPiSetup, WiringPi), Cint, ())
end

function wiringPiSetupSys()
    ccall((:wiringPiSetupSys, WiringPi), Cint, ())
end

function wiringPiSetupGpio()
    ccall((:wiringPiSetupGpio, WiringPi), Cint, ())
end

function wiringPiSetupPhys()
    ccall((:wiringPiSetupPhys, WiringPi), Cint, ())
end

function wiringPiSetupPinType(pinType::WPIPinType)
    ccall((:wiringPiSetupPinType, WiringPi), Cint, (WPIPinType,), pinType)
end

function wiringPiSetupGpioDevice(pinType::WPIPinType)
    ccall((:wiringPiSetupGpioDevice, WiringPi), Cint, (WPIPinType,), pinType)
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
    ccall((:wiringPiGpioDeviceGetFd, WiringPi), Cint, ())
end

function pinModeAlt(pin::Cint, mode::Cint)
    ccall((:pinModeAlt, WiringPi), Cvoid, (Cint, Cint), pin, mode)
end

function getPinModeAlt(pin::Cint)
    ccall((:getPinModeAlt, WiringPi), WPIPinAlt, (Cint,), pin)
end

function pinMode(pin::Cint, mode::Cint)
    ccall((:pinMode, WiringPi), Cvoid, (Cint, Cint), pin, mode)
end

function pullUpDnControl(pin::Cint, pud::Cint)
    ccall((:pullUpDnControl, WiringPi), Cvoid, (Cint, Cint), pin, pud)
end

function digitalRead(pin::Cint)
    ccall((:digitalRead, WiringPi), Cint, (Cint,), pin)
end

function digitalWrite(pin::Cint, value::Cint)
    ccall((:digitalWrite, WiringPi), Cvoid, (Cint, Cint), pin, value)
end

function digitalRead8(pin::Cint)
    ccall((:digitalRead8, WiringPi), Cuint, (Cint,), pin)
end

function digitalWrite8(pin::Cint, value::Cint)
    ccall((:digitalWrite8, WiringPi), Cvoid, (Cint, Cint), pin, value)
end

function pwmWrite(pin::Cint, value::Cint)
    ccall((:pwmWrite, WiringPi), Cvoid, (Cint, Cint), pin, value)
end

function analogRead(pin::Cint)
    ccall((:analogRead, WiringPi), Cint, (Cint,), pin)
end

function analogWrite(pin::Cint, value::Cint)
    ccall((:analogWrite, WiringPi), Cvoid, (Cint, Cint), pin, value)
end

function wiringPiSetupPiFace()
    ccall((:wiringPiSetupPiFace, WiringPi), Cint, ())
end

function wiringPiSetupPiFaceForGpioProg()
    ccall((:wiringPiSetupPiFaceForGpioProg, WiringPi), Cint, ())
end

function piGpioLayout()
    ccall((:piGpioLayout, WiringPi), Cint, ())
end

function piBoardRev()
    ccall((:piBoardRev, WiringPi), Cint, ())
end

function piBoardId(model, rev, mem, maker, overVolted)
    ccall((:piBoardId, WiringPi), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), model, rev, mem, maker, overVolted)
end

function piBoard40Pin()
    ccall((:piBoard40Pin, WiringPi), Cint, ())
end

function piRP1Model()
    ccall((:piRP1Model, WiringPi), Cint, ())
end

function wpiPinToGpio(wpiPin::Cint)
    ccall((:wpiPinToGpio, WiringPi), Cint, (Cint,), wpiPin)
end

function physPinToGpio(physPin::Cint)
    ccall((:physPinToGpio, WiringPi), Cint, (Cint,), physPin)
end

function setPadDrive(group::Cint, value::Cint)
    ccall((:setPadDrive, WiringPi), Cvoid, (Cint, Cint), group, value)
end

function setPadDrivePin(pin::Cint, value::Cint)
    ccall((:setPadDrivePin, WiringPi), Cvoid, (Cint, Cint), pin, value)
end

function getAlt(pin::Cint)
    ccall((:getAlt, WiringPi), Cint, (Cint,), pin)
end

function pwmToneWrite(pin::Cint, freq::Cint)
    ccall((:pwmToneWrite, WiringPi), Cvoid, (Cint, Cint), pin, freq)
end

function pwmSetMode(mode::Cint)
    ccall((:pwmSetMode, WiringPi), Cvoid, (Cint,), mode)
end

function pwmSetRange(range::Cuint)
    ccall((:pwmSetRange, WiringPi), Cvoid, (Cuint,), range)
end

function pwmSetClock(divisor::Cint)
    ccall((:pwmSetClock, WiringPi), Cvoid, (Cint,), divisor)
end

function gpioClockSet(pin::Cint, freq::Cint)
    ccall((:gpioClockSet, WiringPi), Cvoid, (Cint, Cint), pin, freq)
end

function digitalReadByte()
    ccall((:digitalReadByte, WiringPi), Cuint, ())
end

function digitalReadByte2()
    ccall((:digitalReadByte2, WiringPi), Cuint, ())
end

function digitalWriteByte(value::Cint)
    ccall((:digitalWriteByte, WiringPi), Cvoid, (Cint,), value)
end

function digitalWriteByte2(value::Cint)
    ccall((:digitalWriteByte2, WiringPi), Cvoid, (Cint,), value)
end

function waitForInterrupt(pin::Cint, mS::Cint)
    ccall((:waitForInterrupt, WiringPi), Cint, (Cint, Cint), pin, mS)
end

function wiringPiISR(pin::Cint, mode::Cint, _function)
    ccall((:wiringPiISR, WiringPi), Cint, (Cint, Cint, Ptr{Cvoid}), pin, mode, _function)
end

function wiringPiISRStop(pin::Cint)
    ccall((:wiringPiISRStop, WiringPi), Cint, (Cint,), pin)
end

function waitForInterruptClose(pin::Cint)
    ccall((:waitForInterruptClose, WiringPi), Cint, (Cint,), pin)
end

function piThreadCreate(fn)
    ccall((:piThreadCreate, WiringPi), Cint, (Ptr{Cvoid},), fn)
end

function piLock(key::Cint)
    ccall((:piLock, WiringPi), Cvoid, (Cint,), key)
end

function piUnlock(key::Cint)
    ccall((:piUnlock, WiringPi), Cvoid, (Cint,), key)
end

function piHiPri(pri::Cint)
    ccall((:piHiPri, WiringPi), Cint, (Cint,), pri)
end

function delay(howLong::Cuint)
    ccall((:delay, WiringPi), Cvoid, (Cuint,), howLong)
end

function delayMicroseconds(howLong::Cuint)
    ccall((:delayMicroseconds, WiringPi), Cvoid, (Cuint,), howLong)
end

function millis()
    ccall((:millis, WiringPi), Cuint, ())
end

function micros()
    ccall((:micros, WiringPi), Cuint, ())
end

function piMicros64()
    ccall((:piMicros64, WiringPi), Culonglong, ())
end

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

end # module
