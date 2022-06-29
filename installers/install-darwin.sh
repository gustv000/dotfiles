#!/bin/bash

. $(pwd)/vars

which -s xcode-select
if [[ $? != 0 ]]; then
    _log "Xcode needed before continue. Run xcode-select install"
    exit 2
fi

which -s brew
if [[ $? != 0 ]] ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    _log "Brew installed"
fi

if ! brew ls --versions tmux > /dev/null; then
    brew install tmux
    _log "Tmux installed"
fi

if ! brew ls --versions zsh > /dev/null; then
    brew install zsh
    _log "Zsh installed"
fi

if ! brew ls --versions neovim > /dev/null; then
    brew install neovim
    _log "Neovim installed"
fi

if ! brew ls --versions universal-ctags > /dev/null; then
    brew install universal-ctags
    _log "Universal-ctags installed"
fi

if ! brew ls --versions the_silver_searcher > /dev/null; then
    brew install the_silver_searcher
    _log "The_silver_searcher installed"
fi

if ! brew ls --versions ffmpeg > /dev/null; then
    brew install ffmpeg 
    _log "Ffmpeg installed"
fi

if ! brew ls --versions youtube-dl > /dev/null; then
    brew install youtube-dl 
    _log "Youtube-dl installed"
fi

if ! brew ls --versions gnupg > /dev/null; then
    brew install gnupg
    _log "GnuPG installed"
fi

if ! brew ls --versions wget > /dev/null; then
    brew install wget
    _log "Wget installed"
fi

if ! brew ls --versions kubectl > /dev/null; then
    brew install kubectl
    _log "Kubectl installed"
fi

if ! brew ls --versions minikube > /dev/null; then
    brew install minikube
    _log "Minikube installed"
fi

if ! brew ls --versions kubectx > /dev/null; then
    brew install kubectx
    _log "Kubectx installed"
fi

if ! brew ls --versions helm > /dev/null; then
    brew install helm
    _log "Helm installed"
fi

if ! brew ls --versions helmfile > /dev/null; then
    brew install helmfile
    _log "Helmfile installed"
fi

if [ ! -d "/Applications/Alacritty.app" ]; then
    brew install alacritty
    _log "Alacritty installed"
fi

if [ ! -d "/Applications/DBeaver.app" ]; then
    brew install dbeaver-community
    _log "DBeaver installed"
fi

if [ ! -d "/usr/local/opt/openjdk" ]; then
    brew tap adoptopenjdk/openjdk && \
    brew install java && \
    brew install adoptopenjdk8
    _log "Java installed"
fi

if ! brew ls --versions figlet > /dev/null; then
    brew install figlet 
    _log "Figlet installed"
fi

if ! brew ls --versions cowsay > /dev/null; then
    brew install cowsay 
    _log "Cowsay installed"
fi

if ! brew ls --versions jq > /dev/null; then
    brew install jq
    _log "Jq installed"
fi

if ! brew ls --versions ranger > /dev/null; then
    brew install ranger
    _log "Ranger installed"
fi

if ! brew ls --versions postgresql > /dev/null; then
    brew install postgresql
    _log "Postgresql installed"
fi

. $(pwd)/zsh/setup.sh
. $(pwd)/asdf/setup.sh
. $(pwd)/git/setup.sh
. $(pwd)/installers/symlinks.sh
