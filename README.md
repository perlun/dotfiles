README
======

This is a collection of my personal OS X settings. Feel free to use them in any way you like. The `git-prompt.sh` is under the [viral](http://en.wikipedia.org/wiki/GNU_General_Public_License#.22Viral.22_nature) GNU GPL license, but the rest of this stuff can be used more freely than that. You don't have to contribute your changes back to me if you don't like, but you are certainly welcome to submit PR:s if you find things you can improve on here.

## Quick-start to get some of the important stuff running.

1. Install [iTerm 2](http://www.iterm2.com) (a good terminal app for OS X)
1. `mkdir git && cd git`
1. `git clone git@github.com:perlun/dotfiles.git`
1. Edit/create `~/.bash_profile` to include `. ~/git/dotfiles/bash_profile`. Restart the shell to make changes take effect.
1. Install Homebrew: http://brew.sh/ (a package manager that easily lets go you get command-line stuff you need)
1. `brew install git` (to get a more recent one than Apple provides)
1. `brew install coreutils findutils` (to get a more GNUish userland)
1. `brew install nodejs`
1. `\curl -sSL https://get.rvm.io | bash -s stable` (to be able to not have to touch the system-wide Ruby, but use RVM instead)
1. `npm install -g ember-cli`
1. `npm install -g bower`

## Some highly recommended tools

- [Atom](https://atom.io/): One of the better text editors nowadays. Has matured quite a lot recently and is ready for broad usage.
- [Spectacle](http://spectacleapp.com/): This one is nice since it will give you shortcuts for moving a window to use the "left half" or "right half" of the screen, and similar. I use this all the time to be able to run four programs on two monitors, giving them 50% each. :)
- [Karabiner](http://pqrs.org/macosx/keyremap4macbook/): This is an incredibly useful tool if you're coming from a PC background, used to a "traditional" PC laptop keyboard. The Apple choices for the key placements are simply quite horrible, if you ask me. Not one single modifier key (Control, Fn, Option, Cmd etc) is on the same place as on my other PC keyboard, so some remapping is simply necessary to retain my mental health. From the same author you can also install [Seil](https://pqrs.org/osx/karabiner/seil.html.en) if you wanto use Caps Lock for e.g. [switching from one keyboard layout to another](http://dae.me/blog/593/select-input-language-by-caps-lock-in-mac-os-x/).
- [Mou](http://mouapp.com/): Markdown-editor which works quite well, and has a nice preview pane also.
- [Parallels](http://www.parallels.com): A great virtualization app, to be able to run Windows 10, Visual Studio, etc.
- [ScrollReverser](http://www.macupdate.com/app/mac/37872/scroll-reverser): "Natural scrolling" is already supported by OS X, but if you only want to use it for the trackpad but not external mice, this is a great help.

## Stuff I don't use so much any more

- [SourceTree](http://www.sourcetreeapp.com/): Graphical `git` and `hg` (Mercurial) client. Developed by Atlassian, the company who provides the [Bitbucket](http://www.bitbucket.org) hosted Mercurial/Git services. I'm using this less and less now, preferring command line instead.
- [Sublime Text](http://www.sublimetext.com): Text editor. Use Atom instead these days, unless you get fed up with its slowness etc.

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
