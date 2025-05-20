#!/bin/bash

wall_dir="${HOME}/.dotfiles/walls"
cacheDir="${HOME}/.cache/walls"
rofi_command="rofi -dmenu -theme ${HOME}/.config/rofi/scripts/wallSelect.rasi"

if [ ! -d "${cacheDir}" ] ; then
	mkdir -p "${cacheDir}"
fi

physical_monitor_size=15
monitor_res=$(hyprctl monitors |grep -A2 Monitor |head -n 2 |awk '{print $1}' | grep -oE '^[0-9]+')
monitor_res=$(( $monitor_res * $physical_monitor_size / 1 ))

rofi_override="element-icon{size:${monitor_res}px;border-radius:0px;}"

# Convert images in directory and save to cache dir
for imagen in "$wall_dir"/*.{jpg,jpeg,png,webp}; do
	if [ -f "$imagen" ]; then
		nombre_archivo=$(basename "$imagen")
		if [ ! -f "${cacheDir}/${nombre_archivo}" ] ; then
			convert -strip "$imagen" -thumbnail 500x500^ -gravity center -extent 500x500 "${cacheDir}/${nombre_archivo}"
		fi
	fi
done

# Select a picture with rofi
wall_selection=$(find "${cacheDir}"  -maxdepth 1  -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) -exec basename {} \; | sort | while read -r A ; do  echo -en "$A\x00icon\x1f""${cacheDir}"/"$A\n" ; done | $rofi_command)

[[ -n "$wall_selection" ]] || exit 1

hyprpaper_img=${wall_dir}/${wall_selection}
echo hyprpaper_img
hyprctl hyprpaper preload $hyprpaper_img
hyprctl hyprpaper wallpaper "eDP-1,$hyprpaper_img"

hyprpaper_path="$HOME/.config/hypr/hyprpaper.conf"
hyprlock_path="$HOME/.config/hypr/hyprlock.conf"

hyprpaper_string_preload="s|preload = .*|preload = $hyprpaper_img|"
hyprpaper_string="s|wallpaper = eDP-1,.*|wallpaper = eDP-1,$hyprpaper_img|"
hyprlock_string="s|path = .*|path = $hyprpaper_img|"
sed -i "$hyprpaper_string" $hyprpaper_path
sed -i "$hyprpaper_string_preload" $hyprpaper_path
sed -i "$hyprlock_string" $hyprlock_path


exit 0
