#!/bin/bash

. $(pwd)/vars

ESSENTIALS="${1:-no}"
if [ $ESSENTIALS = "--essentials" ]; then
    sudo apt-get update; sudo apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev
fi

if ! dpkg -s curl >> /dev/null; then
    sudo apt -y install curl 
    _log "Curl installed"
fi

if ! dpkg -s wget >> /dev/null; then
    sudo apt -y install wget 
    _log "Wget installed"
fi

if ! dpkg -s tmux >> /dev/null; then
    sudo apt -y install tmux
    _log "Tmux installed"
fi

if ! dpkg -s zsh >> /dev/null; then
    sudo apt -y install zsh
    _log "Zsh installed"
fi

which nvim >> /dev/null
if [ $? != 0 ]; then
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    sudo mv nvim.appimage /usr/share/applications
    sudo ln -s /usr/share/applications/nvim.appimage /usr/bin/nvim
    _log "Neovim installed"
fi

if ! dpkg -s universal-ctags >> /dev/null; then
    sudo apt -y install universal-ctags
    _log "Universal-ctags installed"
fi

if ! dpkg -s silversearcher-ag >> /dev/null; then
    sudo apt -y install silversearcher-ag 
    _log "The_silver_searcher installed"
fi

if ! dpkg -s ffmpeg >> /dev/null; then
    sudo apt -y install ffmpeg 
    _log "Ffmpeg installed"
fi

if ! dpkg -s youtube-dl >> /dev/null; then
    sudo apt -y install youtube-dl 
    _log "Youtube-dl installed"
fi

if ! dpkg -s gnupg >> /dev/null; then
    sudo apt -y install gnupg
    _log "GnuPG installed"
fi

if ! dpkg -s wget >> /dev/null; then
    sudo apt -y install wget
    _log "Wget installed"
fi

which kubectl >> /dev/null
if [ $? != 0 ]; then
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    sudo chmod +x kubectl
    sudo mv kubectl /usr/local/bin/
    _log "Kubectl installed"
fi

which minikube >> /dev/null
if [ $? != 0 ]; then
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
    sudo dpkg -i minikube_latest_amd64.deb
    sudo rm minikube_latest_amd64.deb
    _log "Minikube installed"
fi

which kubectx >> /dev/null
if [ $? != 0 ]; then
    curl https://raw.githubusercontent.com/ahmetb/kubectx/master/kubectx > kubectx
    curl https://raw.githubusercontent.com/ahmetb/kubectx/master/kubens > kubens
    sudo mv ./kubectx /usr/local/bin/
    sudo mv ./kubens /usr/local/bin/
    sudo chmod +x /usr/local/bin/kubectx /usr/local/bin/kubens
    _log "Kubectx & Kubens installed"
fi

if ! dpkg -s helm >> /dev/null; then
    curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
    sudo apt -y install apt-transport-https
    echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
    sudo apt update
    sudo apt -y install helm
    _log "Helm installed"
fi

which helmfile >> /dev/null
if [ $? != 0 ]; then
    wget https://github.com/roboll/helmfile/releases/download/v0.140.0/helmfile_linux_amd64
    sudo chmod +x ./helmfile_linux_amd64
    sudo mv ./helmfile_linux_amd64 /usr/local/bin/helmfile
    _log "Helmfile installed"
fi

which alacritty >> /dev/null
if [ $? != 0 ]; then
    sudo apt install cargo -y
    cargo install alacritty
    sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $HOME/.cargo/bin/alacritty 50
    _log "Alacritty installed"
fi

ls /usr/share/Postman >> /dev/null
if [ $? != 0 ]; then
    curl https://dl.pstmn.io/download/latest/linux64 --output postman.tar.gz
    tar -xvf postman.tar.gz
    sudo mv Postman /usr/share
    rm postman.tar.gz
    _log "Postman installed"
fi

if ! dpkg -s dbeaver-ce >> /dev/null; then
    wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
    sudo dpkg -i dbeaver-ce_latest_amd64.deb
    rm dbeaver-ce_latest_amd64.deb
    _log "DBeaver installed"
fi

which java >> /dev/null
if [ $? != 0 ]; then
    sudo apt -y install default-jre
    sudo apt -y install default-jdk
    _log "Java installed"
fi

if ! dpkg -s figlet >> /dev/null; then
    sudo apt -y install figlet 
    _log "Figlet installed"
fi

if ! dpkg -s cowsay >> /dev/null; then
    sudo apt -y install cowsay 
    _log "Cowsay installed"
fi

if ! dpkg -s jq >> /dev/null; then
    sudo apt -y install jq
    _log "Jq installed"
fi

if ! dpkg -s ranger >> /dev/null; then
    sudo apt -y install ranger
    _log "Ranger installed"
fi

apt list --installed | grep libpq-dev
if [ $? != 0 ]; then
    sudo apt -y install libpq-dev python3-dev
    _log "Libpq-dev & python3-dev installed"
fi

which docker >> /dev/null
if [ $? != 0 ]; then
    sudo apt -y install ca-certificates lsb-release
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo \
      "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt -y install docker-ce docker-ce-cli containerd.io
    sudo gpasswd -a $USER docker
    sudo newgrp docker
    _log "Docker installed"
fi

which lvim >> /dev/null
if [ $? != 0 ]; then
    LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh)
    mkdir -p ~/.local/share/fonts
    curl -fLo "~/.local/share/fonts/Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
fi

if ! dpkg -s i3 >> /dev/null; then
    sudo apt install i3-wm i3 i3lock -y
fi

if ! dpkg -s arandr >> /dev/null; then
    sudo apt install arandr -y
fi

if ! dpkg -s rofi >> /dev/null; then
    sudo apt install rofi -y
fi

. $(pwd)/zsh/setup.sh
. $(pwd)/asdf/setup.sh
. $(pwd)/git/setup.sh
. $(pwd)/installers/symlinks.sh
