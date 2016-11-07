#!/bin/bash

# get absolute path of our .environment dir
ENV_DIR=$(readlink -f $(dirname $0))

TARGET_DIR=$HOME

source ${ENV_DIR}/lib/functions.sh


# ensure we've got the correct location
[ -d "${ENV_DIR}" ] || bailout "don't know where I am"

cd $ENV_DIR


# install vim environment
install_env_link vimrc .vimrc
install_env_link vim .vim

# install tmux config
install_env_link tmux.conf .tmux.conf


