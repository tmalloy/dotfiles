export EDITOR='nvim'
export XDG_CONFIG_HOME="$HOME/.config"

if [[ `uname` == 'Darwin' ]]; then
    alias fixairplay="sudo kill `ps -ax | grep 'coreaudiod' | grep 'sbin' |awk '{print $1}'`"
fi

# add our local bin to the path
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
export PATH=$PATH:$DIR/bin

# bell alert sound on mac
alias notify="afplay /System/Library/Sounds/Ping.aiff -v 2"

# quickly launch a clojure nrepl
alias clj-repl="clojure -Sdeps '{:deps {cider/cider-nrepl {:mvn/version \"0.28.6\"}}}' -M -m nrepl.cmdline --middleware [cider.nrepl/cider-middleware]"

# fasd setup
eval "$(fasd --init auto)"
alias v='f -e vim'

# Change the current directory for a tmux session, which determines
# the starting dir for new windows/panes:
function tmux-cwd {
  tmux command-prompt -I $PWD -p "New session dir:" "attach -c %1"
}

alias sb="source ~/.bash_profile"

alias dotfiles="bb --config ~/.dotfiles/bb.edn main"

# git
alias ts="tig status"
alias gst="git status"

alias gbr="git branch -a"

alias gls="git log --pretty=oneline"

alias ga="git add"
alias gaa="git add --all"
alias gca="git commit -a"
alias gcia="git commit --amend"

alias grsh="git reset --hard HEAD"
alias grsh1="git reset --soft HEAD^"

alias grbi="git rebase --interactive"
alias grbc="git rebase --continue"
alias grba="git rebase --abort"
alias grb2="grbi HEAD~2"
alias grb3="grbi HEAD~3"
alias grb4="grbi HEAD~4"
alias grb5="grbi HEAD~5"
alias grb6="grbi HEAD~6"
alias grb7="grbi HEAD~7"
alias grb8="grbi HEAD~8"
alias grb9="grbi HEAD~9"
alias grb10="grbi HEAD~10"
alias grb11="grbi HEAD~11"

alias gpr="git pull-rebase"

alias gp="git push"
alias gpf="git push --force"
alias gpnb="git push-new-branch"

alias gs="git stash"
alias gsp="git stash pop"

alias gsl="git squash-last"
alias gcasl="git commit-all-squash-last"

alias gpfm="git prepare-for-merge"

alias gcp="git cherry-pick"
alias gcpa="git cherry-pick --abort"

alias gsprbp="git stash; git pull --rebase; git stash pop"
function gbd() {
  git push --delete origin $1
  git branch -D $1
}

# .ssh/config auto completion
function _ssh_completion() {
    perl -ne 'print "$1 " if /^Host (.+)$/' ~/.ssh/config
}
if [ -f ~/.ssh/config ]; then
  complete -W "$(_ssh_completion)" ssh
fi

# Git auto completion
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi


# Prompt
Color_Off="\[\033[0m\]"       # Text ReseT
Cyan="\[\033[0;36m\]"          # Red
Purple="\[\033[0;35m\]"          # Red
IBlack="\[\033[0;90m\]"       # High Intensity Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Time24="\t"
User="\u"
Hostname="\h"
PathShort="\w"

alias __git_ps1="git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/\1/'"
export PS1=$IBlack"[ "$User$IBlack"@"$Cyan$Hostname" "$Purple$PathShort$Color_Off'\
$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  printf "'$Cyan' ("$(__git_ps1); \
  echo "$(echo `git status` | grep "nothing to commit\|untracked files present" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    # @4 - Clean repository - nothing to commit
    echo "'$Green' ✓'$Cyan')"; \
  else \
    # @5 - Changes to working tree
    echo "'$Red' ✗'$Cyan')"; \
  fi)"; \
fi)'" "$IBlack$Time24" ]\n$Color_Off\$ "

export PATH="/opt/homebrew/sbin:/opt/homebrew/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"
