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

if [[ -w /usr/local/bin/karma ]]; then
    ###-begin-karma-completion-###
    #
    # karma command completion script
    # This is stolen from NPM. Thanks @isaac!
    #
    # Installation: karma completion >> ~/.bashrc  (or ~/.zshrc)
    # Or, maybe: karma completion > /usr/local/etc/bash_completion.d/karma
    #

    if type complete &>/dev/null; then
      __karma_completion () {
        local si="$IFS"
        IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                               COMP_LINE="$COMP_LINE" \
                               COMP_POINT="$COMP_POINT" \
                               karma completion -- "${COMP_WORDS[@]}" \
                               2>/dev/null)) || return $?
        IFS="$si"
      }
      complete -F __karma_completion karma
    elif type compdef &>/dev/null; then
      __karma_completion() {
        si=$IFS
        compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                     COMP_LINE=$BUFFER \
                     COMP_POINT=0 \
                     karma completion -- "${words[@]}" \
                     2>/dev/null)
        IFS=$si
      }
      compdef __karma_completion karma
    elif type compctl &>/dev/null; then
      __karma_completion () {
        local cword line point words si
        read -Ac words
        read -cn cword
        let cword-=1
        read -l line
        read -ln point
        si="$IFS"
        IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                           COMP_LINE="$line" \
                           COMP_POINT="$point" \
                           karma completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
        IFS="$si"
      }
      compctl -K __karma_completion karma
    fi
    ###-end-karma-completion-###
fi
