using Rsvg
using Cairo
using Colors
using Librsvg_jll

const EPD_7IN3F_BLACK  = 0x0   
const EPD_7IN3F_WHITE  = 0x1   
const EPD_7IN3F_GREEN  = 0x2  
const EPD_7IN3F_BLUE   = 0x3   
const EPD_7IN3F_RED    = 0x4   
const EPD_7IN3F_YELLOW = 0x5   
const EPD_7IN3F_ORANGE = 0x6   
const EPD_7IN3F_CLEAN  = 0x7  


struct GError
    domain::UInt32
    code::Cint
    message::Ptr{UInt8}
end



function rsvg_handle_set_stylesheet(handle::RsvgHandle, css::AbstractString)

    perr = Ref{Ptr{GError}}(C_NULL)

    ret = ccall((:rsvg_handle_set_stylesheet, librsvg), Cint,
    (RsvgHandle,Ptr{UInt8}, UInt32, Ptr{Ptr{GError}}), handle, string(css), sizeof(css), perr)

    if perr[] != C_NULL
        err = unsafe_load(perr[])
        message = unsafe_string(err.message)
        show(message)
 
    end

    return ret
end

r = Rsvg.handle_new_from_file("diagram.svg");


strings = readlines("crisp.css")

allCss = join(strings)



callResult = rsvg_handle_set_stylesheet(r,allCss)


d = Rsvg.handle_get_dimensions(r);


imageMatrix=Matrix{RGB24}(undef,800,480)
cs = Cairo.CairoImageSurface(imageMatrix);

c = Cairo.CairoContext(cs);
Cairo.set_antialias(c, 1)

Rsvg.handle_render_cairo(c,r);

#Cairo.write_to_png(cs, "test.png")

paperImage = Vector{UInt8}(undef, 800*240)

w_h = size(imageMatrix)



Width::Int64 = (w_h[1] % 2 == 0) ? (w_h[1] / 2 ) : (w_h[1] / 2 + 1);

Height::Int64 = w_h[2]

for j = 0:Height-1

    for i = 1:Width

        paperPixelValue = EPD_7IN3F_WHITE 
        paperPixelValue2 = EPD_7IN3F_WHITE 

        imagePixel = imageMatrix[(i * 2 -1) + j * Width * 2]
        imagePixel2 = imageMatrix[i * 2 + j * Width * 2]

        if (imagePixel == RGB24(1.0, 1.0, 1.0))
            paperPixelValue = EPD_7IN3F_WHITE
        elseif (imagePixel == RGB24(1.0, 0.0, 0.0))
            paperPixelValue = EPD_7IN3F_RED

        elseif (imagePixel == RGB24(0.0, 1.0, 0.0))
            paperPixelValue = EPD_7IN3F_GREEN

        elseif (imagePixel == RGB24(0.0, 0.0, 1.0))
            paperPixelValue = EPD_7IN3F_BLUE

        elseif (imagePixel == RGB24(1.0, 1.0, 0.0))
            paperPixelValue = EPD_7IN3F_YELLOW

        elseif (imagePixel == RGB24(1.0, 0.502, 0.0))

            paperPixelValue = EPD_7IN3F_ORANGE

        elseif (imagePixel == RGB24(0.0, 0.0, 0.0))

            paperPixelValue = EPD_7IN3F_BLACK

        elseif !(red(imagePixel) == green(imagePixel) == blue(imagePixel))

            paperPixelValue = EPD_7IN3F_BLACK
            
        end



        if (imagePixel2 == RGB24(1.0, 1.0, 1.0))
            paperPixelValue2 = EPD_7IN3F_WHITE
        elseif (imagePixel2 == RGB24(1.0, 0.0, 0.0))
            paperPixelValue2 = EPD_7IN3F_RED

        elseif (imagePixel2 == RGB24(0.0, 1.0, 0.0))
            paperPixelValue2 = EPD_7IN3F_GREEN

        elseif (imagePixel2 == RGB24(0.0, 0.0, 1.0))
            paperPixelValue2 = EPD_7IN3F_BLUE

        elseif (imagePixel2 == RGB24(1.0, 1.0, 0.0))
            paperPixelValue2 = EPD_7IN3F_YELLOW

        elseif (imagePixel == RGB24(1.0, 0.502, 0.0))

            paperPixelValue2 = EPD_7IN3F_ORANGE

        elseif (imagePixel2 == RGB24(0.0, 0.0, 0.0))

            paperPixelValue2 = EPD_7IN3F_BLACK

        elseif !(red(imagePixel) == green(imagePixel) == blue(imagePixel))

            paperPixelValue = EPD_7IN3F_BLACK
            
        end

    
            paperImage[i + j * Width] = ((paperPixelValue2<<4)|paperPixelValue)
     

    end


end



include("drive_waveshare_e_paper.jl")

init()

EPD_7IN3F_Display(paperImage)

shutDown()






