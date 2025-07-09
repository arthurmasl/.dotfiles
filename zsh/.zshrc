if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions z fzf autoupdate)

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

export PATH="/opt/homebrew/opt/llvm@19/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm@19/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm@19/include"

export PATH="$HOME/Work/odin/Odin:$PATH"

export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"

export PATH="$HOME/opt/homebrew/opt/zig/bin:$PATH"

export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home -v 21)

export MANPAGER='nvim +Man!'
export MANWIDTH=999


[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# aliases
alias vim='nvim'
alias v='nvim'

# c
alias cinit='cmake -B ./build && cmake --build ./build'
alias cbuild='cmake --build ./build'
alias crun='cbuild && ./build/main'
alias cwatch='watchexec -r -e c,h "cmake --build ./build && ./build/main"'

alias bp-c='rsync -av ~/.dotfiles/boilerplate/c/ ./'
alias bp-raylib='bp-c && rsync -av ~/.dotfiles/boilerplate/raylib/ ./'
alias csource='rsync -av ~/.dotfiles/boilerplate/c/.clang-format ./ && rsync -av ~/.dotfiles/boilerplate/c/CMakeLists.txt ./'

# odin
alias orun='odin run ./src -out:build/main -debug'
alias owatch='watchexec -r -e odin "odin run ./src -out:build/main'
alias owatchdedbug='watchexec -r -e odin "odin run ./src -out:build/main -debug"'

alias sowatch='watchexec -r -e odin,glsl "./build.py -hot-reload -run"'
alias sohardwatch='watchexec -r -e odin,glsl "./build.py -hot-reload -hard -run"'
alias sodebug='watchexec -r -e odin,glsl "./build.py -release -debug"'

alias otest='watchexec -r -e odin "odin test ./src -out:build/main -debug"'
alias obuild='odin build ./src -out:build/release -o:speed && ./build/release'

# go
alias gorun='go run ./cmd/app'
alias gowatch='watchexec -r -e go,mod "go run ./cmd/app"'

alias goasm='GOARCH=arm64 GOOS=darwin go tool compile -S cmd/app/main.go'
alias goasmt='GOARCH=arm64 GOOS=darwin go tool compile -S cmd/app/main.go | cut -c55-150'
alias goasmf='GOARCH=arm64 GOOS=darwin go tool compile -S cmd/app/main.go > main.asm'

alias gotest='go test ./... -v'
alias gotestwatch='watchexec -r -e go,mod "go test ./... -v"'

alias gobench='watchexec -r -e go,mod "go test ./... -bench=. -benchmem -v"'
alias gobenchwatch='watchexec -r -e go,mod "go test ./... -bench=. -benchmem -v"'

# sql
alias sql='psql -h localhost -p 5432 -U root -d box'
alias sqlwatch='watchexec -r -e sql "psql -h localhost -p 5432 -U root -d box -f ./schema.sql"'

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

# bun
[ -s "/Users/arthurmasl/.bun/_bun" ] && source "/Users/arthurmasl/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# fnm
# export PATH="/Users/arthurmasl/Library/Application Support/fnm:$PATH"
# eval "`fnm env`"
