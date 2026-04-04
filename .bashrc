# .bashrc
# ubuntu server environment
#################################################
# インタラクティブシェル判定
#################################################
case $- in
*i*) ;;
*) return ;;
esac

#################################################
# シェルオプション
#################################################
shopt -s checkwinsize
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

#################################################
# ヒストリ設定
#################################################
HISTCONTROL=ignoreboth
HISTSIZE=500000
HISTFILESIZE=500000
HISTIGNORE="history*:pwd*:ls*:cdls*"
HISTTIMEFORMAT='%F %T '

#################################################
# プロンプト
#################################################
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\n\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
fi
unset color_prompt

case "$TERM" in
xterm* | rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
esac

#################################################
# カラー設定・エイリアス
#################################################
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#################################################
# 外部ファイル読み込み
#################################################
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#################################################
# 補完
#################################################
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

#################################################
# XDG Base Directory Specification
#################################################
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_DIRS="${XDG_DATA_DIRS:-/usr/local/share/:/usr/share/}"
export XDG_CONFIG_DIRS="${XDG_CONFIG_DIRS:-/etc/xdg}"

#################################################
# 環境変数
#################################################
# エディタの設定 Vimを使用する
export EDITOR='vim'

#################################################
# 関数
#################################################
function cdls() {
    \cd "$1"
    ls
}

#################################################
# ヒストリ共有
#################################################
function share_history {
    # 最後に実行したコマンドを履歴ファイルに追記
    history -a
    tac ~/.bash_history | awk '!a[$0]++' | tac >~/.bash_history.tmp
    [ -f ~/.bash_history.tmp ] &&
        mv ~/.bash_history{.tmp,} &&
        # メモリ上のコマンド履歴を消去
        history -c
    # 履歴ファイルからメモリへコマンド履歴を読み込む
    history -r
}
# 上記の一連の処理を、プロンプト表示前に（＝何かコマンドを実行することに）実行する
PROMPT_COMMAND='share_history'
# bashのプロセスを終了する時に、メモリ上の履歴を履歴ファイルに追記する、という動作を停止する
# （history -aによって代替されるため）
shopt -u histappend

#################################################
# .env_list
# パスワードを含む環境変数の設定ファイル
#################################################

# 指定したファイルから環境変数を export する
function set_env() {
    local _env_file
    _env_file=/tmp/env_$RANDOM
    # コメントと空行を削除したものを一時ファイルに
    grep -v -E '^[[:space:]]*#|^[[:space:]]*$' "$1" > "$_env_file"

    # そのファイルのすべての変数を export するようにして読み込む
    set -a      # 以降に読み込む変数を自動で export
    source "$_env_file"
    set +a
    rm -f "$_env_file"
}

# 指定したファイルから環境変数を unset する
function unset_env() {
    local _unset_target
    local _

    # コメントと空行を除外しつつ、左辺（変数名）だけを読む
    while IFS='=' read -r _unset_target _; do
        [[ -z "$_unset_target" ]] && continue
        unset "$_unset_target"
    done < <(grep -v -E '^[[:space:]]*#|^[[:space:]]*$' "$1")
}

set_env ~/.env_list

#################################################
# Custom Aliases
# WSL2用
#################################################
export BROWSER='/mnt/c/Windows/System32/rundll32.exe url.dll,FileProtocolHandler'
alias open='/mnt/c/Windows/System32/rundll32.exe url.dll,FileProtocolHandler'
alias ii='open'
