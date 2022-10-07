"
" @author Maciej Bedra

" Configuration for Neovim out of the box
source /root/.config/nvim/general/settings.vim
source /root/.config/nvim/general/keys.vim
let mapleader = "\<Space>"

" Neovim extensions
call plug#begin('/root/.config/nvim/plugins')
  Plug 'morhetz/gruvbox'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'mhinz/vim-startify'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'chriskempson/base16-vim'
  Plug 'tpope/vim-fugitive'
  " Plug 'stsewd/fzf-checkout.vim'
  Plug 'airblade/vim-gitgutter'
  " Plug 'ap/vim-css-color'
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'puremourning/vimspector'
  " Plug 'jwalton512/vim-blade'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'easymotion/vim-easymotion'
  Plug 'akinsho/toggleterm.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
  Plug 'nvim-telescope/telescope-project.nvim'
  Plug 'nvim-telescope/telescope-file-browser.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
  Plug 'yaegassy/coc-blade', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'joshdick/onedark.vim'
  " Plug 'glepnir/oceanic-material'
  " Plug 'rafi/awesome-vim-colorschemes'
  " Plug 'joshdick/onedark.vim'


call plug#end()


" Extensions configuration
" source /root/.config/nvim/gruvbox/gruvbox.vim
source /root/.config/nvim/vimspector/vimspector.vim
source /root/.config/nvim/airline/airline.vim
source /root/.config/nvim/nerdtree/nerdtree.vim
source /root/.config/nvim/nerdtree/nerdtree-git.vim
source /root/.config/nvim/startify/startify.vim
source /root/.config/nvim/telescope/telescope.vim
" source /root/.config/nvim/fzf/fzf.vim
" source /root/.config/nvim/git/fzf-checkout.vim
source /root/.config/nvim/treesitter/treesitter.vim
source /root/.config/nvim/coc/coc.vim
source /root/.config/nvim/coc/extensions.vim
source /root/.config/nvim/git/fugitive.vim
source /root/.config/nvim/term/term.vim


"-----------------------old----------------------------------------


" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

if has('nvim')
	set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
	set inccommand=nosplit
	noremap <C-q> :confirm qall<CR>
end



"deal with colors
if !has('gui_running')
	set t_Co=256
endif
if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
	" screen does not (yet) support truecolor
	set termguicolors
endif
" Colors
" set background=dark

set termguicolors
hi Normal ctermbg=NONE
" Get syntax
syntax on

" Plugin settings
let g:secure_modelines_allowed_items = [
			\ "textwidth",   "tw",
			\ "softtabstop", "sts",
			\ "tabstop",     "ts",
			\ "shiftwidth",  "sw",
			\ "expandtab",   "et",   "noexpandtab", "noet",
			\ "filetype",    "ft",
			\ "foldmethod",  "fdm",
			\ "readonly",    "ro",   "noreadonly", "noro",
			\ "rightleft",   "rl",   "norightleft", "norl",
			\ "colorcolumn"
			\ ]

" Base16
let base16colorspace=256
" Lightline
let g:lightline = { 'colorscheme': 'wombat' }
let g:lightline = {
			\ 'component_function': {
			\   'filename': 'LightlineFilename',
			\ },
			\ }
function! LightlineFilename()
	return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" from http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
endif
if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif

" Javascript
let javaScript_fold=0

" Java
let java_ignore_javadoc=1

set encoding=utf-8
set fileencoding=utf-8

" Latex
"let g:latex_indent_enabled = 1
"let g:latex_fold_envs = 0
"let g:latex_fold_sections = []

" Open hotkeys
"map <C-p> :Files<CR>
map <C-l> :VimtexCompile<CR>
nmap <leader>; :Buffers<CR>

" Quick-save
nmap <leader>w :w<CR>

" Don't confirm .lvimrc
let g:localvimrc_ask = 0

" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" Golang
let g:go_play_open_browser = 0
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_bin_path = expand("~/dev/go/bin")

" =============================================================================
" # Editor settings
" =============================================================================
filetype plugin indent on
set autoindent
set timeoutlen=300 " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set encoding=utf-8
set scrolloff=2
set noshowmode
set hidden
set nowrap
set nojoinspaces
let g:sneak#s_next = 1
set printfont=:h10
set printencoding=utf-8
set printoptions=paper:letter
" Always draw sign column. Prevent buffer moving when adding/deleting sign.
set signcolumn=yes

" Settings needed for .lvimrc
set exrc
set secure

" Sane splits
set splitright
set splitbelow

" Permanent undo
set undodir=~/.vimdid
set undofile

" Decent wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor

" Use wide tabs
set shiftwidth=8
set softtabstop=8
set tabstop=8
set noexpandtab

" Wrapping options
set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=r " continue comments when pressing ENTER in I mode
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in insert mode, and do not wrap old long lines

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Very magic by default
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/

" =============================================================================
" # GUI settings
" =============================================================================
set guioptions-=T " Remove toolbar
set vb t_vb= " No more beeps
set backspace=2 " Backspace over newlines
set nofoldenable
set ttyfast
" https://github.com/vim/vim/issues/1735#issuecomment-383353563
set lazyredraw
set synmaxcol=500
set laststatus=2
set relativenumber " Relative line numbers
set number " Also show current absolute line
set diffopt+=iwhite " No whitespace in vimdiff
" Make diffing better: https://vimways.org/2018/the-power-of-diff/
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic
set colorcolumn=88 " and give me a colored column
set showcmd " Show (partial) command in status line.
set mouse=a " Enable mouse usage (all modes) in terminals
set shortmess+=c " don't give |ins-completion-menu| messages.
set nospell

" Show those damn hidden characters
" Verbose: set listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
set listchars=nbsp:¬,extends:»,precedes:«,trail:•

" =============================================================================
" # Keyboard shortcuts
" =============================================================================
" ; as :


set spellfile=~/.config/nvim/spell/en.utf-8.add
" Ctrl+c and Ctrl+j as Esc
" Ctrl-j is a little awkward unfortunately:
" https://github.com/neovim/neovim/issues/5916
" So we also map Ctrl+k
"the same instences"

nnoremap <C-k> <Esc>
inoremap <C-k> <Esc>
vnoremap <C-k> <Esc>
snoremap <C-k> <Esc>
xnoremap <C-k> <Esc>
cnoremap <C-k> <Esc>
onoremap <C-k> <Esc>
lnoremap <C-k> <Esc>
tnoremap <C-k> <Esc>

nnoremap <C-c> <Esc>
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>
snoremap <C-c> <Esc>
xnoremap <C-c> <Esc>
cnoremap <C-c> <Esc>
onoremap <C-c> <Esc>
lnoremap <C-c> <Esc>
tnoremap <C-c> <Esc>

" Ctrl+h to stop searching
vnoremap <C-h> :nohlsearch<cr>
nnoremap <C-h> :nohlsearch<cr>

"inoremap <leader>v <C-v>
"nnoremap <leader>v <C-v>
" Suspend with Ctrl+f
"inoremap <C-f> :sus<cr>
"vnoremap <C-f> :sus<cr>
"nnoremap <C-f> :sus<cr>

" Jump to start and end of line using the home row keys
map H ^
map L $

" Neat X clipboard integration
" ,p will paste clipboard into buffer
" ,c will copy entire buffer into clipboard
"noremap <leader>p :read !xsel --clipboard --output<cr>
noremap <leader>p  "+p
"noremap <leader>[  :Files<cr>
noremap <leader>h  :nohlsearch<cr>
noremap <leader>c  "+y
"noremap <leader>c :w !xsel -ib<cr><cr>

map <leader>y ZL
" <leader>s for Rg search
"noremap <leader>s :Rg
"let g:fzf_layout = { 'down': '~20%' }


"command! -bang -nargs=* Rg
"  \ call fzf#vim#grep(
"  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
"  \   <bang>0 ? fzf#vim#with_preview('up:60%')
"  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"  \   <bang>0)

function! s:list_cmd()
	let base = fnamemodify(expand('%'), ':h:.:S')
	return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', shellescape(expand('%')))
endfunction

"command! -bang -nargs=? -complete=dir Files
" " \ call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
" \                               'options': '--tiebreak=index'}, <bang>0)


" Open new file adjacent to current file
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" Move by line
nnoremap j gj
nnoremap k gk

" 'Smart' nevigation
" nmap <silent> F <Plug>(ale_lint)
" nmap <silent> <C-l> <Plug>(ale_detail)
" nmap <silent> <C-g> :close<cr>


" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" <leader>, shows/hides hidden characters
nnoremap <leader>, :set invlist<cr>

" <leader>q shows stats
nnoremap <leader>q g<c-g>

" Keymap for replacing up to next _ or -
noremap <leader>m ct_

" I can type :help on my own, thanks.
map <F1> <Esc>
imap <F1> <Esc>


" =============================================================================
" # Autocommands
" =============================================================================

" Prevent accidental writes to buffers that shouldn't be edited
autocmd BufRead *.orig set readonly
autocmd BufRead *.pacnew set readonly

" Leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste

" Jump to last edit position on opening file
if has("autocmd")
	" https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
	au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Follow Rust code style rules
au Filetype rust source ~/.config/nvim/scripts/spacetab.vim
au Filetype rust set colorcolumn=100

" Help filetype detection
autocmd BufRead *.plot set filetype=gnuplot
autocmd BufRead *.md set filetype=markdown
autocmd BufRead *.lds set filetype=ld
autocmd BufRead *.tex set filetype=tex
autocmd BufRead *.trm set filetype=c
autocmd BufRead *.xlsx.axlsx set filetype=ruby

" Script plugins
" ===========================================================================
" # Plugin Configuration
" ===========================================================================o

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 0
let g:vimtex_compiler_progname = 'nvr'

noremap <F3> :call CocAction('format')<CR>
noremap <leader>t :call CocAction('format')<CR>


" "automatically closing the scratch window at the top of the vim window on
" finishing a complete or leaving insert
"


" =============================================================================
" # Footer
" =============================================================================

" nvim
if has('nvim')
	runtime! plugin/python_setup.vim
endif


" colorscheme base16-gruvbox-dark-hard
" colorscheme base16-onedark
" colorscheme base16-harmonic-dark


"==============================================================
" # This is for COC
" =============================================================
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
"let g:syntastic_python_checkers = ['pylint','mypy']
let g:syntastic_php_checkers = ["php", "phpcs", "phpmd"]

set t_ut=

" fix php in write
"autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
let g:php_cs_fixer_path='~/php-cs-fixer.phar'
let g:php_cs_fixer_php_path = "php"               " Path to PHP
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_rules = "@PSR2"          " options: --rules (default:@PSR2)


autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()


" fzf
"nnoremap <c-p> :GFiles<cr>

"nmap <C-n> :NERDTreeToggle<CR>
"nmap <leader>n :NERDTreeFind<CR>
nmap <leader>b :bdelete<CR>
nmap <leader>d :Gvdiffsplit<CR>
nmap <leader>i :CocCommand editor.action.organizeImport<CR>
" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd w<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
nmap <leader>j :wincmd w<CR>


let g:coc_global_extensions = [
			\ 'coc-snippets',
			\ 'coc-pairs',
			\ 'coc-tsserver',
			\ 'coc-eslint',
			\ 'coc-prettier',
			\ 'coc-json',
			\ 'coc-pyright',
			\ 'coc-css',
			\ 'coc-html',
			\ 'coc-phpls',
			\ 'coc-vetur',
			\'coc-explorer'
			\]


" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300


" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)


augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> ,a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>a  :<C-u>CocDiagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> ,c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> ,p  :<C-u>CocListResume<R>

"nmap <leader>f <Plug>(coc-fix-current)

let g:kite_supported_languages = []

" Override highlight setting.
"highlight SpelunkerSpellBad cterm=underline ctermfg=247 gui=underline guifg=#9e9e9e
"highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=underline guifg=NONE
"let g:enable_spelunker_vim_on_readonly = 1

nmap <leader>e :CocCommand explorer<CR>

autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType ruby setlocal ts=2 sts=2 sw=2
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType vue setlocal ts=2 sts=2 sw=2
autocmd FileType php setlocal ts=4 sts=4 sw=4


"""" Status ""



function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ }]

"autocmd BufNewFile,BufRead *.blade.php set ft=html


" Find files using Telescope command-line sugar.
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>; <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


lua << EOF
require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    file_ignore_patterns = {"node_modules", "static/", "dist/"},
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker

    colorscheme = {
      enable_preview = true
    },
    buffers = {
       sort_mru = true,
       ignore_current_buffer = true
    }
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
    project = {
      base_dirs = {
        --'~/inertia-frontend',
        --{'~/dev/src3', max_depth = 4},
      },
      hidden_files = true -- default: false

      },
     fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
  }
}

--require('telescope').load_extension('media_files')

require'telescope'.load_extension('project')
--$HOME/.local/share/nvim/telescope-projects.txt
--require'telescope'.load_extension("tele_tabby")
require("telescope").load_extension "file_browser"
--require('nvim-terminal').setup()
require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal

  open_mapping = [[<Leader>j]],
  hide_numbers = false, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 3, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = false,
  insert_mappings =false, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'float', --| 'horizontal' | 'window' | 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = "bash", -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border =  'curved', --'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}
EOF


nnoremap <Leader>m :lua require('telescope').extensions.media_files.media_files()<cr>
nnoremap <Leader>ww  :lua require'telescope'.extensions.project.project{ display_type = 'full' }<CR>


"nnoremap <Leader>t :Telescope tele_tabby list<cr>
nnoremap <Leader>, :lua require'telescope.builtin'.builtin{}<cr>

nnoremap  <leader>ff :lua require('telescope').extensions.file_browser.file_browser()<CR>

" terminal it is perfered to use another config in lua file 
" set
"let g:toggleterm_terminal_mapping = '<Leader>'
" or manually...
"autocmd TermEnter term://*toggleterm#*
"      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2
"nnoremap <silent><Leader>t <Cmd>exe v:count1 . "ToggleTerm"<CR>
"inoremap <silent><Leader>t <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
nnoremap <Leader>k :ToggleTermToggleAll<CR>
tnoremap <Leader>k :ToggleTermToggleAll<CR>


if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <M-[> <Esc>
  tnoremap <C-v><Esc> <Esc>
endif

if has('nvim')
  " Terminal mode:
  tnoremap <M-h> <c-\><c-n><c-w>h
  tnoremap <M-j> <c-\><c-n><c-w>j
  tnoremap <M-k> <c-\><c-n><c-w>k
  tnoremap <M-l> <c-\><c-n><c-w>l
  " Insert mode:
  inoremap <M-h> <Esc><c-w>h
  inoremap <M-j> <Esc><c-w>j
  inoremap <M-k> <Esc><c-w>k
  inoremap <M-l> <Esc><c-w>l
  " Visual mode:
  vnoremap <M-h> <Esc><c-w>h
  vnoremap <M-j> <Esc><c-w>j
  vnoremap <M-k> <Esc><c-w>k
  vnoremap <M-l> <Esc><c-w>l
  " Normal mode:
  nnoremap <M-h> <c-w>h
  nnoremap <M-j> <c-w>j
  nnoremap <M-k> <c-w>k
  nnoremap <M-l> <c-w>l
endif

noremap <c-z> <nop>
tnoremap <F1> <c-c>

colorscheme base16-gruvbox-dark-medium

" let g:oceanic_material_transparent_background=1
" let g:oceanic_material_allow_bold = 1
" let g:oceanic_material_allow_underline = 1
" let g:oceanic_material_allow_undercurl=1
" let g:oceanic_material_allow_reverse = 1


inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
" remap for complete to use tab and <cr>
inoremap <silent><expr> <TAB>
\ coc#pum#visible() ? coc#pum#next(1):
\ <SID>check_back_space() ? "\<Tab>" :
\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

hi CocSearch ctermfg=12 guifg=#18A3FF
hi CocMenuSel ctermbg=109 guibg=#13354A


" highlight TelescopeSelection      guifg=#D79921 gui=bold " Selected item
" highlight TelescopeSelectionCaret guifg=#CC241D          " Selection caret
" highlight TelescopeMultiSelection guifg=#928374          " Multisections
" highlight TelescopeNormal         guibg=#00000           " Floating windows created by telescope
" highlight TelescopeMatching       guifg=yellow

