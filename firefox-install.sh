#!/bin/bash

#
# Firefox installer script for Debian
#
# Based on instructions provided at
# https://wiki.debian.org/Firefox#From_Mozilla_binaries
#

set -e -o pipefail

# Download the binaries
# TODO: Add verification, using some form of gpg/etc signature
wget -c -O ~/.local/firefox_latest.tar.bz2 "https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US"

# Remove any existing installation and unpack it, removing the tarball
# afterwards
sudo rm -rf ~/.local/apps/firefox
mkdir -p ~/.local/apps/firefox
(cd ~/.local/apps && tar xvf ~/.local/firefox_latest.tar.bz2)
rm ~/.local/firefox_latest.tar.bz2

# Ensure the firefox directory is root-owned. This is necessary for
# communication with the 1Password desktop app to work
# (https://1password.community/discussion/comment/596424/#Comment_596424). The
# downside is that this breaks the Firefox auto-updater, so this script need to
# be re-executed whenever a Firefox update is published.
sudo chown -R root:root ~/.local/apps/firefox

# Create a menu entry and add it using `xdg-desktop-menu`
cat <<EOF > ~/.local/share/applications/userapp-firefox.desktop
[Desktop Entry]
Name=Firefox
Comment=Web Browser
Exec=$HOME/.local/apps/firefox/firefox %u
Terminal=false
Type=Application
Icon=$HOME/.local/apps/firefox/browser/chrome/icons/default/default128.png
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;
StartupNotify=true
Actions=Private;

[Desktop Action Private]
Exec=$HOME/.local/apps/firefox/firefox --private-window %u
Name=Open in private mode
EOF

xdg-desktop-menu install ~/.local/share/applications/userapp-firefox.desktop

# Create a symlink in ~/bin, which I typically add to the PATH. This makes it
# easy to run things like `firefox google.com` from the commandline.
mkdir -p ~/bin
ln -sf ~/.local/apps/firefox/firefox ~/bin/firefox
