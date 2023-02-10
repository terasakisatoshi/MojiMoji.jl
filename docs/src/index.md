```@meta
CurrentModule = MojiMoji
```

# MojiMoji

Documentation for [MojiMoji](https://github.com/terasakisatoshi/MojiMoji.jl).

# Welcome to MojiMoji.jl

# MojiMoji.jl とは

[DemoCards.jl](https://github.com/JuliaDocs/DemoCards.jl) と呼ばれるデモ作成を支援するパッケージを使ったサンプルパッケージである．

# Why MojiMoji

デモのデモなのでメタい感じがする. でもでも・・・って言ってると恥ずかしがってもじもじする様子を連想するのでこの名前を使った．

# 試す.

## `docs/make.jl` の初期化

PkgTemplates.jl などで `MojiMoji.jl` パッケージを作ると下記のような `docs/make.jl` が得られる.

```julia
using MojiMoji
using Documenter

DocMeta.setdocmeta!(MojiMoji, :DocTestSetup, :(using MojiMoji); recursive=true)

makedocs(;
    modules=[MojiMoji],
    authors="YourName <YourEmail> and contributors",
    repo="https://github.com/<YourGitHubAccount>/MojiMoji.jl/blob/{commit}{path}#{line}",
    sitename="MojiMoji.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://<YourGitHubAccount>.github.io/MojiMoji.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/<YourGitHubAccount>/MojiMoji.jl",
    devbranch="main",
)
```

`<YourGitHubAccount>`, `<YourEmail>` などは各自の環境に依存する．適宜読み替えてほしい. 我々はこの雛形を初期状態として DemoCards の機能を使うために `docs/make.jl` を編集する.

## DemoCards の追加

`docs` ディレクトリはドキュメントを作成するためのプロジェクトになっている. そのプロジェクトの依存関係として DemoCards.jl を追加する:

```console
$ cd path/to/MojiMoji.jl # MojiMoji パッケージの直下に移動
$ julia --project=docs/ -e 'using Pkg; Pkg.add("DemoCards")'
```

下記のように `docs/Project.toml` 内に DemoCards パッケージが追加されることを確認する.

```console
$ cat docs/Project.toml
[deps]
DemoCards = "311a05b2-6137-4a5a-b473-18580a3d38b5"
Documenter = "e30172f5-a6a5-5a46-863b-614d45cd2de4"
MojiMoji = "<YourPkgUUID>"
```

`<YourPkgUUID>` の部分は各自の環境に依存する.

## Demo 用のファイルを格納するディレクトリの作成

`docs/myexamples` というデモ用のファイルを格納するディレクトリを作る. このディレクトリ直下に `index.md` を作成する. この `index.md` というファイルの中には `{{{` の次に `democards`, `}}}` が続く文字列が格納されている必要がある.

`{{{democards}}}`

```@index
```

```@autodocs
Modules = [MojiMoji]
```
