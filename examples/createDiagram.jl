using CairoMakie, LaTeXStrings, SpecialFunctions

function drawDiagram()

    colors=[colorant"rgb(255,0,0)", colorant"rgb(0,255,0)", colorant"rgb(0,0,255)", colorant"rgb(255,128,0)", colorant"rgb(255,255,0)"]

   
    set_theme!(Theme(palette=(color=colors,)))

    CairoMakie.to_cairo_antialias(1)
    x = 0.1:0.1:15

    fig = Figure(;px_per_unit = 1, size = (800, 480), fonts = (; regular="Arial")) 
    ax = Axis(fig[1, 1], xlabel = "x", ylabel = "Y(x)", ylabelsize = 22,
        xlabelsize = 22, xgridstyle = :dash, ygridstyle = :dash, xtickalign = 1,
        xticksize = 10, ytickalign = 1, yticksize = 10, xlabelpadding = -10, xticklabelsize = 22, yticklabelsize = 22)
    for ν in 0:3
        lines!(ax, x, bessely.(ν, x), label = "Y$(ν)(x)", linewidth = 4)
    end
    axislegend(; position = :rb, nbanks = 2, framecolor = (:black), labelsize = 22)
    ylims!(-1.8, 0.7)

    return fig
end

CairoMakie.to_cairo_antialias(1)

    fig = drawDiagram();

    Makie.save("diagram.svg", fig)









