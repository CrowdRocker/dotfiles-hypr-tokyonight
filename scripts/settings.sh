#!/bin/bash
rofi -dmenu -p "⚙️ Settings" -config ~/.config/rofi/config.rasi << EOF | sh &
🌓 Switch Waybar Theme
⌨️ View Keybinds (Hyprland)
🎮 Toggle GameMode
💾 ZRAM Status
🌐 Network Tools
🎨 GTK Theme (nwg-look)
EOF
