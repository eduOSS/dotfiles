" setting for plugings ---------------------- {{{
augroup plugin_pathogen
    execute pathogen#infect()
    syntax on
    filetype plugin indent on
augroup END

augroup plugin_nerdtree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
    " can i just add this snappet to the source of nerdtree?
    :set modifiable
    "crazy! I run into a problem like this one:
    "http://stackoverflow.com/a/9706469/3552975
augroup END
" }}}

" For all files ---------------------- {{{
augroup basic_setting
    :set pastetoggle=<F3>
    :set number
    :set relativenumber
    :set numberwidth=3

    let mapleader = ','
    let maplocalleader = '\\'

    nnoremap <leader>ev :vsplit $MYVIMRC<cr>
    nnoremap <leader>sv :source $MYVIMRC<cr>
    :set foldlevelstart=0
augroup END
" }}}

" For several file types---------------------- {{{
augroup filetype_markdown
    au BufNewFile *.mkd 0r ~/vim/skeleton.mkd
    autocmd BufNewFile,BufRead *.md set filetype=markdown
    :onoremap ih :<c-U>execute "normal! ?^--\\+$:nohlsearch\rkvg_"<cr>
    autocmd FileType markdown nnoremap <silent> <buffer> <localleader>s :set spell!<CR>
augroup end

augroup filetype_vim
    autocmd VimEnter * echo "I'm Leo `>^.^<`" 
    autocmd VimEnter * NERDTree
    autocmd VimEnter * wincmd p
    autocmd FileType markdown iabbrev @@ fanle_2013@163.com 
    autocmd FileType markdown iabbrev lsig -- <cr>Leo Adams<cr>fanle_2013@163.com
    autocmd FileType markdown   :iabbrev <buffer> kbd <kbd></kbd><left><left><left><left><left><left>
    autocmd FileType vim setlocal foldmethod=marker
augroup end

augroup filetype_python
    autocmd FileType python     :iabbrev <buffer> iff if:<left>
    autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>
    autocmd FileType python     nnoremap <buffer> <localleader>c 0x
augroup end
" }}}

" For futher asking---------------------- {{{
augroup almost_ready
    "vnoremap <localleader>d y<esc>(yas :'<,'> w! >> /home/leo/Documents/corpora/myvoca.dt<cr>
    "vnoremap <localleader>a execute "normal! "ay<esc>"byas" | let @a=substitute(@a,'\n',' ','g')\r | let @b=substitute(@b,'\n',' ','g')\r | sp /home/leo/Documents/corpora/myvoca.dt\rG"apGo<esc>"bpGo<esc>"#pGo<esc> | w\rZZ
    "expand('%:t')
    ":set cmdheight=2
    "inoremap <c-u> <esc>b<c-v>e~i
    "set matchtime=3
    "onoremap in@ :<c-u>execute "normal! /\v^[\w._%+-]+@[\w.-]+.\w{2,4}$" . ":nohlsearch"<cr>
augroup end
" }}}
