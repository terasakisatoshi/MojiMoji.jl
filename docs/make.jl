using MojiMoji
using DemoCards
using Documenter

DocMeta.setdocmeta!(MojiMoji, :DocTestSetup, :(using MojiMoji); recursive=true)

myexamples, myexamples_cb, myexamples_assets = makedemos("myexamples")
assets = collect(filter(x->!isnothing(x), Set([myexamples_assets])))

makedocs(;
    modules=[MojiMoji],
    authors="Satoshi Terasaki <terasakisatoshi.math@gmail.com> and contributors",
    repo="https://github.com/terasakisatoshi/MojiMoji.jl/blob/{commit}{path}#{line}",
    sitename="MojiMoji.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://terasakisatoshi.github.io/MojiMoji.jl",
        edit_link="main",
        assets=assets,
    ),
    pages=[
        "Home" => "index.md",
        myexamples,
    ],
)

myexamples_cb()

deploydocs(;
    repo="github.com/terasakisatoshi/MojiMoji.jl",
    devbranch="main",
)
