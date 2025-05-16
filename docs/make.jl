using WiringPi
using Documenter, DocumenterVitepress


pages = [
    "Home" => "index.md",
    "API" => "api.md",
    "Troubleshooting" => "troubleshooting.md",
]


makedocs(; 
    sitename = "Julia WiringPi", 
    authors = "Erik Stensmo",
    modules = [WiringPi],
    warnonly = true,
    checkdocs=:all,
    format=DocumenterVitepress.MarkdownVitepress(
        repo = "github.com/stensmo/WiringPi.jl", # this must be the full URL!
 
    ),
    pages=pages,
)


DocumenterVitepress.deploydocs(; repo="github.com/stensmo/WiringPi.jl")
