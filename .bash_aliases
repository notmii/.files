srch() {
    grep --color=always -srn --exclude-dir=public/build --exclude=tags --exclude=cscope.out $1 .; find -name $1 -type f
}

alias search=srch
alias arcd="arc diff --preview --allow-untracked production"
alias lah='la -h' 
alias las='ls -ah'
