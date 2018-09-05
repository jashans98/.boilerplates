" All plugins
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs' " auto close parens
Plug 'vim-airline/vim-airline' " airline status bar
Plug 'morhetz/gruvbox' " gruvbox color scheme
Plug 'rafi/awesome-vim-colorschemes' " awesome colorscheme collection
Plug 'alvan/vim-closetag' " auto close html tags

call plug#end()

" Set up Indenting
set tabstop=4
set shiftwidth=4
set expandtab
set cindent
set cinoptions=g-1
set cino=N-s
set cino+=g0
set cino+=:0
set cino+=t0

" Enable line numbers
set number
set numberwidth=4
set background=dark

" Set up syntax highlighting and encoding
syntax on
colorscheme gruvbox
set encoding=utf8


" Airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:AutoPairs={'(':')', '[':']', '{':'}', '`':'`'}


" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
