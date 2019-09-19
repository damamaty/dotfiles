#!/bin/bash

mkdir ~/bin

wget https://github.com/sharkdp/bat/releases/download/v0.12.1/bat-v0.12.1-x86_64-unknown-linux-musl.tar.gz
tar xf bat-v0.12.1-x86_64-unknown-linux-musl.tar.gz

cp bat-v0.12.1-x86_64-unknown-linux-musl/bat ~/bin/bat

rm -r "bat-v0.12.1-x86_64-unknown-linux-musl.tar.gz"
rm -r "bat-v0.12.1-x86_64-unknown-linux-musl"

wget https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep-11.0.2-x86_64-unknown-linux-musl.tar.gz
tar xf ripgrep-11.0.2-x86_64-unknown-linux-musl.tar.gz

cp ripgrep-11.0.2-x86_64-unknown-linux-musl/rg ~/bin/rg

rm -r "ripgrep-11.0.2-x86_64-unknown-linux-musl.tar.gz"
rm -r "ripgrep-11.0.2-x86_64-unknown-linux-musl"

wget https://github.com/sharkdp/fd/releases/download/v7.4.0/fd-v7.4.0-x86_64-unknown-linux-musl.tar.gz
tar xf fd-v7.4.0-x86_64-unknown-linux-musl.tar.gz

cp fd-v7.4.0-x86_64-unknown-linux-musl/fd ~/bin/fd

rm -r "fd-v7.4.0-x86_64-unknown-linux-musl.tar.gz"
rm -r "fd-v7.4.0-x86_64-unknown-linux-musl"

wget https://github.com/neovim/neovim/releases/download/v0.4.2/nvim-linux64.tar.gz

tar xf nvim-linux64.tar.gz

mv nvim-linux64 ~/.nvim

rm -r "nvim-linux64.tar.gz"
