#!/usr/bin/env bash

if command -v zscroll >/dev/null 2>&1; then
    # Scrolling title, 32 characters wide. Raise -l for a wider pill.
    exec zscroll -l 32 \
        --delay 0.25 \
        --scroll-padding "   •   " \
        --update-check true \
        "playerctl metadata --format '{{title}} - {{artist}}'" 2>/dev/null
else
    # Fallback without zscroll: static title, updates on track change
    exec playerctl --follow metadata --format '{{title}} - {{artist}}' 2>/dev/null
fi
