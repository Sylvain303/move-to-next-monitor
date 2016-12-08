#!/usr/bin/env bash


. move-to-next-monitor

pos=( $(window_get_position $(get_current_window)) )
echo "pos ${pos[@]}"

# Loop through each screen and compare the offset with the window
# coordinates.
i=0
while read name width height xoff yoff
do
  echo $name $width $height $xoff $yoff
  if [ "${pos[0]}" -ge "$xoff" \
    -a "${pos[1]}" -ge "$yoff" \
    -a "${pos[0]}" -lt "$(($xoff+$width))" \
    -a "${pos[1]}" -lt "$(($yoff+$height))" ]
  then
    monitor=$name   
    break
  fi
  i=$((i + 1))
done < <(get_monitors)

# If we found a monitor, echo it out, otherwise print an error.
if [ ! -z "$monitor" ]
then
  echo $monitor $i
  exit 0
else
  echo "Couldn't find any monitor for the current window." >&2
  exit 1
fi
