# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:/var/lib/snapd/snap/bin
export SNAP_VERSION="x11"
export QT_QPA_PLATFORM=xcb
# export DOCKER_HOST=unix:///home/hawkjack/.docker/desktop/docker.sock

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH



plugins=( 
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

vdi() {
  xfreerdp /v:161.248.37.248:57788 \
           /u:qhvdi7 \
           /p:'arx@#$eVert123' \
           /sec:nla \
           /cert-ignore \
           /auto-reconnect \
           /scale:180 \
           /dynamic-resolution \
           /fonts \
           /gfx \
           /clipboard \
           /f
}



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

export EDITOR="nvim"

export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"

alias n="nvim"
alias py="python3"
alias env="source env/bin/activate"

#django alias
alias drs="python manage.py runserver"
alias dmk="python manage.py makemigrations"
alias dm="python manage.py migrate"
alias ds="python manage.py shell"

#react with vite alias
alias nrd="npm run dev"

#tmux alias
alias t="tmux"
alias ta="tmux attach"
alias tl="tmux ls"

#tmuxifier
alias tx="tmuxifier"
alias txe="tmuxifier edit-session"
alias txl="tmuxifier load-session"

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"

# Set up Zsh-specific options similar to Bash

export LIBVA_DRIVER_NAME=iHD
export LIBVA_DRIVERS_PATH=/usr/lib/dri/
export VDPAU_DRIVER=va_g1

export MOZ_ENABLE_WAYLAND=1
export XDG_SESSION_TYPE=wayland
export QT_QPA_PLATFORM=wayland

export JAVA_HOME=/usr/lib/jvm/java-24-openjdk


alias microsoft-edge="microsoft-edge-stable --enable-features=UseOzonePlatform --ozone-platform=wayland"

alias brave="brave --enable-features=UseOzonePlatform --ozone-platform=wayland"

alias ta='tmux attach'
alias tl='tmux ls'

alias lz='lazygit'

alias gc='git clone '
alias ga='git add'
alias gcm='git commit -m '
alias gp='git push -u origin'
alias gs='git status'
alias gcb='git checkout '

alias bt='bluetoothctl'
alias modenable='sudo modprobe -r kvm_intel && sudo modprobe kvm_intel'

# VDI
# alias vdi="xfreerdp /v:161.248.37.248:57788 /u:qhvdi7 /p:'arx@#$eVert123' /sec:nla /cert:ignore /dynamic-resolution /f"

# source <(fzf --zsh)


# ---- pyenv (must be LAST) ----
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH=$JAVA_HOME/bin:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/hawkjack/google-cloud-sdk/path.zsh.inc' ]; then . '/home/hawkjack/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/hawkjack/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/hawkjack/google-cloud-sdk/completion.zsh.inc'; fi

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS


# opencode
export PATH=/home/hawkjack/.opencode/bin:$PATH
