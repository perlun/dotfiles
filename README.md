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
1. `brew install ember-cli`

## Some highly recommended tools

- [Spectacle](http://spectacleapp.com/): This one is nice since it will give you shortcuts for moving a window to use the "left half" or "right half" of the screen, and similar. I use this all the time to be able to run four programs on two monitors, giving them 50% each. :)
- [Karabiner](http://pqrs.org/macosx/keyremap4macbook/): This is an incredibly useful tool if you're coming from a PC background, used to a "traditional" PC laptop keyboard. The Apple choices for the key placements are simply quite horrible, if you ask me. Not one single modifier key (Control, Fn, Option, Cmd etc) is on the same place as on my other PC keyboard, so some remapping is simply necessary to retain my mental health. From the same author you can also install [Seil](https://pqrs.org/osx/karabiner/seil.html.en) if you wanto use Caps Lock for e.g. [switching from one keyboard layout to another](http://dae.me/blog/593/select-input-language-by-caps-lock-in-mac-os-x/).
- [Mou](http://mouapp.com/): Markdown-editor which works quite well, and has a nice preview pane also.
- [Parallels](http://www.parallels.com): A great virtualization app, to be able to run Windows 10, Visual Studio, etc.
- [ScrollReverser](http://www.macupdate.com/app/mac/37872/scroll-reverser): "Natural scrolling" is already supported by OS X, but if you only want to use it for the trackpad but not external mice, this is a great help.
- [Sublime Text](http://www.sublimetext.com): Powerful text editor for power users.

## Stuff I don't use so much any more

- [SourceTree](http://www.sourcetreeapp.com/): Graphical `git` and `hg` (Mercurial) client. Developed by Atlassian, the company who provides the [Bitbucket](http://www.bitbucket.org) hosted Mercurial/Git services. I'm using this less and less now, preferring command line instead.

## Recommended Sublime Text 2 packages

	"installed_packages":
	[
		"3024 Color Scheme",
		"CoffeeScript",
		"Color Schemes by carlcalderon",
		"Git",
		"GitGutter",
		"Handlebars",
		"Indent XML",
		"JSON Reindent",
		"LESS",
		"Markdown Preview",
		"Package Control",
		"PowerShell",
		"Pretty JSON",
		"RuboCop",
		"RubyFormat",
		"Sign",
		"SublimeLinter",
		"Tomorrow Color Schemes",
		"TypeScript"
	]

## Recommended Sublime Text 2 settings

```
{
	"auto_complete": true,
	"auto_complete_commit_on_tab": false,
	"auto_match_enabled": false,
	"bold_folder_labels": true,
	"color_scheme": "Packages/Color Schemes by carlcalderon/Tyrann/Tyrann Alex.tmTheme",
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

## Not for the faint-hearted

If you are like me, you sometimes feel like trying out new things. Because of a need I've seen at work, and as a little learning experiment as well, I decided to do my own keyboard map using a nice tool kalled [Ukelele](http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=ukelele). It is basically a "US layout but with support for åäö" (characters commonly used when communicating in Swedish or Finnish). The keymap aims to provide the best of both worlds: US layout for programming stuff (like []{};':"`) but still being able to communicate with people in my native language, without resorting to feeble options like aao.

You can find the keymap in this repo, in the `US-with-Swedish.keylayout` file. For detailed instructions on how to use it, please refer to [this](http://superuser.com/a/665726/59111) link.

(*Note*: I didn't copy the file to either of the recommended locations; instead, I symlinked it to `/Library/Keyboard Layouts`.)
