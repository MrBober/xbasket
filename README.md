# X basket
X basket lets you minimize and maximize windows in X11. 

## Install
Put the script in some directory listed in your `$PATH`.

## Usage
```
Usage: xbasket <command> <args>

Commands:
  help - display help
  hide - hide active window if no arguments are given
         otherwise hide a window with given id
  show - show a minimized window with given id
  select - display a list of minimized windows and select one
```
You can set variable `DMENU` to for example `rofi -dmenu` if instead of `dmenu` you want to use `rofi`.
