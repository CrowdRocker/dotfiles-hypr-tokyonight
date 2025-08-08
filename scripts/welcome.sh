#!/bin/bash
rofi -dmenu -p "✨ Welcome, Matt!" -config ~/.config/rofi/config.rasi << EOF | sh &
🔧 Open Settings
🎨 Change Theme
🎮 Launch Games (Eww)
📸 Open Darktable / GIMP
📊 System Info (btop)
🎵 Spotify
⏹️ Power Menu
EOF
