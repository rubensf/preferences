# Annoying NVIM opening inside itself.
function nvimm
  if test -z $NVIM_LISTEN_ADDRESS
    /usr/bin/nvim $argv
  else
    set -l currp (pwd)
    python -c "from neovim import attach; file = '$argv[-1]'; file = file if file.startswith('/') else '$currp/'+file; nvim = attach('socket', path='$NVIM_LISTEN_ADDRESS'); nvim.comm
  end
end
