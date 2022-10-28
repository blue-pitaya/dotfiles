feh --no-fehbg --bg-fill '/home/kodus/wallpapers/simple.png'
# gifview --animate --new-window root Pictures/wallbig.gif
# xwinwrap -fs -fdt -ni -b -nf -un -o 1.0 -debug -- gifview -w WID ~/Pictures/wallbig.gif -a

# xwinwrap -ov -g 1920x1080+0+0 -- gifview -w WID /home/kodus/wallpapers/cyber-city.gif -a &
# xwinwrap -ov -g 1920x1080+1920+0 -- gifview -w WID /home/kodus/wallpapers/warm-river.gif -a &

# Disable mouse acceleration
xset m 0 0
# Repeat keys faster
xset r rate 250 50

dwmblocks &
xbindkeys --poll-rc

# Remap caps lock to escape (who really needs caps lock?)
setxkbmap -option caps:escape

# Enable numpad
numlockx &

# Start pulseaudio
pulseaudio --start --log-target=syslog

exec dwm
