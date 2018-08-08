function reload
  source ~/.config/fish/config.fish
end

# Install nvr first!
function nvim
  if test -z $NVIM_LISTEN_ADDRESS
    /usr/local/bin/nvim $argv
  else
    which nvr > /dev/null; and nvr --remote-tab $argv
  end
end

alias gai "git add go/src/improbable.io"
alias gcm "git commit -m"
alias grb "git rebase master"
alias gup "git push --set-upstream origin (git symbolic-ref --short HEAD)"
alias gpf "git push --force --set-upstream origin (git symbolic-ref --short HEAD)"
alias gco "git checkout"
alias gst "git stash"
alias gsp "git stash pop"
