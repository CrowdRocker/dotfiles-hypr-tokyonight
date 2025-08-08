#!/bin/bash
# install.sh - Full Hyprland + TokyoNight Setup for Matt (Crowdrocker)

echo "🚀 Installing Matt's TokyoNight Hyprland Setup..."

# === 1. Update & Install Base ===
sudo pacman -Syu --noconfirm

# Essential tools
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
    grub-customizer

# === 2. Install AUR Helper (yay) ===
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

# === 3. Install Hyprland & Tools ===
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

# === 4. Enable Services ===
sudo systemctl enable sddm bluetooth pipewire wireplumber

# === 5. Clone Your Dotfiles ===
cd ~
git clone https://github.com/Crowdrocker/dotfiles-hypr-tokyonight.git .dotfiles
mkdir -p ~/.config

# === 6. Symlink Configs ===
ln -sf ~/.dotfiles/config/hypr ~/.config/hypr
ln -sf ~/.dotfiles/config/waybar ~/.config/waybar
ln -sf ~/.dotfiles/config/rofi ~/.config/rofi
ln -sf ~/.dotfiles/config/eww ~/.config/eww
ln -sf ~/.dotfiles/config/azote ~/.config/azote
ln -sf ~/.dotfiles/config/starship.toml ~/.config/starship.toml
ln -sf ~/.dotfiles/config/gtk-3.0 ~/.config/gtk-3.0
ln -sf ~/.dotfiles/config/mako ~/.config/mako

# === 7. Set ZSH as Default Shell ===
chsh -s /bin/zsh

# === 8. Copy SDDM Theme ===
sudo mkdir -p /usr/share/sddm/themes/sugarcandy
sudo cp -r ~/.dotfiles/sddm/sugarcandy/* /usr/share/sddm/themes/sugarcandy/
sudo cp ~/.dotfiles/sddm/sddm.conf /etc/

# === 9. GRUB Theme (Optional) ===
# Use grub-customizer or manual theme
# Place TokyoNight GRUB theme in /boot/grub/themes/tokyonight

# === 10. Copy Scripts & Make Executable ===
mkdir -p ~/scripts
cp -r ~/.dotfiles/scripts/* ~/scripts/
chmod +x ~/scripts/*.sh

# === 11. Install TokyoNight GTK Theme ===
git clone https://github.com/folke/tokyonight-gtk.nvim.git /tmp/tokyonight-gtk
sudo cp -r /tmp/tokyonight-gtk/tokyonight-storm-dark ~/.themes/
nwg-look -t ~/.themes/tokyonight-storm-dark

# === 12. Set Default Terminal Colors (xfce4-terminal) ===
# Or switch to Alacritty (faster, better for Wayland)
# Config provided in dotfiles

echo "✅ Setup complete! Reboot to start."
