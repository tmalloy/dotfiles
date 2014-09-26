export EDITOR='vim'

# fasd setup
eval "$(fasd --init auto)"
alias v='f -e vim'

alias ts="tig status"
alias gst="git status"

alias gbr="git branch -a"

alias gaa="git add --all"
alias gca="git commit -a"

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

alias gpr="git pull --rebase"

alias gp="git push"
alias gpf="git push --force"

alias gs="git stash"
alias gsp="git stash pop"

alias gcia="git commit --amend"

alias gcp="git cherry-pick"
alias gcpa="git cherry-pick --abort"

alias gsprbp="git stash; git pull --rebase; git stash pop"


alias fixairplay="sudo kill `ps -ax | grep 'coreaudiod' | grep 'sbin' |awk '{print $1}'`"

# Prompt
Color_Off="\[\033[0m\]"       # Text ReseT
Yellow="\[\033[0;33m\]"       # Yellow
Green="\[\033[0;32m\]"        # Green
Red="\[\033[0;31m\]"          # Red
IBlack="\[\033[0;90m\]"       # High Intensity Black
Time24="\t"
PathShort="\w"

alias __git_ps1="git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/(\1)/'"
export PS1=$IBlack$Time24$Color_Off" "$Yellow$PathShort$Color_Off'\
$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    # @4 - Clean repository - nothing to commit
    echo "'$Green'" $(__git_ps1); \
  else \
    # @5 - Changes to working tree
    echo "'$Red'" $(__git_ps1); \
  fi)"; \
fi)'$Color_Off"\$ "

# Git auto completion
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi
