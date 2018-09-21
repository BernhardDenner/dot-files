## My personal working environment ##

Exists mainly for sharing between several workstations

If you like it, let me know; suggestions always welcome ;)

### installation ###

```bash
git clone https://github.com/... .environment
cd .environment
git submodule init
git submodule update
./install-fonts.sh
./install.sh

# .zshrc additions
ZSH_CUSTOM=~/.environment/zsh_custom

plugins=(zsh-256color zsh-autosuggests)

# must be source last
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

