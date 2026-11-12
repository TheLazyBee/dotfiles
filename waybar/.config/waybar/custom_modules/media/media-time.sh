#!/usr/bin/env bash
# Elapsed time, a 12-segment progress bar, total time. Example: 1:23 ━━━●────── 4:05
# Output is Pango markup, so "escape" must be off for this module in config.jsonc.

out=$(playerctl metadata --format '{{position}} {{mpris:length}}' 2>/dev/null) || exit 0
[ -n "$out" ] || exit 0

awk -v data="$out" 'BEGIN {
    split(data, a, " ")
    pos = a[1] / 1000000
    len = a[2] / 1000000
    if (len <= 0) exit
    if (pos > len) pos = len
    w = 12
    filled = int(pos / len * w)
    done = ""; rest = ""
    for (i = 0; i < w; i++) {
        if (i < filled) done = done "━"
        else if (i > filled) rest = rest "─"
    }
    head = (filled < w) ? "●" : ""
    printf "%d:%02d <span color=\"#ff8a1f\">%s</span><span color=\"#ffd166\">%s</span><span color=\"#4a4a54\">%s</span> %d:%02d\n", pos / 60, pos % 60, done, head, rest, len / 60, len % 60
}'
