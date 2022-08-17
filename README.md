# dotfiles

My dotfiles for macOS and Linux development environment.
macOS will install everything with brew.

Edit vars file:
```sh
cp vars.example vars
vim vars
```

Execute install:
```sh
./install
```

For linux, if is needed to install essential libs:
```sh
./install --essentials
```

Installs:
- i3wm (debian)
- tmux
- zsh
- neovim
- universal-ctags
- the_silver_searcher
- ffmpeg
- youtube-dl
- gnupg
- wget
- kubectl
- minikube
- kubectx
- helm
- helmfile
- alacritty
- dbeaver
- java (8 & latest)
- jq
- ranger (file manager)
- plug.vim
- oh-my-zsh
- asdf (go, node, python)
