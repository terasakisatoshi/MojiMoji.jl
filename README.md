# MojiMoji [![Build Status](https://github.com/terasakisatoshi/MojiMoji.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/terasakisatoshi/MojiMoji.jl/actions/workflows/CI.yml?query=branch%3Amain) [![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://terasakisatoshi.github.io/MojiMoji.jl/stable/) [![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://terasakisatoshi.github.io/MojiMoji.jl/dev/)

# 概要

DemoCards.jl を使うためのサンプルパッケージ. MojiMoji モジュールが特段何かをするわけではない.

# Usage

Julia と LiveServer.jl をインストールする必要がある. 後者は Julia パッケージの一つである. `julia -e 'using Pkg; Pkg.add("LiveServer")'` とすれば導入できる.

```console
$ git clone https://github.com/terasakisatoshi/MojiMoji.jl.git
$ cd MojiMoji.jl
$ make web
```

`make web` は, `Makefile` を見ればわかるように, 下記を実行している:

```
julia --project=docs -e 'using Pkg; Pkg.develop(PackageSpec(path=pwd())); \
        Pkg.instantiate(); \
        include("docs/make.jl"); \
        using LiveServer; servedocs(host="0.0.0.0"); \
        '
```

# コンテナを使った場合

このリポジトリでは Docker, Docker Compose による実行方法も提供している. つまり，ローカル環境で Julia のセットアップが億劫な人向けである:


```console
$ git clone https://github.com/terasakisatoshi/MojiMoji.jl.git
$ cd MojiMoji.jl
$ make
$ docker-compose up web
```

下記のような出力を得たら `http://0.0.0.0:8000/` にアクセスする.

```
mojimojijl-packagedocs  | [ Info: Listening on: 0.0.0.0:8000, thread id: 1
mojimojijl-packagedocs  | ✓ LiveServer listening on http://0.0.0.0:8000/ ...
mojimojijl-packagedocs  |   (use CTRL+C to shut down)

```

