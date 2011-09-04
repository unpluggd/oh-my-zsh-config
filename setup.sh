#!/bin/bash

DIR="$( cd -P "$( dirname "$0" )" && pwd )"

echo -n "Setting-up... "
ln -sfF $DIR/.zshrc ~/.zshrc
ln -sfF $DIR/unpluggd.zsh-theme ~/.oh-my-zsh/themes/unpluggd.zsh-theme
echo "done."
