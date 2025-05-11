# Drives WaveShare EPD_7IN3F via WiringPi


using WiringPi
    
const EPD_RST_PIN     = 17;
const EPD_DC_PIN      = 25;
const EPD_CS_PIN      = 8;
const EPD_PWR_PIN     = 18;
const EPD_BUSY_PIN    = 24;
const EPD_MOSI_PIN    = 10;
const EPD_SCLK_PIN    = 11;

const EPD_7IN3F_WIDTH     =  800
const EPD_7IN3F_HEIGHT   =   480

const EPD_7IN3F_BLACK  = 0x0   
const EPD_7IN3F_WHITE  = 0x1   
const EPD_7IN3F_GREEN  = 0x2  
const EPD_7IN3F_BLUE   = 0x3   
const EPD_7IN3F_RED    = 0x4   
const EPD_7IN3F_YELLOW = 0x5   
const EPD_7IN3F_ORANGE = 0x6   
const EPD_7IN3F_CLEAN  = 0x7  





function EPD_7IN3F_Display(Image::Vector{UInt8})

 
    Width::Int64 = (EPD_7IN3F_WIDTH % 2 == 0) ? (EPD_7IN3F_WIDTH / 2 ) : (EPD_7IN3F_WIDTH / 2 + 1);
    Height::Int64 = EPD_7IN3F_HEIGHT;

    EPD_7IN3F_SendCommand(0x10);
    for  j::Int64=0:Height-1
        for i::Int64=1:Width
            EPD_7IN3F_SendData(Image[i + j * Width]);
        end
    end
    EPD_7IN3F_TurnOnDisplay();
end


function EPD_7IN3F_Sleep()

    EPD_7IN3F_SendCommand(0x07);
    EPD_7IN3F_SendData(0xA5);
end




function EPD_7IN3F_Clear( color::UInt8)

   
    Width = (EPD_7IN3F_WIDTH % 2 == 0) ? (EPD_7IN3F_WIDTH / 2 ) : (EPD_7IN3F_WIDTH / 2 + 1);
    Height = EPD_7IN3F_HEIGHT;

    EPD_7IN3F_SendCommand(0x10);
    for j=1:Height 
        for  i=1:Width
            EPD_7IN3F_SendData((color<<4)|color);
        end
    end

    EPD_7IN3F_TurnOnDisplay();
end      


function DEV_SPI_WriteByte(Value)

    v = Ref{Cuchar}(Value)
    wiringPiSPIDataRW(0,v,1);

end


function EPD_7IN3F_SendCommand(Reg::UInt8)

    digitalWrite(EPD_DC_PIN, 0);
    digitalWrite(EPD_CS_PIN, 0);
    DEV_SPI_WriteByte(Reg);
    digitalWrite(EPD_CS_PIN, 1);
end


function EPD_7IN3F_SendData(Data::UInt8)

    digitalWrite(EPD_DC_PIN, 1);
    digitalWrite(EPD_CS_PIN, 0);
    DEV_SPI_WriteByte(Data);
    digitalWrite(EPD_CS_PIN, 1);
end


function EPD_7IN3F_TurnOnDisplay()

    EPD_7IN3F_SendCommand(0x04); 
    EPD_7IN3F_ReadBusyH();

    EPD_7IN3F_SendCommand(0x12); 
    EPD_7IN3F_SendData(0x0);
    EPD_7IN3F_ReadBusyH();

    EPD_7IN3F_SendCommand(0x02); 
    EPD_7IN3F_SendData(0x0);
    EPD_7IN3F_ReadBusyH();
end


function EPD_7IN3F_ReadBusyH()

   println("Read Busy H")
    while(digitalRead(EPD_BUSY_PIN)==0) 
        delay(1);
    end
    println("Release")
    
end

function EPD_7IN3F_Reset()

    digitalWrite(EPD_RST_PIN, 1);
    delay(20);
    digitalWrite(EPD_RST_PIN, 0);
    delay(2);
    digitalWrite(EPD_RST_PIN, 1);
    delay(20);
end


function EPD_7IN3F_Init()

    EPD_7IN3F_Reset();
    EPD_7IN3F_ReadBusyH();
    delay(30);

    EPD_7IN3F_SendCommand(0xAA);    
    EPD_7IN3F_SendData(0x49);
    EPD_7IN3F_SendData(0x55);
    EPD_7IN3F_SendData(0x20);
    EPD_7IN3F_SendData(0x08);
    EPD_7IN3F_SendData(0x09);
    EPD_7IN3F_SendData(0x18);

    EPD_7IN3F_SendCommand(0x01);
    EPD_7IN3F_SendData(0x3F);
    EPD_7IN3F_SendData(0x00);
    EPD_7IN3F_SendData(0x32);
    EPD_7IN3F_SendData(0x2A);
    EPD_7IN3F_SendData(0x0E);
    EPD_7IN3F_SendData(0x2A);

    EPD_7IN3F_SendCommand(0x00);
    EPD_7IN3F_SendData(0x5F);
    EPD_7IN3F_SendData(0x69);

    EPD_7IN3F_SendCommand(0x03);
    EPD_7IN3F_SendData(0x00);
    EPD_7IN3F_SendData(0x54);
    EPD_7IN3F_SendData(0x00);
    EPD_7IN3F_SendData(0x44); 

    EPD_7IN3F_SendCommand(0x05);
    EPD_7IN3F_SendData(0x40);
    EPD_7IN3F_SendData(0x1F);
    EPD_7IN3F_SendData(0x1F);
    EPD_7IN3F_SendData(0x2C);

    EPD_7IN3F_SendCommand(0x06);
    EPD_7IN3F_SendData(0x6F);
    EPD_7IN3F_SendData(0x1F);
    EPD_7IN3F_SendData(0x1F);
    EPD_7IN3F_SendData(0x22);

    EPD_7IN3F_SendCommand(0x08);
    EPD_7IN3F_SendData(0x6F);
    EPD_7IN3F_SendData(0x1F);
    EPD_7IN3F_SendData(0x1F);
    EPD_7IN3F_SendData(0x22);

    EPD_7IN3F_SendCommand(0x13);    
    EPD_7IN3F_SendData(0x00);
    EPD_7IN3F_SendData(0x04);

    EPD_7IN3F_SendCommand(0x30);
    EPD_7IN3F_SendData(0x3C);

    EPD_7IN3F_SendCommand(0x41);    
    EPD_7IN3F_SendData(0x00);

    EPD_7IN3F_SendCommand(0x50);
    EPD_7IN3F_SendData(0x3F);

    EPD_7IN3F_SendCommand(0x60);
    EPD_7IN3F_SendData(0x02);
    EPD_7IN3F_SendData(0x00);

    EPD_7IN3F_SendCommand(0x61);
    EPD_7IN3F_SendData(0x03);
    EPD_7IN3F_SendData(0x20);
    EPD_7IN3F_SendData(0x01); 
    EPD_7IN3F_SendData(0xE0);

    EPD_7IN3F_SendCommand(0x82);
    EPD_7IN3F_SendData(0x1E); 

    EPD_7IN3F_SendCommand(0x84);
    EPD_7IN3F_SendData(0x00);

    EPD_7IN3F_SendCommand(0x86);    
    EPD_7IN3F_SendData(0x00);

    EPD_7IN3F_SendCommand(0xE3);
    EPD_7IN3F_SendData(0x2F);

    EPD_7IN3F_SendCommand(0xE0);   
    EPD_7IN3F_SendData(0x00); 

    EPD_7IN3F_SendCommand(0xE6);  
    EPD_7IN3F_SendData(0x00);
    
end

function init()

    wiringPiSetupGpio()

    # Set pin modes
    pinMode(EPD_BUSY_PIN, 0);
    pullUpDnControl(EPD_BUSY_PIN, PUD_UP);
    pinMode(EPD_RST_PIN, 1);
    pinMode(EPD_DC_PIN, 1);
    pinMode(EPD_CS_PIN, 1);
    pinMode(EPD_PWR_PIN, 1);


    digitalWrite(EPD_CS_PIN, 1);
    digitalWrite(EPD_PWR_PIN, 1);

    wiringPiSPISetup(0,10000000)
        
    EPD_7IN3F_Init()

end

function shutDown()

    EPD_7IN3F_Sleep();

    delay(2000)

    # Stop power to device
    digitalWrite(EPD_CS_PIN, 0);
    digitalWrite(EPD_PWR_PIN, 0);
    digitalWrite(EPD_DC_PIN, 0);    
    digitalWrite(EPD_RST_PIN, 0);

end













