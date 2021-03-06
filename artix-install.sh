#!/bin/sh

# Refresh repositories
sudo pacman -Sy

# Fix keyring
sudo pacman -S --noconfirm artix-keyring
sudo pacman -S --noconfirm archlinux-keyring
sudo pacman -S --noconfirm artix-keyring

# Install deps
sudo pacman -S --noconfirm --needed \
base \
base-devel \
git \
xorg \
vim \
zsh \
awesome \
wget \
curl \
compton \
gtk2 \
gtk3 \
termite \
rofi \
slock \
arc-gtk-theme \
maim \
i3lock-color \
imagemagick \
scrot \
lm_sensors \
$(pacman -Ssq ttf-) \
zsh-syntax-highlighting \
xorg-xinit \
lightdm \
lightdm-gtk-greeter

# Obtain files
git clone https://github.com/iamsaalim/lightweight-desktop ~/.kat
cd ~/.kat 
wget -q https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh
mv install.sh ohmyz.sh
mkdir ~/.config
echo "bureau" > ~/.config/zsh_theme
touch ~/.config/zsh_config

# Modify files
cp agetty-tty7/conf.gen agetty-tty7/conf
sed -i s/Stykers/$(whoami)/g agetty-tty7/conf
cp awesome/theme/theme.gen.lua awesome/theme/theme.lua

# Symlink package
systemctl enable lightdm

# Install OhMyZsh
sh ohmyz.sh --unattended >> /dev/null

# Print warnings
echo "================================================="
echo "To use the Email widget, find the Main SMTP Check"
echo "section in theme/theme.lua, uncomment it and fill"
echo "in your details."
echo "================================================="

# Setup system links
sudo ln -sf /etc/runit/sv /etc/sv
sudo ln -sf /var/run/runit/service /var/service
sudo ln -sf $HOME/.kat/agetty-tty7 /etc/sv/
sudo ln -sf /etc/sv/agetty-tty7 /var/service/
sudo ln -sf $HOME/.kat/Phoeton /usr/share/icons/Phoeton
sudo ln -sf $HOME/.kat/profile.sh /etc/profile.d/Kat.sh

# Setup user links
mkdir ~/.config/gtk-3.0
ln -sf ~/.kat/awesome ~/.config/awesome
ln -sf ~/.kat/compton.conf ~/.config/compton.conf
ln -sf ~/.kat/gtkrc ~/.config/gtkrc
ln -sf ~/.kat/gtkrc-2.0 ~/.config/gtkrc-2.0
ln -sf ~/.kat/termite ~/.config/termite
ln -sf ~/.kat/xinitrc ~/.xinitrc
ln -sf ~/.kat/Xresources ~/.Xresources
ln -sf ~/.kat/zshrc ~/.zshrc
ln -sf ~/.kat/gtk-settings.ini ~/.config/gtk-3.0/settings.ini
ln -sf ~/.kat/gtk.css ~/.config/gtk-3.0/gtk.css

# Change shell
sudo chsh -s /bin/zsh $(whoami)

# Tell user to reboot and exit
echo "================================================="
echo "Installation finished! Please reboot the system."
echo "================================================="
exit 0

