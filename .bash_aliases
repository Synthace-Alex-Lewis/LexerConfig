#!/bin/bash
alias gap="git add --patch"
alias gs="git status"
alias gsync="git fetch -tpf && git pull"
alias gm="git commit -m"
alias gam="git commit --amend --no-edit"
alias whitespace="sed 's/ /·/g;s/\t/￫/g;s/\r/⏎/g;s/$/¶/g'"
cpf () {
	TO_COPY=$1
	WHERE_TO_PUT=$2
	FOLDER=$(dirname "$WHERE_TO_PUT")
	mkdir -p "$FOLDER" && cp -r "$TO_COPY" "$WHERE_TO_PUT"
}

if [ ! -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
	echo "performing first time set-up installing bash git prompt"
	git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
fi

if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    export GIT_PROMPT_ONLY_IN_REPO=0
    source "$HOME/.bash-git-prompt/gitprompt.sh"
fi