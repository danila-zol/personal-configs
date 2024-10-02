# I use Neovim
export EDITOR=/usr/bin/nvim

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# fnm
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
. "$HOME/.cargo/env"

# emscripten
source "$HOME/dev/repos/emsdk/emsdk_env.sh" 2> /dev/null

# Use Starship if availible, otherwise just a simple prompt
if command -v starship > /dev/null; then
	eval "$(starship init bash)"
else 
	PS1="[\u@\H \w]\$ "
fi

# Fix VS Code on Wayland
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
	alias code="code --ozone-platform-hint=wayland"
fi
