README
======

This is a collection of my personal dotfiles. Feel free to use them in any
way you like. The `git-prompt.sh` is under the somewhat
[viral](http://en.wikipedia.org/wiki/GNU_General_Public_License#.22Viral.22_nature)
GNU GPL license, but the rest of this stuff can be used freely under the
terms of the [MIT license](LICENSE). You are not obliged to contribute your
changes back to me if you don't like, but you are certainly welcome to
submit PR:s if you find things you can improve on here.

These dotfiles have served me well on both macOS and Linux (Debian and
Ubuntu). I also use them on [msys2](https://www.msys2.org/) on Windows.

## How to use

1. `cd ~/git && git clone git@github.com:perlun/dotfiles.git`
1. `rm -f ~/.profile && ln -sf ~/git/dotfiles/profile ~/.profile`
1. `rm -f ~/.bash_profile` (gets created by default on e.g. msys2, takes precedence over `~/.profile` so must be deleted.)
1. `rm -f ~/.bash_aliases && ln -sf ~/git/dotfiles/bash_aliases ~/.bash_aliases`
1. Restart your shell. You should now have a colourful prompt, among other
   nice features. If nothing seems to have been loaded, you might have to
   enable "Run command as login shell" (which is [not enabled by default](https://askubuntu.com/a/598072/305208) in e.g. the GNOME Terminal)

## Optional steps

1. **Optional**: If you want custom colors, `cat > ~/.bash_profile`, paste
   this content and press Ctrl-D:

       PROMPT_HOST_COLOR="1;34"
       PROMPT_TIME_COLOR="34"
       [[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

   You can even use [8-bit (256)
   colors](https://en.wikipedia.org/wiki/ANSI_escape_code#8-bit) if you
   like (more color examples below):

       PROMPT_HOST_COLOR="38;5;209"
       PROMPT_TIME_COLOR="38;5;212"

1. **Optional**:  If you use the [`nano`](https://www.nano-editor.org)
   editor, you might find it useful to install my custom `.nanorc` which sets up syntax highlighting for certain file types:

    ```shell
    $ rm -f ~/.nanorc && ln -sf git/dotfiles/nanorc ~/.nanorc
    ```

1. **Optional**: If you have secrets in your profile that you do not wish
   to revision-control (e.g. environment variables with passwords or API
   keys), place them in a separate file named `~/.profile_secrets`. It will
   be automatically picked up and loaded if it exists.

## Color examples

Here are some examples of decent color combinations that I have used at
various machines. I tend to prefer having red colors for production
environments, for example, so that I get a clear visual indication of where
I am working at the moment. Also, I find it preferable to use different
colors for my local machine vs remote servers, to avoid mistakes.

```shell
PROMPT_HOST_COLOR="38;5;110"
PROMPT_TIME_COLOR="38;5;113"
```

![Color 110 and 113](/colors/110-113.png)

```
PROMPT_HOST_COLOR="38;5;135"
PROMPT_TIME_COLOR="38;5;147"
```

![Color 135 and 147](/colors/135-147.png)

```
PROMPT_TIME_COLOR="38;5;196"
PROMPT_HOST_COLOR="38;5;198"
```

![Color 196 and 198](/colors/196-198.png)

```
PROMPT_HOST_COLOR="38;5;209"
PROMPT_TIME_COLOR="38;5;212"
```

![Color 209 and 212](/colors/209-212.png)

### macOS quick-start

This is useful for getting a new developer machine up and running.

1. Install [iTerm 2](http://www.iterm2.com) (a good terminal app for OS X)
1. `mkdir git && cd git`
1. `git clone git@github.com:perlun/dotfiles.git`
1. Follow the instructions above to get started.
1. Install Homebrew: http://brew.sh/ (a package manager that easily lets go
   you get command-line stuff you need)
1. `brew install bash-completion` (to get branch/etc completion in `git` -
   can't live without this once you've tried it.)
1. `brew install git` (to get a more recent one than Apple provides + bash
   completion files for the above)
1. `brew install gnugp` (needed to verify GPG signatures and also produce
   signed content.)
1. `brew install coreutils findutils` (to get a more GNU-like userland)
1. `brew install nodejs`
1. `\curl -sSL https://get.rvm.io | bash -s stable` (to be able to not have
   to touch the system-wide Ruby, but instead use RVM to manage multiple
   Ruby versions)
1. `npm install -g ember-cli`
1. `npm install -g bower`

## Recommended tools (GNU/Linux)

- Debian Testing or Unstable, to get good, recent versions of the software
  I need for work and play.
- `sudo apt-get install gnome` as the desktop environment of choice. Well
  polished, pretty much on-par in terms of usability with Windows 10 or
  macOS.
- `sudo apt-get install gnome-tweaks` - this one has nice stuff like "use
  Caps Lock for switching keyboard layouts".
- [pg_hba.ctl](pg_hba.ctl) settings, to make URLs like
  `postgres://localhost/foo_database` work for any local user. **Caveat**:
  not secure for customer/multi-user environments.
- [quicktile](https://github.com/ssokolow/quicktile) for some incredibly
  nice [Spectacle](http://spectacleapp.com/)-like tiling features for
  X11.

### Recommended tools (macOS)

- [Visual Studio Code](https://code.visualstudio.com/): Provides a great
  IDE-like experience for C#, JavaScript and other languages. The Ruby
  experience is also decent.
- [Spectacle](http://spectacleapp.com/): This one is nice since it will
  give you shortcuts for moving a window to use the "left half" or "right
  half" of the screen, and similar. I use this all the time to be able to
  run four programs on two monitors, giving them 50% each. :)
- [Karabiner Elements](https://pqrs.org/osx/karabiner//): This is an
  incredibly useful tool if you're coming from a PC background, used to a
  "traditional" PC laptop keyboard. The Apple choices for the key
  placements are simply quite horrible, if you ask me. Not one single
  modifier key (Control, Fn, Option, Cmd etc) is on the same place as on my
  other PC keyboard, so some remapping is simply necessary to retain my
  mental health.
- [Parallels](http://www.parallels.com): A great virtualization app, to be
  able to run Windows 10, Debian, Visual Studio, etc.

## Stuff I don't use so much any more

- [SourceTree](http://www.sourcetreeapp.com/): Graphical `git` and `hg`
  (Mercurial) client for Windows and macOS. Developed by Atlassian, the
  company who provides the [Bitbucket](http://www.bitbucket.org) hosted
  Mercurial/Git services. I'm using this less and less now, preferring
  command line instead.
- [Sublime Text](http://www.sublimetext.com): Text editor. Use Atom instead
  these days, unless you get fed up with its slowness etc.
- Atom: use VS Code instead. :)
- KDE Plasma. Using Gnome instead nowadays.
- Reconfigure Klipper to sync clipboards (to avoid letting Ctrl-C and
  mouse-selection in Konsole copy to different clipboards, which can be
  annoying if mentally switching between macOS and Debian often, which have
  different semantics in this area.) Klipper is KDE-centric but I might
  end up looking for something similar for GNOME/GTK. "One clipboard to
  rule them all" is much more my melody than the GNOME/X11 default.

## Sublime Text 3 settings

```json
{
  "color_scheme": "Packages/Theme - Asphalt/Asphalt.tmTheme",
  "ignored_packages":
  [
    "Vintage"
  ],
  "auto_complete": true,
  "auto_complete_commit_on_tab": false,
  "auto_match_enabled": false,
  "bold_folder_labels": true,
  "draw_white_space": "all",
  "ensure_newline_at_eof_on_save": true,
  "font_size": 14.0,
  "highlight_line": true,
  "highlight_modified_tabs": true,
  "ignore_inodes": true,
  "ignored_packages":
  [
    "Vintage"
  ],
  "line_padding_bottom": 0,
  "line_padding_top": 0,
  "open_files_in_new_window": false,
  "rulers":
  [
    132
  ],
  "tab_size": 2,
  "translate_tabs_to_spaces": true,
  "trim_trailing_white_space_on_save": true,
  "use_tab_stops": true
}
```
