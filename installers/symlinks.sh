#!/bin/bash

_log "Symlinks setup"

if [ ! -d "$HOME/.config" ]; then
    mkdir $HOME/.config
fi

if [ ! -d "$HOME/.config/ranger" ]; then
    mkdir $HOME/.config/ranger
fi

if [ ! -d "$HOME/.config/nvim" ]; then
    mkdir $HOME/.config/nvim
    _log "Created nvim folder"
fi

if [ ! -f "$HOME/.gitconfig" ]; then
    ln -s $(pwd)/git/.gitconfig $HOME/.gitconfig
    _log "Created gitconfig link"
fi

if [ ! -f "$HOME/.vimrc" ]; then
    ln -s $(pwd)/vim/.vimrc $HOME/.vimrc
    _log "Created vimrc link"
fi

if [ ! -f "$HOME/.config/nvim/coc-settings.json" ]; then
    ln -s $(pwd)/vim/coc-settings.json $HOME/.config/nvim/coc-settings.json
    _log "Created coc settings link"
fi

if [ ! -f "$HOME/.config/nvim/init.vim" ]; then
    ln -s $(pwd)/vim/.vimrc $HOME/.config/nvim/init.vim
    _log "Created init.vim link"
fi

if [ ! -f "$HOME/.tmux.conf" ]; then
    ln -s $(pwd)/tmux/.tmux.conf $HOME/.tmux.conf
    _log "Created tmux.conf link"
fi

if [ "$(uname -s)" = "Linux" ]; then
    if [ ! -f "$HOME/.config/i3/config" ]; then
	mkdir -p $HOME/.config/i3
	ln -s $(pwd)/i3/config $HOME/.config/i3/config
	_log "Created i3 config link"
    fi

    if [ ! -f "$HOME/.config/i3status/config" ]; then
	mkdir -p $HOME/.config/i3status
	ln -s $(pwd)/i3/bar-config $HOME/.config/i3status/config
	_log "Created i3 bar config link"
    fi

    if [ ! -f "$HOME/.screenlayout/default.sh" ]; then
	mkdir -p $HOME/.screenlayout
	ln -s $(pwd)/i3/screenlayout.sh $HOME/.screenlayout/default.sh
	_log "Created screenlayout.sh link"
    fi

    if [ ! -f "/usr/share/applications/alacritty.desktop" ]; then
	sudo ln -s $(pwd)/applications/alacritty.desktop /usr/share/applications/alacritty.desktop
	_log "Created alacritty.desktop link"
    fi

    if [ ! -f "/usr/share/applications/postman.desktop" ]; then
	sudo ln -s $(pwd)/applications/postman.desktop /usr/share/applications/postman.desktop
	_log "Created postman.desktop link"
    fi
fi

if [ "$(uname -s)" = "Darwin" ]; then
    if [ ! -d "/Library/Java/JavaVirtualMachines/openjdk.jdk" ]; then
	sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
	_log "Created openjdk link"
    fi
fi

if [ ! -f "$HOME/.config/ranger/rc.conf" ]; then
    ln -s $(pwd)/ranger/rc.conf $HOME/.config/ranger/rc.conf
    _log "Created ranger config link"
fi

_log "Symlinks finished"
