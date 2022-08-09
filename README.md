README
======

This is a collection of my personal dotfiles. Feel free to use them in any way
you like. The `git-prompt.sh` is under the somewhat
[viral](http://en.wikipedia.org/wiki/GNU_General_Public_License#.22Viral.22_nature)
GNU GPL license, but the rest of this stuff can be used freely under the terms
of the [MIT license](LICENSE). You are not obliged to contribute your changes
back to me if you don't like, but you are certainly welcome to submit PR:s if
you find things you can improve on here.

These dotfiles have served me well on both macOS and Linux (Debian and Ubuntu).
I also use them on [msys2](https://www.msys2.org/) on Windows.

## How to use

1. `cd ~/git && git clone git@github.com:perlun/dotfiles.git`
1. `rm -f ~/.profile && ln -sf ~/git/dotfiles/profile ~/.profile`
1. `rm -f ~/.bash_profile` (gets created by default on e.g. msys2, takes precedence over `~/.profile` so must be deleted.)
1. `rm -f ~/.bashrc && ln -sf ~/git/dotfiles/bashrc ~/.bashrc`
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

   See the "color examples" below for more WYSIWYG examples.

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

If your terminal supports it (most modern terminals do), you can even use [8-bit
(256) colors](https://en.wikipedia.org/wiki/ANSI_escape_code#8-bit) to get more
flexibility than the traditional 16-colored ANSI palette can provide.

Here are some examples of decent color combinations that I have used at various
machines. I tend to prefer having red colors for production environments, for
example, so that I get a clear visual indication of where I am working at the
moment. Also, I find it preferable to use different colors for my local machine
vs remote servers, to avoid mistakes.

The examples include the full `~/.bash_profile` contents, to make them easy to copy-paste.

```shell
PROMPT_HOST_COLOR="38;5;110"
PROMPT_TIME_COLOR="38;5;113"
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
```

![Color 110 and 113](/colors/110-113.png)

```
PROMPT_HOST_COLOR="38;5;135"
PROMPT_TIME_COLOR="38;5;147"
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
```

![Color 135 and 147](/colors/135-147.png)

```
PROMPT_TIME_COLOR="38;5;196"
PROMPT_HOST_COLOR="38;5;198"
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
```

![Color 196 and 198](/colors/196-198.png)

```
PROMPT_HOST_COLOR="38;5;209"
PROMPT_TIME_COLOR="38;5;212"
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
```

![Color 209 and 212](/colors/209-212.png)

## Recommended tools (GNU/Linux)

- Debian `testing` or `unstable`, to get good, recent versions of the software I
  need for work and play. At the moment, I'm actually using `stable` (`buster`)
  since it was released recently enough.
- [pg_hba.ctl](pg_hba.ctl) settings, to make URLs like
  `postgres://localhost/foo_database` work for any local user. **Caveat**:
  not secure for customer/multi-user environments.
- [quicktile](https://github.com/ssokolow/quicktile) for some incredibly
  nice [Spectacle](http://spectacleapp.com/)-like tiling features for
  X11.
- [CopyQ](https://hluk.github.io/CopyQ/) as clipboard manager. Very useful
  when copying an image and some text at the same time, e.g. when articulating
  a Slack message.
- Cinnamon is the desktop environment I prefer: `sudo apt-get install cinnamon`.
  See my dedicated [cinnamon](cinnamon) page for more details on my setup.
- [Visual Studio Code](https://code.visualstudio.com/): Provides a great
  IDE-like experience for C#, JavaScript and other languages. The Ruby
  experience is also decent.
- Firefox: Because Debian only provides an LTS version (which is often quite
  old) and I'm not a big fan of Flatpak/Snap packages, I run this from upstream
  `.tar.bz2` downloaded & installed using [this script](firefox-install.sh).
  This provides some of the benefits of the Snap package (auto-updating) but
  without the potential overhead involved with sandboxing the Firefox processes.

## Recommended tools (macOS)

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

## Stuff I don't use any more

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
- _`sudo apt-get install gnome-tweaks` - this one has nice stuff like "use Caps
  Lock for switching keyboard layouts"._ No longer personally using this, but
  using a similar thing in Cinnamon instead.
- Show date in GNOME panel, next to time: `gsettings set org.gnome.desktop.interface clock-show-date true`
- _`sudo apt-get install gnome` as the desktop environment of choice. Well
  polished, pretty much on-par in terms of usability with Windows 10 or macOS._
  Because of excessive memory usage (`gnome-shell` was up to 6 GiB at some
  point), I ended up scrapping this and went with `sudo apt-get install
  cinnamon` instead. It seems to use less Javascript for its UI which I consider
  a very good thing... See the references at the end of this README.md for some
  interesting reading about memory leaks that have been present in Gnome
  historically.

### Cinnamon tweaks

- Get rid of pre-defined Ctrl-Alt-Tab keybinding, to use it for "cycle trough windows of the same application". Use [this approach](https://github.com/linuxmint/Cinnamon/issues/2539#issuecomment-435401309) to remove the `switch-panels` setting under `org.cinnamon.desktop.keybindings.wm` in `dconf-editor`

### References

- Bug #1672297 “gnome-shell uses lots of memory, and grows over time: https://bugs.launchpad.net/gnome-shell/+bug/1672297
- The Infamous GNOME Shell Memory Leak: https://feaneron.com/2018/04/20/the-infamous-gnome-shell-memory-leak/
