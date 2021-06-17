# dotfiles

My dotfiles for macOS development environment.

Edit vars file:
```sh
cp vars.example vars
vim vars
```

Execute install:
```sh
sh install.sh
```

- xcode
- brew
    - zsh
    - neovim
    - universal-ctags
    - the_silver_searcher
    - ffmpeg
    - youtube-dl
    - alacritty
- plug.vim
- oh-my-zsh
- asdf (go, node, python)

Installs:
```
╓Dotfiles setup
║
╠═Xcode installed
╠═Brew installed
╠═Zsh installed
╠═Neovim installed
╠═Universal-ctags installed
╠═The_silver_searcher installed
╠═Ffmpeg installed
╠═Youtube-dl installed
╠═Alacritty installed
╠═Plug vim installed for vim
╠═Plug vim installed for nvim
║
╠═╦═ZSH setup
║ ╠═Oh My ZSH installed
║ ╠═Syntax highlight installed
║ ╠═Autosuggestions installed
║ ╠═Fzf installed
║ ╠═Created .zshrc link
╠═╩═ZSH finished
║
╠═╦═Asdf setup
║ ╠═Asdf installed
║ ╠═Nodejs plugin added
║ ╠═Python plugin added
║ ╠═Golang plugin added
╠═╩═Asdf finished
║
╠═╦═Git setup
║ ╠═User: Gustavo
║ ╠═Email: test@gmail.com
║ ╠═Config file created in /Users/gustavo/dev/dotfiles/git/.gitconfig
╠═╩═Git finished
║
╠═╦═Symlinks setup
║ ╠═Created nvim folder
║ ╠═Created gitconfig link
║ ╠═Created vimrc link
║ ╠═Created init.vim link
╠═╩═Symlinks finished
║
╙Dotfiles finished
```
