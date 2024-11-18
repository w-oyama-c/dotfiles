#!/home/linuxbrew/.linuxbrew/bin/zsh

# vim: set ft=zsh ff=unix fenc=utf8 enc=utf8 expandtab ts=2 sw=2 :

apt update
apt upgrade -y

sudo -i -u w-oyama brew cleanup

sudo -i -u w-oyama brew update
sudo -i -u w-oyama brew upgrade

sudo -i -u w-oyama brew cleanup
sudo -i -u w-oyama brew doctor
