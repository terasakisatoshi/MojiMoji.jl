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

## ローカル環境でドキュメントの閲覧できるか確認

下記を実行する

```
$ cd path/to/MojiMoji.jl
$ julia --project=docs/ -e 'using Pkg; Pkg.develop(PackageSpec(path=pwd())); Pkg.instantiate()'
$ julia --project=docs/ docs/make.jl
```

`localhost:8000` にアクセスして適当なWebページが確認できれば成功だ.

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

`docs/myexamples` というデモ用のファイルを格納するディレクトリを作る. このディレクトリ直下に `index.md` を作成する. 

### `index.md` の作成

この `index.md` というファイルの中には `{{{democards}}}` という文字を挿入する必要がある. この `波括弧 {}` で囲む文法はテンプレートエンジン [Mustache.jl](https://github.com/jverzani/Mustache.jl) を利用するためのものである. 実際, DemoCards.jl はデモカードを生成する際にこのテンプレートエンジンを使っている. ユーザーはとりあえずそういうものを入れれば良い程度の感覚を持っていれば良い. ちなみにこのテンプレートエンジンは PkgTemplates.jl でも採用されている.

## `docs/make.jl` の更新

下記のように `docs/make.jl` を更新する.

```julia
using MojiMoji
using DemoCards
using Documenter

DocMeta.setdocmeta!(MojiMoji, :DocTestSetup, :(using MojiMoji); recursive=true)

myexamples, myexamples_cb, myexamples_assets = makedemos("myexamples")
assets = collect(filter(x->!isnothing(x), Set([myexamples_assets])))

makedocs(;
    modules=[MojiMoji],
    authors="<YourName> <YourEmail> and contributors",
    repo="https://github.com/<YourGitHubAccount>/MojiMoji.jl/blob/{commit}{path}#{line}",
    sitename="MojiMoji.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://<YourGitHubAccount>.github.io/MojiMoji.jl",
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
    repo="github.com/<YourGitHubAccount>/MojiMoji.jl",
    devbranch="main",
)
```


`julia --project=docs/ docs/make.jl` を実行する. 読者が私の MojiMoji.jl を見ている場合は `make web` とすればコンテナ環境でサーバーを立てて `http://0.0.0.0:8000/myexamples/index.html` にアクセスすると Demos というページが生成されているはずだ.


```@index
```

```@autodocs
Modules = [MojiMoji]
```
