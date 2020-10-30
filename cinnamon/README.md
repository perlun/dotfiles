# cinnamon

Here are some details about my Cinnamon setup:

- [My personal Cinnamon theme](https://github.com/perlun/perlun-cinnamon-theme)
  is nothing incredibly spectacular, but I like it and use it on all my Cinnamon
  desktops (at work, on the laptop, on my home desktop etc.). It's a modified
  version of the (dark) Adapta Nokto theme.

## Personal `dconf` settings

(`dconf dump /` or `gsettings list-recursively`  gives you all your settings, or `gsettings list-recursively org.cinnamon.desktop.keybindings.wm` to list a particular scheme. Run this on two machines and `diff -u <file1> <file2>` to get a rough idea of what settings you have tweaked.)

```shell
# Enable Swedish and US keyboard layouts
gsettings set org.gnome.libgnomekbd.keyboard layouts "['se', 'us']"

# Enables quick switching of keyboard layouts using Caps Lock. (incredibly useful
# to be able to chat in Swedish and do programming with a US-centric layout)
gsettings set org.gnome.libgnomekbd.keyboard options "['grp\tgrp:caps_toggle']"

# Set a beautiful desktop background
gsettings set org.cinnamon.desktop.background picture-uri 'file:///usr/share/desktop-base/softwaves-theme/lockscreen/gnome-background.xml'

# Enables date display
gsettings set org.cinnamon.desktop.interface clock-show-date true

# Sets workspace names (this one needs a cinnamon restart to take effect)
gsettings set org.cinnamon.desktop.wm.preferences workspace-names "['Work', 'Communication', 'Private']"

# Removes some default key bindings, to free up these for application usage.
gsettings set org.cinnamon.desktop.keybindings.wm begin-move "@as []"
gsettings set org.cinnamon.desktop.keybindings.wm begin-resize "@as []"
gsettings set org.cinnamon.desktop.keybindings.wm switch-panels "@as []"
gsettings set org.cinnamon.desktop.keybindings.wm toggle-maximized "@as []"
gsettings set org.cinnamon.desktop.keybindings.wm toggle-recording "@as []"
gsettings set org.cinnamon.desktop.keybindings.wm unmaximize "@as []"

gsettings set org.cinnamon.desktop.keybindings.media-keys area-screenshot "@as []"
gsettings set org.cinnamon.desktop.keybindings.media-keys area-screenshot-clip "@as []"
gsettings set org.cinnamon.desktop.keybindings.media-keys screenshot "@as []"
gsettings set org.cinnamon.desktop.keybindings.media-keys screenshot-clip "@as []"
gsettings set org.cinnamon.desktop.keybindings.media-keys window-screenshot "@as []"
gsettings set org.cinnamon.desktop.keybindings.media-keys window-screenshot-clip "@as []"

# Add some personal favourite bindings as well
gsettings set org.cinnamon.desktop.keybindings.wm switch-group "['<Primary><Alt>Tab']"
gsettings set org.cinnamon.desktop.keybindings.wm switch-to-workspace-1 "['<Primary><Alt>1']"
gsettings set org.cinnamon.desktop.keybindings.wm switch-to-workspace-2 "['<Primary><Alt>2']"
gsettings set org.cinnamon.desktop.keybindings.wm switch-to-workspace-3 "['<Primary><Alt>3']"

# This one uses Alt-F2 by default, which is more useful for applications.
gsettings set org.cinnamon.desktop.keybindings.wm panel-run-dialog "['<Alt>Scroll_Lock']"
```

Some optional ones as well:

```shell
# Set the zoom level for the whole desktop (0.8 = 80%). Can be useful to
# get more space on the screen, or make the font size more readable
gsettings set org.cinnamon.desktop.interface text-scaling-factor 0.8 # or 1.1, etc

# Set a higher motion threshold for the mouse
gsettings set org.cinnamon.settings-daemon.peripherals.mouse custom-threshold true
gsettings set org.cinnamon.settings-daemon.peripherals.mouse motion-threshold 1

# Likewise for touchpad
gsettings set org.cinnamon.settings-daemon.peripherals.touchpad motion-threshold 1

# ...and turn the horrible, horrible tap-to-click thing off.
gsettings set org.cinnamon.settings-daemon.peripherals.touchpad tap-to-click false
```
