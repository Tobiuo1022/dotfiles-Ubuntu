# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# エイリアスの読み込み
. ~/.bash_aliases

# プロンプトの色設定
export PS1="\e[104m\e[1m\w\e[0m\n\e[103m\e[1m[\u]\e[0m\$ "
export LS_COLORS="di=96:ln=96:ex=32:bd=33:cd=33:or=31:mi=31:*.tar=96:*.gz=96:*.zip=96:*.xz=96:*.jpg=35:*.png=35:*.gif=35"

# history関連
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000
HISTTIMEFORMAT="%F %T "
shopt -s histappend

shopt -s checkwinsize

# glob関連
shopt -s globstar
shopt -s extglob
shopt -s nocaseglob

# コマンドの補完
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi
if command -v asdf &> /dev/null; then
    . <(asdf completion bash)
fi

# ctrl+Dによるログアウトを防ぐ
export IGNOREEOF=10

# cd後にls
cd() {
    builtin cd "$@" && ls --color=auto
}

# fzf
if [ -f /usr/share/doc/fzf/examples/key-bindings.bash ]; then
    . /usr/share/doc/fzf/examples/key-bindings.bash
fi
export FZF_DEFAULT_OPTS="--extended --cycle --exact"
