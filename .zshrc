
# Lines configured by zsh-newuser-install
export EDITORP=vim #エディタをvimに設定
export LANG=ja_JP.UTF-8 #文字コードをUTF-8に設定

# 色を使用出来るようにする
autoload -Uz colors
colors

# プロンプト設定
# 1行表示
PROMPT="%{${fg[yellow]}%}[%n@%m]%{${reset_color}%} %~ >>> %# "
# 2行表示
# PROMPT="%{${fg[yellow]}%}[%n@%m]%{${reset_color}%} %~
# %# "

# history
HISTFILE=~/work/dotfils/zsh/.zsh_hist
HISTSIZE=1000
SAVEHIST=1000
setopt extended_history #ヒストリに実行時間も保存
setopt hist_ignore_dups #直前と同じコマンドはヒストリに追加しない

#vi ライクな操作ができる
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

#補完機能を有効化
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

#
# setopt
#

# ディレクトリ名だけでcdする
setopt auto_cd

# cdした先のディレクトリをディレクトリスタックに追加
setopt auto_pushd

# pushdしたとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# コマンドのスペルを訂正する
setopt correct

# <Tab>でパス名の補完候補を表示したあと、
# 続けて<Tab>を押すと候補からパス名を選択することができるようになる
zstyle ':completion:*:default' menu select=1

autoload colors
zstyle ':completion:*' list-lolors "${LS_COLORS}"


#エイリアス
alias la='ls -a'
alias ll='ls -l'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

alias vz='vim ~/work/dotfiles/zsh/.zshrc'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        ;;
esac

# cdの後にlsを実行
chpwd() { ls -ltrG  }

# 補完候補のメニュー選択で、矢印キーの代わりにhjklで移動出来るようにする。
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char


# End of lines added by compinstall

source /usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=~/.virtualenvs

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"



