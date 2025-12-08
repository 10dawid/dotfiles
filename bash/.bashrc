# ~/.bashrc

# Jeśli nie interaktywny, zakończ
case $- in
    *i*) ;;
      *) return;;
esac

# --- Historia Bash ---
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# --- Opcje okna ---
shopt -s checkwinsize

# --- Bash Completion ---
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# --- Zmienne środowiskowe ---
export TERM=xterm-256color
. "$HOME/.local/bin/env" 2>/dev/null
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# --- Oh My Posh (Bash) ---
# Upewnij się, że ścieżka do configu jest poprawna
if command -v oh-my-posh >/dev/null; then
    eval "$(oh-my-posh init bash --config ~/configs/1_shell.omp.json)"
fi

# --- NVM (Bash) ---
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# --- Pyenv (Bash) ---
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv >/dev/null; then
    eval "$(pyenv init -)"
fi

# --- Ładowanie aliasów ---
if [ -f ~/.common_aliases ]; then
    . ~/.common_aliases
fi
