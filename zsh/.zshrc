# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions z fzf)

source $ZSH/oh-my-zsh.sh

export PATH="/opt/homebrew/bin:$PATH"
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/usr/local/bin/nvim:$PATH
export PATH="$HOME/nvim/bin:$PATH"
export FZF_BASE=/usr/local/opt/fzf/install

export LIBRARY_PATH=/usr/local/lib
export C_INCLUDE_PATH=/usr/local/include
export LD_LIBRARY_PATH=/usr/local/lib

export PATH="/opt/homebrew/opt/llvm@14/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm@14/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm@14/include"

export PATH="$HOME/Work/odin/Odin:$PATH"
export PATH="$HOME/Work/odin/ols:$PATH"

# export GIT_EDITOR=nvim
export MANPAGER='nvim +Man!'
export MANWIDTH=999


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# bindkey '\t' autosuggest-accept
alias vim='nvim'
alias v='nvim'

# c aliases
alias cinit='cmake -B ./build && cmake --build ./build'
alias cbuild='cmake --build ./build'
alias crun='cbuild && ./build/main'
alias cwatch='watchexec -r -e c,h "cmake --build ./build && ./build/main"'

alias orun='odin run ./src -out:build/main -debug'
alias owatch='watchexec -r -e odin,png "odin run ./src -out:build/main -debug"'
alias obuild='odin build ./src -out:build/release -o:speed && ./build/release'

# copy boilerplate
alias bp-c='rsync -av ~/.dotfiles/boilerplate/c/ ./'
alias bp-raylib='bp-c && rsync -av ~/.dotfiles/boilerplate/raylib/ ./'

alias csource='rsync -av ~/.dotfiles/boilerplate/c/.clang-format ./ && rsync -av ~/.dotfiles/boilerplate/c/CMakeLists.txt ./'

# fzf
DISABLE_FZF_KEY_BINDINGS="true"

export FZF_F_COMMAND='fd --type f --strip-cwd-prefix --hidden --exclude={.git,node_modules,build,tmp}'
export FZF_D_COMMAND='fd --type d --strip-cwd-prefix --hidden --exclude={.git,node_modules,build,tmp}'
export FZF_CTRL_T_COMMAND="$FZF_F_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_D_COMMAND"

bindkey '^f' fzf-file-widget
bindkey '^g' fzf-cd-widget

bindkey -s '^v' 'nvim .^M'
bindkey -s '^x' 'clear^M' 
bindkey -s '^b' 'cd ../^M' 

bindkey '^p' backward-word
bindkey '^n' forward-word
bindkey '^o' end-of-line

# bun completions
[ -s "/Users/arthurmasl/.bun/_bun" ] && source "/Users/arthurmasl/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# fnm
# export PATH="/Users/arthurmasl/Library/Application Support/fnm:$PATH"
# eval "`fnm env`"
