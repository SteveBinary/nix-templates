set shell := ["zsh", "-cu"]

@default:
    just --version
    just --list --unsorted

format:
    nix fmt --no-update-lock-file *.nix **/*.nix
