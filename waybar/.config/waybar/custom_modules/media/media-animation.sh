#!/usr/bin/env bash
# Equalizer: 5 bars that drift up and down, colored orange -> gold.
# Pause icon when paused, nothing when no player is running.
# Output is Pango markup, so don't set "escape" on this module.

bars=(▁ ▂ ▃ ▄ ▅ ▆ ▇ █)
colors=(ff6a00 ff8a1f ffa63d ffbe55 ffd166)
h=(2 4 6 4 2)
pause_icon=$(printf '\xef\x81\x8c')   # U+F04C, Font Awesome pause
tick=0
status=""

while :; do
    # Ask the player once per second, not on every frame
    if (( tick % 8 == 0 )); then
        status=$(playerctl status 2>/dev/null)
    fi
    ((tick++))

    if [[ $status == "Playing" ]]; then
        out=""
        for i in "${!colors[@]}"; do
            (( h[i] += RANDOM % 3 - 1 ))
            (( h[i] < 0 )) && h[i]=0
            (( h[i] > 7 )) && h[i]=7
            out+="<span color='#${colors[i]}'>${bars[h[i]]}</span>"
        done
        echo "$out"
    elif [[ $status == "Paused" ]]; then
        echo "<span color='#85828c'>${pause_icon}</span>"
    else
        echo ""
    fi
    sleep 0.12
done
