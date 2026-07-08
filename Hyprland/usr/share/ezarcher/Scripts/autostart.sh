#!/bin/bash

LIVEUSER="live"

if [ "$USER" = "$LIVEUSER" ]; then
   sleep 2
   sudo calamares
else
   rm -rf ~/.config/autostart/start.desktop 2>/dev/null || true
fi
