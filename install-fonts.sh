#!/bin/bash

# get absolute path of our .environment dir
ENV_DIR=$(readlink -f $(dirname $0))

TARGET_DIR=$HOME

source ${ENV_DIR}/lib/functions.sh


# ensure we've got the correct location
[ -d "${ENV_DIR}" ] || bailout "don't know where I am"

cd $ENV_DIR


[ -d font/fonts ] || mkdir -p font/fonts

# copy all available fonts to the .fonts target dir
FONT_DIRS="awesome-terminal-fonts/fonts powerline-font"
for i in $FONT_DIRS ; do
	[ -d font/$i ] || bailout "font/$i not found"
	ln -sfr font/$i/* font/fonts/
done

install_env_link font/fonts .fonts
mkdir -p ${TARGET_DIR}/.config/fontconfig/conf.d
install_env_link font/fontconfig/10-symbols.conf .config/fontconfig/conf.d

echo "update font cache"
fc-cache -fv ${TARGET_DIR}/.fonts

# TODO: enable bitmap fonts (ubuntu: rm/overrule /etc/fontconfig/70-bitmap...)


