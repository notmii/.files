srch() {
    grep --color=auto -srn --exclude-dir=public/build --exclude=tags $1 .; find -name $1
}

alias search=srch
alias arcp="arc diff --preview --allow-untracked production"
alias lah='la -h' 
alias las='ls -ah'
