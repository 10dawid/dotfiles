# ~/.zshrc

# --- Ścieżki i Zmienne ---
export TERM=xterm-256color
export COLORTERM=xterm-truecolor
. "$HOME/.local/bin/env" 2>/dev/null
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# --- Autouzupełnianie (Completion) ---
autoload -Uz compinit
compinit

# --- Historia Zsh ---
HISTSIZE=100000
SAVEHIST=100000
HISTFILE="$HOME/.zsh_history"
mkdir -p "$(dirname "$HISTFILE")"

setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# Wyłączenie opcji
unsetopt APPEND_HISTORY
unsetopt EXTENDED_HISTORY
unsetopt HIST_EXPIRE_DUPS_FIRST
unsetopt HIST_FIND_NO_DUPS
unsetopt HIST_SAVE_NO_DUPS

# --- Oh My Posh (Zsh) ---
if command -v oh-my-posh >/dev/null; then
    eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/darkblood.omp.json)"
fi

# --- NVM (Zsh) ---
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# --- Pyenv (Zsh) ---
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv >/dev/null; then
    eval "$(pyenv init - zsh)"
fi

# --- Ładowanie aliasów ---
if [ -f ~/.common_aliases ]; then
    . ~/.common_aliases
fi

# --- Pluginy i Dodatki ---

# GRC (Generic Colouriser)
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh

# FZF
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh

# Zsh Autosuggestions
if [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Zsh Syntax Highlighting 
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
