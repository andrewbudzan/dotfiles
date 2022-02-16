eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
eval "$(pyenv init --path)"
