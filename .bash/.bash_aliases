### List and Tree aliases
alias ls="exa --color=always"
alias ll="exa -l --color=always --color-scale"
alias la="exa -la --color=always --color-scale"
alias tree="tree -Ca"
alias etree="exa -lTa --color=always --color-scale"
alias ftree="tree -fCha --du"

### Colorized Search and Less
alias grep="grep --color=always"
alias ag="ag --color"
#alias less="less -RSXM +Gg"  # +Gg ensures that progress % is calculated, but pushes output to top
alias less="less -RSXM"
alias bat="bat --color always"
alias watch="watch -c"

### Givelify Convenience Aliases (for Docker)
alias dockps="grc --colour=on docker ps | less -RSX"
alias dockup="docker-compose up -d && dockps"
alias dockdown="docker-compose down && dockps"
alias makeup="make up && dockps"
alias makedown="make stop && dockps"

# Editor aliases
alias :e="vim"
alias enw="emacs -nw"  # Emacs No Windows
alias ses="emacs -nw"  # Simple Emacs Spreadsheet Mode



### Job Aliases
#alias js="jobs; echo; dirs -v;"
#alias js="jobs"
alias jf="fg"
alias jb="bg"

# "soft terminate" a Job ID
function jk() {
    if [[ $# > 0 ]]; then
        for jid in "$@"
        do
            kill -s SIGTERM %$jid;
        done
    else
        # If Job IDs aren't specified, show jobs
        jobs
    fi
}

### Job and Directory Aliases

## js -- show current jobs
##
## For convenience, the Directory stack is also shown, but it's shown first
## so that the eye can immediately see the jobs; also, they are labeled
## so that it could be easier to see when one list or the other is empty.

#alias js="jobs"
alias js="echo '    __dirs__'; dirs -v; echo; echo '    __jobs__'; jobs;"

# I originally tried defining these as "jN", but found
# that I have too much of a Vim mindset for that to
# work well.  I'm too used to typing, say, ":4b", to
# get to the 4th buffer.
alias 0j="fg"
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

alias 1jk="jk 1"
alias 2jk="jk 2"
alias 3jk="jk 3"
alias 4jk="jk 4"
alias 5jk="jk 5"
alias 6jk="jk 6"
alias 7jk="jk 7"
alias 8jk="jk 8"
alias 9jk="jk 9"
alias 10jk="jk 10"
alias 11jk="jk 11"
alias 12jk="jk 12"
alias 13jk="jk 13"
alias 14jk="jk 14"
alias 15jk="jk 15"
alias 16jk="jk 16"
alias 17jk="jk 17"
alias 18jk="jk 18"
alias 19jk="jk 19"
alias 20jk="jk 20"


# An experiment:  make this even more Vim-like, and
# add a colon in front.  It *may* even be worthwhile
# to change "j" to "b".
alias :js="jobs"
alias :0j="fg"
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

alias :js="jobs"
alias :jf="fg"
alias :jb="bg"
alias :jk="jk"



#### Directory Forth
# "dp()" should probably be renamed to "d()"
function dp() {
    pushd $@ > /dev/null && dirs -v;
}


## ds -- show current directory stack
##
## For convenience, current jobs is also shown, but it's shown first
## so that the eye can immediately see the directories; also, they are labeled
## so that it could be easier to see when one list or the other is empty.

#alias ds="dirs -v"
alias ds="echo '    __jobs__'; jobs; echo; echo '    __dirs__'; dirs -v;"

function dk() {
    if [[ $# > 0 ]]; then
        popd +$1 > /dev/null && dirs -v;
    else
        popd > /dev/null && dirs -v;
    fi
}
function dp() {
    pushd $@ > /dev/null && dirs -v;
}

alias  d="dp"
alias 1d="dp +1"
alias 2d="dp +2"
alias 3d="dp +3"
alias 4d="dp +4"
alias 5d="dp +5"
alias 6d="dp +6"
alias 7d="dp +7"
alias 8d="dp +8"
alias 9d="dp +9"
alias 10d="dp +10"
alias 11d="dp +11"
alias 12d="dp +12"
alias 13d="dp +13"
alias 14d="dp +14"
alias 15d="dp +15"
alias 16d="dp +16"
alias 17d="dp +17"
alias 18d="dp +18"
alias 19d="dp +19"
alias 20d="dp +20"

alias dj="jobs; echo; dirs -v;"
alias jd="jobs; echo; dirs -v;"

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

### Job Search Helps

#### mc -- make company contact
# mc company-name position-applied source-of-opportunity
function mc() {
	mkdir "IN-PROGRESS--$1--$2--$3"
	pushd "IN-PROGRESS--$1--$2--$3"  > /dev/null
	echo
	echo
	echo "WELCOME TO IN-PROGRESS--$1--$2--$3 ... Remember to dk when done!"
}

#### cf -- confirm company contact
# cf company-contact-directory
function cf() {
	if [ -d "$1" ]; then
		# replace "IN-PROGRESS" with a date-and-time-stamp
		printf -v prefix "%(%F-%H%M-%a)T" -1
		stamping=$(echo "$1" | sed "s/^IN-PROGRESS/${prefix,,}/")
		mv $1 $stamping
	else
		# Ignore non-directories
		echo "$1 is not a directory"
	fi
}


#### WARNING:  IT MAY MAKE SENSE TO PUT THESE IN A SEPARATE FILE....
#### Simple Git Aliases
# NOTE:  THIS CAN BE DONE SIMPLY NOW WITH `git branch --show-current`.
#
# This is left here both for "historical" reasons and because it's currently used
# by the prompt.  Due to the nature of this function, however, this will *necessarily*
# mean the branch will be highlighted in green in the promp; if I want it to be a
# different color (for now, I don't really care), I will need to use the command
# just above this note.
#
# Funny idea:  instead of (or maybe in addition to) the little markers that show
# the current status of the branch, it might be interesting to color-code the
# branch name itself!
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
    gn     git checkout -b (ie, create a new branch and check it out)
    go     git checkout
    gm     git merge

    gp     git push
    (gpo    git push --set-upstream origin [CURRENT BRANCH])
    (gpo    git push origin HEAD)
    gy     git pull (ie, \"git yank from origin\")
    gpk    git cherry-pick

    gw     git stash (ie, save WIP)
    gwp    git stash pop
    gwl    git stash list
    gwa    git stash apply
    gwk    git stash drop (ie, git stash \"kill\")

    grv    git revert
    gz     git bisect
    gap    git apply
    gtg    git tag
    gcl    git clean

    ### Display Aliases
    gv     git show
    gl     git log
    gt     git ln  --or--  git tree

    ### Hide and view files
    gi     vim .gitignore
    gif    git ignore        (ie, git update-index --assume-unchanged)
    gil    git list-ignored  (ie, git ls-files -v | grep ^[a-z])
    gnf    git notice        (ie, git update-index --no-assume-unchanged)
    gna    git notice-all    (ie, git list-ignored | awk '{print $2}' | xargs git notice)

    ### Committing
    gs     git status
    gso    git status -uno

    ga     git add -p
    gf     git add (ie, git add [FILE])
    gr     git reset -p
    gra    git reset (ie, git \"reset all\")
    gk     git rm
    gmv    git mv

    gd     git diff
    gx     git diff --cached
    gc     git commit
EOF

alias gh="less \"${GIT_ALIAS_HELP}\""

# Branch management
alias gnew="git init"
alias gg="git clone"
alias gb="git branch"
alias gn="git checkout -b"
alias go="git checkout"
alias gp="git push"
alias gpo="git push --set-upstream origin $(git branch --show-current)"
#alias gpo="git push origin HEAD"
alias gy="git pull"
alias gm="git merge"
alias gpk="git cherry-pick"
alias gmv="git mv"
alias grv="git revert"
alias gz="git bisect"
alias gap="git apply"
alias gtg="git tag"
alias gcl="git clean"

# Committing
alias ga="git add -p"
alias gf="git add"
alias gs="git status"
alias gso="git status -uno"
alias gd="git diff"
alias gx="git diff --cached"
alias gr="git reset -p"
alias gra="git reset"
alias gk="git rm"
alias gw="git stash"
alias gwp="git stash pop"
alias gwl="git stash list"
alias gwa="git stash apply"
alias gwk="git stash drop"
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
