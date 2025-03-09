#!/bin/bash
# # Get the current mode from Sway
CURRENT_MODE=$(swaymsg -t get_binding_state | jq -r '.name')
STATE=""
# # Determine the icon based on the mode
case "$CURRENT_MODE" in
    "default")
        STATE="{
            \"text\": \"Default Mode\",
            \"alt\": \"$CURRENT_MODE\", 
            }"
        ;;
    "resize")
        STATE="{
            \"text\": \"Resize Mode\",
            \"alt\": \"$CURRENT_MODE\", 
            }"
        ;;
    "mouse")
        STATE="{
            \"text\": \"Mouse Mode\",
            \"alt\": \"$CURRENT_MODE\", 
            }"
        ;;
    *)
        # Fallback icon for unknown modes
        STATE="{
            \"text\": \"Unknown Mode\",
            \"alt\": \"unknown\", 
            }"
        ;;
esac

# Output JSON for Waybar
echo $STATE
