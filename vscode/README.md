# vscode

This folder contains my VS Code settings. I set this mechanism up before [Settings Sync](https://code.visualstudio.com/docs/editor/settings-sync) existed. One of the things I like about it is that it gives me full control, since I store this in a Git repo where I can easily see history, etc., whereas the VS Code-provided Settings Sync seems more "vendor-cloud-oriented" in a negative way.

I might give it a try sometime, but as of yet, I haven't been willing to put the effort into it.

Symlink `settings.json` and `keybindings.json` to the correct folder:

- On Linux:
  - `ln -sf ~/git/dotfiles/vscode/settings.json ~/.config/Code/User`
  - `ln -sf ~/git/dotfiles/vscode/keybindings.json ~/.config/Code/User`

## Installing my favorite extensions

```shell
code --install-extension redhat.vscode-yaml
code --install-extension samuelcolvin.jinjahtml
code --install-extension stkb.rewrap
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension streetsidesoftware.code-spell-checker-swedish
code --install-extension WakaTime.vscode-wakatime
code --install-extension william-voyek.vscode-nginx
code --install-extension zhuangtongfa.material-theme
```
