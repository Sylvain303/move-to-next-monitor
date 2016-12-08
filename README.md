# move-to-next-monitor

Script to move windows from one monitor to the next in Xubuntu

Even though I don't use Xubuntu anymore, people are still interested
in this script. Sweet! Glad it can help others.

I mapped `ctrl+alt+n` to exectute this script.

## Install

```
wget https://raw.githubusercontent.com/jc00ke/move-to-next-monitor/master/move-to-next-monitor
chmod +x move-to-next-monitor
mv move-to-next-monitor /somewhere/in/your/$PATH
```

## Usage

move the active window to the next monitor
```
move-to-next-monitor
```
move the given window_id
```
move-to-next-monitor $window_id
```

show computed move coordinate of the given window_id
```
move-to-next-monitor show_move $window_id
```

move the given window_id to the given monitor
```
move-to-next-monitor $window_id $monitor
```

list detected monitor
```
move-to-next-monitor list_monitors
```

## LICENSE

## Code of Conduct

[We have one](code_of_conduct.md), and you're expected to follow it.

## Support

Since I don't use Xubuntu and therefore don't have a way to test changes, I'm going to rely on others to QA and give me feedback.

## Thanks

* [icyrock](http://icyrock.com/blog/2012/05/xubuntu-moving-windows-between-monitors/) post for initial development
* [@jordansissel](https://github.com/jordansissel) for his excellent [xdotool](https://github.com/jordansissel/xdotool)

## Refs
* http://stackoverflow.com/questions/18360569/how-do-you-run-an-application-in-bash-and-select-which-monitor-it-runs-on
* http://unix.stackexchange.com/questions/14159/how-do-i-find-the-window-dimensions-and-position-accurately-including-decoration
