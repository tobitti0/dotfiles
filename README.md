this is tobitti's dotfiles.
# environment  
zsh prezto tmux  
# install  
```
cd dotfile
zsh .bin/install.sh
```  
# MEMO  
when generate tmuxline.conf from vim-status-line  
change temporarily .dein/dein.toml  
```
[[plugins]]
repo = 'edkolev/tmuxline.vim'
hook_add = '''
let g:airline#extensions#tmuxline#enabled = 1 #default 0  
```  
