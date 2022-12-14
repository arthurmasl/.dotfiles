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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# bindkey '\t' autosuggest-accept
alias vim='nvim'
alias v='nvim'

# fzf
DISABLE_FZF_KEY_BINDINGS="true"

export FZF_F_COMMAND='fd --type f --strip-cwd-prefix'
export FZF_D_COMMAND='fd --type d --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_F_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_D_COMMAND"

bindkey '^f' fzf-file-widget
bindkey '^g' fzf-cd-widget

bindkey -s '^v' 'nvim .^M'
bindkey -s '^x' 'clear^M' 
