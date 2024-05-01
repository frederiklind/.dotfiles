#!/bin/bash

# Display ASCII art
echo -e "${GREEN}"
cat <<"EOF"

█▀▀ █▀█ █░█
█▄█ █▀▀ █▄█

EOF
echo -e "${NONE}"
echo "Please select graphics card driver:" && echo

gpu_driver=$(gum choose --limit 1 AMD "NVIDIA Proprietary Driver" "NVIDIA Nouveau Open Source Driver")
if [ "$gpu_driver" = "NVIDIA Proprietary Driver" ]; then
    echo "Installing proprietary driver..."
    # sudo pacman -S 
elif [ "$gpu_driver" = "NVIDIA Nouveau Open Source Driver" ]; then
    echo "Installing Nouveau driver..."
    # sudo pacman -S xf86-video-nouveau --noconfirm
else
    echo "Error... Exiting" && exit 1
fi

echo "Done."