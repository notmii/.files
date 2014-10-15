BASE_DIR=$(dirname $(readlink -f $0))

alias=$BASE_DIR/aliases.sh
customs=$BASE_DIR/customs.sh
selecta=$BASE_DIR/selecta
zshrc=$BASE_DIR/zshrc

# Customize to your needs...
if [[ -e $alias ]]; then
    source $alias
fi

if [[ -e $customs ]]; then
    source $customs
fi

if [[ -d $selecta ]]; then
    export PATH="$PATH:$BASE_DIR/selecta/"
fi

if [[ -e $zshrc ]]; then
    source $zshrc
fi
