Configuration files for Rainbow: https://github.com/nicoulaj/rainbow

If you're using a GNU/Linux distribution like Debian or Ubuntu, use [this link](https://software.opensuse.org/download.html?project=home%3Anicoulaj%3Arainbow&package=rainbow) to install a Rainbow package for your distribution of choice.

Once `rainbow` is installed, use a syntax like this to run a program using it: `rainbow -f catalina ./dev/scripts/run-centre-dev.sh start`

### Installation

```shell
$ mkdir -p ~/.rainbow
$ ln -sf $(readlink -f catalina.cfg) ~/.rainbow
$ ln -sf $(readlink -f ifconfig.cfg) ~/.rainbow
```
