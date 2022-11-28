#!/bin/bash
alias gap="git add --patch"
alias gs="git status"
alias gsync="git fetch -tpf && git pull"
alias whitespace="sed 's/ /·/g;s/\t/￫/g;s/\r/⏎/g;s/$/¶/g'"
cpf () {
	TO_COPY=$1
	WHERE_TO_PUT=$2
	FOLDER=$(dirname "$WHERE_TO_PUT")
	mkdir -p "$FOLDER" && cp -r "$TO_COPY" "$WHERE_TO_PUT"
}