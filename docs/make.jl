using MojiMoji
using Documenter

DocMeta.setdocmeta!(MojiMoji, :DocTestSetup, :(using MojiMoji); recursive=true)

makedocs(;
    modules=[MojiMoji],
    authors="Satoshi Terasaki <terasakisatoshi.math@gmail.com> and contributors",
    repo="https://github.com/terasakisatoshi/MojiMoji.jl/blob/{commit}{path}#{line}",
    sitename="MojiMoji.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://terasakisatoshi.github.io/MojiMoji.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/terasakisatoshi/MojiMoji.jl",
    devbranch="main",
)
