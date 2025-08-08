#!/bin/bash
# install.sh - Crowdrocker's TokyoNight Hyprland Setup
# For: Gaming, Streaming, Photography, and Style
# Inspired by JaKooLit & ML4W | Credit: https://github.com/JaKooLit, https://github.com/ML4W

echo "🚀 Installing Crowdrocker's TokyoNight Hyprland Setup..."

# === 1. Update System ===
sudo pacman -Syu --noconfirm

# === 2. Install Core Tools ===
sudo pacman -S --noconfirm \
    git base-devel neofetch fastfetch htop btop zsh \
    xdg-user-dirs xdg-utils polkit-gnome \
    pipewire pipewire-pulse pipewire-alsa pipewire-jack \
    wireplumber pavucontrol \
    ttf-nerd-fonts-symbols ttf-fira-code noto-fonts-emoji \
    grim slurp wl-clipboard mako \
    thunar thunar-archive-plugin gvfs \
    bluez bluez-utils blueman \
    ntfs-3g dosfstools \
    grub-customizer \
    alacritty

# === 3. Install AUR Helper (yay) ===
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ~

# === 4. Install Hyprland & Tools ===
yay -S --noconfirm \
    hyprland \
    waybar-hyprland-git \
    rofi-lbonn-wayland-git \
    nwg-look \
    sddm-sugar-candy-git \
    gamescope \
    gamemode \
    vkmark \
    fastfetch \
    starship \
    zram-generator \
    azote \
    eww-wayland

# === 5. Enable Services ===
sudo systemctl enable sddm bluetooth pipewire wireplumber

# === 6. Clone Dotfiles ===
git clone https://github.com/Crowdrocker/dotfiles-hypr-tokyonight.git ~/.dotfiles

# === 7. Create Config Symlinks ===
mkdir -p ~/.config
ln -sf ~/.dotfiles/config/hypr ~/.config/hypr
ln -sf ~/.dotfiles/config/waybar ~/.config/waybar
ln -sf ~/.dotfiles/config/rofi ~/.config/rofi
ln -sf ~/.dotfiles/config/eww ~/.config/eww
ln -sf ~/.dotfiles/config/azote ~/.config/azote
ln -sf ~/.dotfiles/config/gtk-3.0 ~/.config/gtk-3.0
ln -sf ~/.dotfiles/config/mako ~/.config/mako
ln -sf ~/.dotfiles/config/starship.toml ~/.config/starship.toml

# === 8. Scripts Setup ===
mkdir -p ~/scripts
cp -r ~/.dotfiles/scripts/* ~/scripts/
chmod +x ~/scripts/*.sh

# === 9. SDDM Theme ===
sudo mkdir -p /usr/share/sddm/themes/sugarcandy
sudo cp -r ~/.dotfiles/themes/sugarcandy/* /usr/share/sddm/themes/sugarcandy/
sudo cp ~/.dotfiles/config/sddm/sddm.conf /etc/

# === 10. GTK Theme: TokyoNight Storm Dark ===
git clone https://github.com/folke/tokyonight-gtk.nvim.git /tmp/tokyonight-gtk
sudo cp -r /tmp/tokyonight-gtk/tokyonight-storm-dark /usr/share/themes/
nwg-look -t tokyonight-storm-dark

# === 11. Set ZSH & Starship ===
chsh -s /bin/zsh
echo 'eval "$(starship init zsh)"' >> ~/.zshrc

# === 12. Launch Eww on Startup (add to Hyprland later) ===
echo "✅ Installation complete! Reboot and enjoy."
echo "💡 First boot: Run 'nwg-look' to confirm theme, and 'azote' for wallpaper."
