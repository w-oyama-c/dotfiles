#!/home/linuxbrew/.linuxbrew/bin/zsh

# vim: set ft=zsh ff=unix fenc=utf8 enc=utf8 expandtab ts=2 sw=2 :

sudo apt update
sudo apt upgrade -y

brew cleanup

brew update
brew upgrade

brew cleanup
brew doctor

echo
echo -e "\e[32mBegin Chocolatey upgrade processes.\e[0m"
echo
powershell -Command "Start-Process pwsh -Verb RunAs -WorkingDirectory 'C:\\Windows\\System32' -ArgumentList '-NoExit','-Command','choco upgrade all -y; Read-Host \"Press Enter to exit\"; exit'"
echo
echo -e "\e[32mDone.\e[0m"

