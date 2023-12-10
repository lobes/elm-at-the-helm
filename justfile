SRC_DIR         := "./src"

default:
    @just --list

live:
    echo "> Launching elm-live..."
    elm-live {{SRC_DIR}}/Main.elm -v -o -p 7777

debug:
    echo "> Debugging elm-live..."
    elm-live {{SRC_DIR}}/Main.elm -v -o -p 7777 -- --debug

build:
    echo "> Compiling..."
    elm make {{SRC_DIR}}/Main.elm --optimize

repl:
    echo "> Entering repl <"
    elm repl

docs:
    echo "> Serving docs..."
    elm-doc-preview {{SRC_DIR}}/Main.elm -p 3333 -d
