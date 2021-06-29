#!/bin/bash
echo "╓Dotfiles setup"

source $(pwd)/vars

which -s xcode-select
if [[ $? != 0 ]]; then
    echo "Xcode needed before continue. Run xcode-select install"
    exit 2
fi

which -s brew
if [[ $? != 0 ]] ; then
    echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "╠═Brew installed"
fi

if ! brew ls --versions tmux > /dev/null; then
    brew install tmux
    echo "╠═Tmux installed"
fi

if ! brew ls --versions zsh > /dev/null; then
    brew install zsh
    echo "╠═Zsh installed"
fi

if ! brew ls --versions neovim > /dev/null; then
    brew install neovim
    echo "╠═Neovim installed"
fi

if ! brew ls --versions universal-ctags > /dev/null; then
    brew install universal-ctags
    echo "╠═Universal-ctags installed"
fi

if ! brew ls --versions the_silver_searcher > /dev/null; then
    brew install the_silver_searcher
    echo "╠═The_silver_searcher installed"
fi

if ! brew ls --versions ffmpeg > /dev/null; then
    brew install ffmpeg 
    echo "╠═Ffmpeg installed"
fi

if ! brew ls --versions youtube-dl > /dev/null; then
    brew install youtube-dl 
    echo "╠═Youtube-dl installed"
fi

if ! brew ls --versions gnupg > /dev/null; then
    brew install gnupg
    echo "╠═GnuPG installed"
fi

if ! brew ls --versions wget > /dev/null; then
    brew install wget
    echo "╠═Wget installed"
fi

if [ ! -d "/Applications/Alacritty.app" ]; then
    brew install alacritty
    echo "╠═Alacritty installed"
fi

if [ ! -d "/Applications/DBeaver.app" ]; then
    brew install dbeaver-community
    echo "╠═DBeaver installed"
fi

if [ ! -d "/usr/local/opt/openjdk" ]; then
    brew tap adoptopenjdk/openjdk && \
    brew install java && \
    brew install adoptopenjdk8
    echo "╠═Java installed"
fi

if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "╠═Plug vim installed for vim"
fi

if [ ! -f "$HOME/.local/share/nvim/site/autoload/plug.vim" ]; then
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    echo "╠═Plug vim installed for nvim"
fi

echo "║"
sh $(pwd)/zsh/setup.sh
echo "║"
sh $(pwd)/asdf/setup.sh
echo "║"
sh $(pwd)/git/setup.sh
echo "║"
sh $(pwd)/symlinks.sh
echo "║"

echo "╙Dotfiles finished"
