#!/bin/bash

LIVEUSER="live"

if [ "$USER" = "$LIVEUSER" ]; then
   # Disable screen blank / power saving for live session
   hyprctl --batch 'keyword misc:vfr 0' 2>/dev/null || true
   sleep 2
   pkexec calamares
else
   rm -rf ~/.config/autostart/start.desktop 2>/dev/null || true
fi
