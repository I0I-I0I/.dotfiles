#!/usr/bin/env bash

acpi_o=$(acpi -b 2>/dev/null)
if [[ $acpi_o =~ Charging ]]; then
    cap=$(echo "$acpi_o" | awk -F', ' '{print $2}' | sed 's/%//')
    icons=(󰢜 󰂆 󰂇 󰂈 󰢝 󰂉 󰢞 󰂊 󰂋 󰂅)
    index=$(( cap / 10 ))
    (( index > 10 )) && index=10
    icon="${icons[index]}"
elif [[ $acpi_o =~ Discharging ]]; then
    cap=$(echo "$acpi_o" | awk -F', ' '{print $2}' | sed 's/%//')
    icons=(󰂃 󰁻 󰁼 󰁽 󰁾 󰁿 󰂀 󰂁 󰂂 󰁹)
    index=$(( cap / 10 ))
    (( index > 10 )) && index=10
    icon="${icons[index]}"
elif [[ $acpi_o =~ "Full" ]]; then
    icon="󰁹"
else
    icon=""
fi

time_left=$(echo "$acpi_o" | awk -F', ' '{print $3}')
cap=$(echo "$acpi_o" | awk -F', ' '{print $2}')
printf " %s %s \n" "$cap" "$icon"
