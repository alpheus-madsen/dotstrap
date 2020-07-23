### List and Tree aliases
alias ls="exa --color=always"
alias ll="exa -l --color=always --color-scale"
alias la="exa -la --color=always --color-scale"
alias tree="tree -C"
alias etree="exa -lT --color=always --color-scale"
alias ftree="tree -fCh --du"

### Colorized Search and Less
alias grep="grep --color=always"
alias ag="ag --color"
#alias less="less -RSXM +Gg"  # +Gg ensures that progress % is calculated, but pushes output to top
alias less="less -RSXM"
alias bat="bat --color always"
alias watch="watch -c"

### Givelify Convenience Aliases
alias dockps="grc --colour=on docker ps | less -RSX"
alias dockup="docker-compose up -d && dockps"
alias dockdown="docker-compose down && dockps"
alias makeup="make up && dockps"
alias makedown="make stop && dockps"

### Job and Directory Aliases
#alias js="jobs; echo; dirs -v;"
alias js="jobs"

# I originally tried defining these as "jN", but found
# that I have too much of a Vim mindset for that to
# work well.  I'm too used to typing, say, ":4b", to
# get to the 4th buffer.
alias  j="fg"
alias 1j="fg 1"
alias 2j="fg 2"
alias 3j="fg 3"
alias 4j="fg 4"
alias 5j="fg 5"
alias 6j="fg 6"
alias 7j="fg 7"
alias 8j="fg 8"
alias 9j="fg 9"
alias 10j="fg 10"
alias 11j="fg 11"
alias 12j="fg 12"
alias 13j="fg 13"
alias 14j="fg 14"
alias 15j="fg 15"
alias 16j="fg 16"
alias 17j="fg 17"
alias 18j="fg 18"
alias 19j="fg 19"
alias 20j="fg 20"

# An experiment:  make this even more Vim-like, and
# add a colon in front.  It *may* even be worthwhile
# to change "j" to "b".
alias :js="jobs"
alias  :j="fg"
alias :1j="fg 1"
alias :2j="fg 2"
alias :3j="fg 3"
alias :4j="fg 4"
alias :5j="fg 5"
alias :6j="fg 6"
alias :7j="fg 7"
alias :8j="fg 8"
alias :9j="fg 9"
alias :10j="fg 10"
alias :11j="fg 11"
alias :12j="fg 12"
alias :13j="fg 13"
alias :14j="fg 14"
alias :15j="fg 15"
alias :16j="fg 16"
alias :17j="fg 17"
alias :18j="fg 18"
alias :19j="fg 19"
alias :20j="fg 20"


#alias ds="jobs; echo; dirs -v;"
alias ds="dirs -v"

function kd() {
    if [[ $# > 0 ]]; then
        popd +$1 > /dev/null && dirs -v;
    else
        popd > /dev/null && dirs -v;
    fi
}
function pd() {
    pushd $@ > /dev/null && dirs -v;
}

# Like "Nj", found that typing "Nd" to be
# more natural.
alias  d="pd"
alias 1d="pd +1"
alias 2d="pd +2"
alias 3d="pd +3"
alias 4d="pd +4"
alias 5d="pd +5"
alias 6d="pd +6"
alias 7d="pd +7"
alias 8d="pd +8"
alias 9d="pd +9"
alias 10d="pd +10"
alias 11d="pd +11"
alias 12d="pd +12"
alias 13d="pd +13"
alias 14d="pd +14"
alias 15d="pd +15"
alias 16d="pd +16"
alias 17d="pd +17"
alias 18d="pd +18"
alias 19d="pd +19"
alias 20d="pd +20"

alias dj="jobs; echo; dirs -v;"

#function ls-jobs-dirs() {
function lj {
    # Note that pipes can't be used:  they create a new
    # shell environment, and thus don't have access to the
    # jobs I wish to show!
    less < <(exa -la --color=always --color-scale $@ \
    && echo && jobs && echo && dirs -v)
}

#function lj() {
#    ls-jobs-dirs $@ | less -RSXM
#}
#function lj {
#    LSOUT=`exa -la --color=always --color-scale $@`;
#    JOBSOUT=`jobs`;
#    DIRSOUT=`dirs -v`;
#
#    echo "$LSOUT";
#    echo;
#    echo "$JOBSOUT";
#    echo;
#    echo "$DIRSOUT";
#}

### Directory Fun
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias mkdir="mkdir -pv"

### Experimental Nix Aliases
#alias nix-ls="ls -1 /nix/store | sort -R -t - -k 2 | less -RSXM"
function cnix() {
    cd $1 && nix-env;
}


#### WARNING:  IT MAY MAKE SENSE TO PUT THESE IN A SEPARATE FILE....
# Simple Git Aliases
function git_branch_name() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	echo "${BRANCH}"
}

# Help
read -r -d '' GIT_ALIAS_HELP <<"EOF"
Simple Git Aliases

    gh     Print this help

    ### Branching
    gnew   git init
    gg     git clone
    gb     git branch
    gn     git branch -c (ie, create a new branch and check it out)
    go     git checkout
    gm     git merge
    gp     git push
    gpo    git push --set-upstream origin [CURRENT BRANCH]
    gq     git pull
    gpk    git cherry-pick
    grv    git revert
    gz     git bisect
    gy     git apply
    gtg    git tag
    gcl    git clean
    gw     git stash
    gwp    git stash pop

    ### Committing
    gs     git status
    gss    git status -uno
    ga     git add -p
    gr     git reset -p
    gk     git rm
    gmv    git move
    gd     git diff
    gx     git diff --cached
    gc     git commit

    ### Display Aliases
    gv     git show
    gl     git log
    gt     git ln  --or --  git tree

    ### Hide and view files
    gi     vim .gitignore
    gif    git update-index --assume-unchanged"                    # "git ignore
    gil    git ls-files -v | grep ^[a-z]"                          # "git list-ignored
    gnf    git update-index --no-assume-unchanged"                 # "git notice
    gna    git list-ignored | awk '{print $2}' | xargs git notice" # "git notice-all"
EOF

alias gh="echo \"${GIT_ALIAS_HELP}\""

# Branch management
alias gnew="git init"
alias gg="git clone"
alias gb="git branch"
alias gn="git branch -c"
alias go="git checkout"
alias gp="git push"
alias gpo="git push --set-upstream origin \`git_branch_name\`"
alias gq="git pull"
alias gm="git merge"
alias gpk="git cherry-pick"
alias gmv="git move"
alias grv="git revert"
alias gz="git bisect"
alias gy="git apply"
alias gtg="git tag"
alias gcl="git clean"

# Committing
alias ga="git add -p"
alias gs="git status"
alias gss="git status -uno"
alias gd="git diff"
alias gx="git diff --cached"
alias gr="git reset -p"
alias gk="git rm"
alias gw="git stash"
alias gwp="git stash pop"
alias gc="git commit"

# Display Aliases
alias gv="git show"
alias gl="git log"
alias gt="git log --graph --full-history --all --color --pretty=format:\"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s\""

# Hide and view files
alias gi="vim .gitignore"
alias gif="git update-index --assume-unchanged"                    # "git ignore"
alias gil="git ls-files -v | grep ^[a-z]"                          # "git list-ignored"
alias gnf="git update-index --no-assume-unchanged"                 # "git notice"
alias gna="git list-ignored | awk '{print $2}' | xargs git notice" # "git notice-all""

