alias "vim"="nvim"
alias "cvim"="cd ~/.config/nvim; vim init.lua; cd -"
alias "avim"="nvim -u ~/.config/astronvim/entry.lua"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias "vscubing"="~/.local/bin/tmux-vscubing.sh"
source ~/.nvm/nvm.sh
eval "$(oh-my-posh init bash --config /mnt/c/Users/bogda/.oh-my-posh.omp.json)"
eval "$(tmux attach)"

PATH="~/.bun/bin:$PATH"
