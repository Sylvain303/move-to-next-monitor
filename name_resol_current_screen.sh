#!/bin/bash
# from: http://superuser.com/questions/603528/how-to-get-the-current-monitor-resolution-or-monitor-name-lvds-vga1-etc

## Get screen info
## displays
#LVDS-1 connected primary 1366x768+0+418 (normal left inverted right x axis y axis) 309mm x 174mm
#VGA-1 connected 1280x1024+1366+0 (normal left inverted right x axis y axis) 376mm x 301mm
screen1=($(xrandr | awk -F'[ +]' '/ connected / {print $1,$3,$4}' | head -n 1))
screen2=($(xrandr | awk -F'[ +]' '/ connected / {print $1,$3,$4}' | tail -n 1))

# there's a primary keyword on the 'first' monitor…

## Figure out which screen is to the right of which
if [ ${screen1[2]} -eq 0  ]
then
    right=(${screen2[@]});
    left=(${screen1[@]});
else
    right=(${screen1[@]});
    left=(${screen2[@]});
fi

## Get window position
pos=$(xwininfo -id $(xdotool getactivewindow) | grep "Absolute upper-left X" | 
      awk '{print $NF}')

## Which screen is this window displayed in? If $pos
## is greater than the offset of the rightmost screen,
## then the window is on the right hand one
if [ "$pos" -gt "${right[2]}" ]
then
    echo "${right[0]} : ${right[1]}"    
else
    echo "${left[0]} : ${left[1]}"    
fi
