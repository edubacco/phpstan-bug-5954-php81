This repo contains a small project to reproduce the bug in phpstan/phpstan [issue 5954](https://github.com/phpstan/phpstan/issues/5954)

# Prerequisites
    - make
    - docker >= 20.10.8

# Usage
Run `make init && make phpstan-bug` to reproduce the bug.
If you want to open a shell in the container, run `make shell`
