# vscode

This folder contains my VSCodium/VS Code settings. I set this mechanism up before [Settings Sync](https://code.visualstudio.com/docs/editor/settings-sync) existed. One of the things I like about it is that it gives me full control, since I store this in a Git repo where I can easily see history, etc., whereas the VS Code-provided Settings Sync seems more "vendor-cloud-oriented" in a negative way.

I might give it a try sometime, but as of yet, I haven't been willing to put the effort into it.

Symlink `settings.json` and `keybindings.json` to the correct folder:

- On Linux (VS Code):
  - `mkdir -p ~/.config/Code/User`
  - `ln -sf ~/git/dotfiles/vscode/settings.json ~/.config/Code/User`
  - `ln -sf ~/git/dotfiles/vscode/keybindings.json ~/.config/Code/User`

On macOS (VSCodium):
  - `mkdir -p ~/Library/Application\ Support/VSCodium/User`
  - `ln -sf ~/git/dotfiles/vscode/settings.json ~/Library/Application\ Support/VSCodium/User`
  - `ln -sf ~/git/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/VSCodium/User`

## Installing my favorite extensions

(Replace `codium` with `code` if using VS Code)

```shell
codium --install-extension eamodio.gitlens
codium --install-extension ms-python.python
codium --install-extension ms-vscode-remote.remote-ssh
codium --install-extension redhat.vscode-yaml
codium --install-extension samuelcolvin.jinjahtml
codium --install-extension stkb.rewrap
codium --install-extension streetsidesoftware.code-spell-checker
codium --install-extension streetsidesoftware.code-spell-checker-swedish
codium --install-extension WakaTime.vscode-wakatime
codium --install-extension william-voyek.vscode-nginx
codium --install-extension zhuangtongfa.material-theme
```
