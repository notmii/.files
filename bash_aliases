search() {
    grep --color=always -srn --exclude-dir=public/build --exclude=tags --exclude=cscope.out $1 .; find -name $1 -type f
}

update-production() {
    HAS_CHANGES=$(git status --porcelain 2>/dev/null|egrep "^( M|M)"|wc -l)
    [[ $HAS_CHANGES > 0 ]] && git stash

    CURRENT_BRANCH=$(git branch|grep "^*"|awk '{print $2}')
    git checkout production
    git pull

    echo "Updating CSCOPE"
    find -type f  \( \
        -name '*.js' \
        -o -name '*.php' \
        -o -name '*.css' \
        -o -name '*.htm' \) \
        -and -not \( -path "./scripts/build-assets/*" \
            -o -path "./public/build/*" \) \
        > cscope.files

    cscope -b -q -U -i cscope.files
    ctags -R --fields=+afikKlmnsSzt --extra=+fq --totals

    rm cscope.files

    git checkout $CURRENT_BRANCH
    [[ $HAS_CHANGES > 0 ]] && git stash pop
    clear
    git status
}

sgrep() {
    for FILE in $(grep -lrs --exclude-dir=public/build --exclude-dir=scripts/build-assets --exclude=tags --exclude="cscope.*" --exclude="*.min.css" --exclude="*.min.less" $2 "$1" .); do
        echo -e "\n\e[1;33m$FILE\e[0m"
        cat $FILE | grep -C 1 -ns --color=always $2 "$1" | sed 's/^/    /' -u -l 50
    done
}

nginx-restart() {
    if [[ -f /run/nginx.pid ]]; then
        sudo kill $(cat /run/nginx.pid)
    fi

    sudo nginx
    cat /run/nginx.pid
}

php-fpm-restart() {
    if [[ -f /run/php-fpm.pid ]]; then
        sudo kill $(cat /run/php-fpm.pid)
    fi

    sudo php-fpm
    cat /run/php-fpm.pid
}

alias lah='la -h'
alias las='ls -ah'
alias cp='rsync --progress -hs'

