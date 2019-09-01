#! /bin/bash

DIR=$(cd `dirname $0` && pwd)

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sf $DIR/tmux/tmux.conf ~/.tmux.conf

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim/
ln -sf $DIR/vim/vimrc ~/.vimrc
ln -sf $DIR/vim/vimrc ~/.config/nvim/init.vim

mkdir -p ~/.config/kitty/
ln -sf $DIR/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -sf $DIR/kitty/macos-launch-services-cmdline ~/.config/kitty/macos-launch-services-cmdline

mkdir -p ~/.config/alacritty/
ln -sf $DIR/alacrity/alacritty.yml ~/.config/alacritty/alacritty.yml
