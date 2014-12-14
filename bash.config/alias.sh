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
alias composer='composer -v'
alias gr='noglob grep -ns'
alias rgr='noglob rgrep -ns --exclude-dir public/build --exclude *.tags --exclude-dir public/tests'
alias amux='tmux attach'
alias httpserver='python -m SimpleHTTPServer'
