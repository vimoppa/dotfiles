#!/usr/bin/env bash

##################################################################
# Remove vim and zsh plugins
##################################################################


readonly VIM_PLUGIN_DIR="vim/pack/plugins/start"
readonly __GIT_MODULES_DIR=".git/modules/$VIM_PLUGIN_DIR"

# if argument at $2 is empty, display error and exit.
function is_empty() {
    if [ -z $2 ]
    then
        printf "\nError: '%s' is required.\n" $1
        exit 1
    fi
}

# TODO: backup plugin befor cleaup, handle interrup
# safely recover if failed to remove plugin successfully.
function safe_recovery() {
    return
}

function print_help() {
    printf "
Help:
\tOptions:
\t\t-v|--vim: uninstall vim plugin
\t\t-z|--zsh: uninstall zsh plugin
\t\t-h|--help: print out this error message
\tArgument:
\t\tname...: one or more names of plugins to uninstall\n"
}

function check_plugin_source() {
    if [ ! -e $VIM_PLUGIN_DIR/$1 ] && [ ! -e $__GIT_MODULES_DIR/$1 ]
    then
        printf "\nAborted: plugin source missing. \n"
        exit 1
    fi
}

function confirm() {
    printf "\n\tAre you sure you want to delete vim plugin '%s' ? y/N: " $1
    read answer

    is_empty $answer "input"

    if [[ $answer != "y" ]]
    then
        if [[ $answer == "N" ]] || [[ $answer == "n" ]]
        then
            printf "\nAborted!\n"
            exit 1
        fi
        printf "\nError: Invalid input!\n"
        exit 1
    fi
}

function cleanup_vim_plugins() {
    readonly local PLUGIN_NAME=$1

    is_empty $1 "plugin-name"

    check_plugin_source $1

    confirm $PLUGIN_NAME

    declare -a operations

    operations[0]="git submodule deinit -f $VIM_PLUGIN_DIR"
    operations[1]="git rm -f $VIM_PLUGIN_DIR"
    operations[2]="rm -Rf $__GIT_MODULES_DIR"

    for op in "${operations[@]}"
    do
        eval "$op/$PLUGIN_NAME"
    done
}

function run() {
    cleanup_vim_plugins $@
}


# TODO: handle vim and zsh plugin cleaup
function root_run() {
    case $1 in
        -v | --vim)

            echo "vim"
            echo $1
            shift
            ;;
        -z | --zsh)
            echo "zsh"
            echo $1
            shift
            ;;
        -h | --help)
            print_help
            exit 0
            ;;
        *)
            print_help
            exit 1
            ;;
    esac
}

run $@
