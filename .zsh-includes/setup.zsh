# Adding pyenv
if [ ! -d $HOME/.pyenv ]; then
    echo "ERROR: pyenv not found. Installing..."
    git clone git://github.com/yyuu/pyenv.git $HOME/.pyenv
fi

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

# enable syntax highlighting
_syntax_highlighting="/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
if [ -e $_syntax_highlighting ]; then
    source $_syntax_highlighting
else
    brew install -y zsh-syntax-highlighting
    source $_syntax_highlighting
fi
