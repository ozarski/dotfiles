if pgrep -x "kanata" > /dev/null; then
    pkill -x kanata
    notify-send "Kanata Stopped"
else
    ~/.kanata/kanata --cfg ~/.config/kanata/kanata.kbd &
    notify-send "Kanata Started"
fi
