srch() {
    grep --color=auto -srn --exclude-dir=public/build --exclude=tags $1 .; find -name $1 -type f
}

alias search=srch
alias arcd="arc diff --preview --allow-untracked production"
alias lah='la -h' 
alias las='ls -ah'
