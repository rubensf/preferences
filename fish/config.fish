function reload
  source ~/.config/fish/config.fish
end

set -xg PATH /opt/homebrew/opt/openjdk@21/bin $PATH
set -xg PATH /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin $PATH
set -xg PATH /opt/homebrew/bin $PATH
set -xg PATH /Users/rfarias/Library/Python/3.9/bin $PATH
set -xg PATH $HOME/.config/fish/bin $PATH
set -xg PATH $HOME/.local/bin $PATH
set -xg PATH $HOME/.atuin/bin $PATH
set -xg JAVA_HOME (/usr/libexec/java_home -v 21)
set -xg EDITOR nvim
set -xg SHELL /opt/homebrew/bin/fish

alias gai "git add go/src/improbable.io"
alias gcm "git commit -m"
alias grb "git rebase master"
alias gup "git push --set-upstream origin (git symbolic-ref --short HEAD)"
alias gpf "git push --force-with-lease --set-upstream origin (git symbolic-ref --short HEAD)"
alias gco "git checkout"
alias gst "git stash"
alias gsp "git stash pop"
alias ghm "cd (git rev-parse --show-toplevel)"

set -xg LSCOLORS GxBxhxDxfxhxhxhxhxcxcx

if status --is-interactive
  rbenv init - --no-rehash fish | source

  set -xg FZF_CTRL_R_COMMAND _atuin_search
  fzf --fish | source
  atuin init fish --disable-up-arrow --disable-ctrl-r | source
end
