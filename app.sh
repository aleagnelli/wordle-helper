#!/usr/bin/env bash

main () {
    cmd="${1}"
    extra="${@:2}"
    case $cmd in
        "build") make build;;
        "run")
            make build
            stack run -- "$extra"
            ;;
        "test") make test;;
        "coverage") make coverage;;
    esac
}

main "$@"