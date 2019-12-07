syntax on
set number
set backupdir=~/.vim/backup,/tmp
set wrapscan
set guifont=Menlo\ for\ Powerline
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
