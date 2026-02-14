# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# エイリアスの読み込み. 
. ~/.bash_aliases

# プロンプトの色設定. 
export PS1="\e[104m\e[1m\w\]\]\e[0m\]\n\e[103m\e[1m[\u]\]\]\e[0m\]$ "
export LS_COLORS="di=96:ln=96:ex=32:bd=33:cd=33:or=31:mi=31:*.tar=96:*.gz=96:*.zip=96:*.xz=96:*.jpg=35:*.png=35:*.gif=35"

# history関連. 
HISTCONTROL=ignoreboth
shopt -s histappend

shopt -s checkwinsize

# glob関連. 
shopt -s globstar
shopt -s extglob
shopt -s nocaseglob

# コマンドの補完. 
. /usr/share/bash-completion/bash_completion
. <(asdf completion bash)

# ctrl+Dによるログアウトを防ぐ. 
export IGNOREEOF=10

# cd後にls. 
cd() {
  builtin cd "$@" && ls --color=auto
}

# fzf
. /usr/share/doc/fzf/examples/key-bindings.bash
export FZF_DEFAULT_OPTS="--extended --cycle --exact"
