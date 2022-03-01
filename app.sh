#!/usr/bin/env bash

main () {
    cmd="${1}"
    extra="${@:2}"
    case $cmd in
        "build") stack build;;
        "run") stack run -- "$extra";;
        "test") stack test;;
        "coverage") stack coverage;;
    esac
}

main "$@"
