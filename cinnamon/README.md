# cinnamon

Here are some details about my Cinnamon setup:

- [My personal Cinnamon theme](https://github.com/perlun/perlun-cinnamon-theme)
  is nothing incredibly spectacular, but I like it and use it on all my Cinnamon
  desktops (at work, on the laptop, on my home desktop etc.). It's a modified
  version of the (dark) Adapta Nokto theme.

  Apply it like this:
  ```shell
  $ gsettings set org.cinnamon.desktop.interface gtk-theme perlun-cinnamon-theme
  $ gsettings set org.cinnamon.desktop.interface icon-theme perlun-cinnamon-theme
  $ gsettings set org.cinnamon.desktop.wm.preferences theme perlun-cinnamon-theme
  $ gsettings set org.cinnamon.theme name perlun-cinnamon-theme
  ```

## appSwitcher.js bug fix

Until [this GitHub issue](https://github.com/linuxmint/cinnamon/issues/4330) is resolved, use the [appSwitcher-js-patch.diff](appSwitcher-js-patch.diff) to change the semantics to the desired one. Apply the patch like this:

```shell
$ cd /usr/share/cinnamon/js/ui
# -d / is required to apply a patch with absolute paths, sudo is required to patch root-owned files.
$ sudo patch -p0 -d / < ~/git/dotfiles/cinnamon/appSwitcher-js-patch.diff
```

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

# Animations when switching workspaces are just annoying. Window animations
# might also look a bit "cool" but I think I prefer when things feel more
# "instant" => disable all effects for now.
gsettings set org.cinnamon.muffin desktop-effects false
gsettings set org.cinnamon desktop-effects-workspace false

# Mouse-based edge tiling isn't really useful; it can easily conflict with QuickTile-based tiling.
gsettings set org.cinnamon.muffin edge-tiling false

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

## Customize font settings

The defaults in Cinnamon are a bit too small for me on the 1440p (96 DPI) screens I regularly use. The following overrides work better for me:

```
gsettings set org.cinnamon.desktop.interface font-name 'DejaVu Sans 10'
gsettings org.cinnamon.desktop.wm.preferences titlebar-font 'Open Sans 11'
org.gnome.desktop.interface document-font-name 'Sans 10'
```

Note that the above might require the `open-sans` package to be installed (`apt-get install fonts-open-sans`). Sans Regular might work equally well if you don't want the extra package.

## Customize applets

This is unfortunately not easily doable via automation (e.g. because the applet configuration versions seem to be embedded in the configuration), but when completed, the list of `enabled-applets` should look pretty much like below.

- A spacer is added to the left and right of the menu
- The "grouped window list" is replaced by "window list", one for each monitor
- `sysmonitor@orcus` is added as a right-hand applet

```shell
$ gsettings get org.cinnamon enabled-applets
['panel1:left:3:panel-launchers@cinnamon.org:36', 'panel1:right:16:removable-drives@cinnamon.org:37', 'panel1:right:17:user@cinnamon.org:38', 'panel1:right:18:calendar@cinnamon.org:39', 'panel1:left:4:IcingTaskManager@json:40', 'panel2:right:7:removable-drives@cinnamon.org:56', 'panel2:right:8:user@cinnamon.org:57', 'panel2:right:9:calendar@cinnamon.org:58', 'panel2:left:4:IcingTaskManager@json:59', 'panel2:right:6:keyboard@cinnamon.org:61', 'panel2:left:1:menu@cinnamon.org:62', 'panel2:right:5:notifications@cinnamon.org:64', 'panel2:right:3:systray@cinnamon.org:65', 'panel1:left:1:menu@cinnamon.org:66', 'panel2:right:4:sound@cinnamon.org:67', 'panel2:left:3:panel-launchers@cinnamon.org:68', 'panel2:left:5:window-list@cinnamon.org:70', 'panel1:left:5:window-list@cinnamon.org:71', 'panel1:left:0:spacer@cinnamon.org:72', 'panel1:left:2:spacer@cinnamon.org:73', 'panel2:left:0:spacer@cinnamon.org:74', 'panel2:left:2:spacer@cinnamon.org:75', 'panel2:right:0:sysmonitor@orcus:76']
```

## Startup Applications

- Set up `quicktile -d &` (after installing [QuickTile](https://github.com/ssokolow/quicktile)) as a Startup Application to make it be loaded on login.

## Menu tweaks

- I typically enable the "Use a custom icon and label" option in the Cinnamon Menu settings, setting it to `/usr/share/icons/gnome/scalable/places/debian-swirl.svg`, which gives a more Debian-flavoured feeling.

## Disabling `middle-click-close` on Cinnamon task bar

This can be very annoying on a laptop, since it's very easy to click by mistake. Use the instructions from [this Reddit thread](https://www.reddit.com/r/linuxmint/comments/bm0zex/help_how_do_i_disable_middleclicktoclose/emvtrhw/?newUser=true) to fix it:

1. Right click on an open application (e.g. Firefox) in the panel (aka dock or taskbar). Don't click on the panel itself or one of the square launchers, it has to be one of the long icons with text

2. Click "Preferences"

3. Click "Configure". A popup window will appear titled "Window list"

4. Under "Behavior" there's an option "Middle click to close window". Toggle it off.

On this machine, the particular configuration seems to be tracked in `~/.cinnamon/configs/window-list@cinnamon.org/4.json`
