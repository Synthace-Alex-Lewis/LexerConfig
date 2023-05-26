# Go

First install?
 1. create "$HOME/sdk"
    ```sh
    mkdir "$HOME/sdk" && cd "$HOME/sdk"
    ```
 2. Install from https://go.dev/dl/
    ```sh
    mkdir go1.20.4 && cd go1.20.4
    wget https://go.dev/dl/go1.20.4.linux-amd64.tar.gz
    tar -xzf go1.20.4.linux-amd64.tar.gz
    mv go go1.20.4
    mv go1.20.4.linux-amd64.tar.gz go1.20.4/go1.20.4.linux-amd64.tar.gz
    ```
 3. Then edit this snippet to point to that go version you just installed (already correct for 1.20.4)
 4. Finally re-load
 ``` sh
 source ~/.bashrc
 ```

# Git

## [bash-git-prompt](https://github.com/magicmonty/bash-git-prompt)

use [.bashrc_snippet](https://github.com/Synthace-Alex-Lewis/LexerConfig/blob/main/bash/.bashrc_snippet)

1.
    ```
    git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
    ```
2. copy snippet