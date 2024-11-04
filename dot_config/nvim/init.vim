
""""""""""""""""""""""""""""""
"" TODO
""""""""""""""""""""""""""""""

" Put words in quotes with a command
" Vim Autosave
" Insert one line above shortcut
" Understand how set hidden works
" Configure vim-airline
" Configure vim-startify
"
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Key Bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " leader key
    let mapleader = ' '
    nnoremap <SPACE> <Nop>

    " consistent Y behavior
    nnoremap Y y$

    noremap <leader>1 1gt
    noremap <leader>2 2gt
    noremap <leader>3 3gt
    noremap <leader>4 4gt
    noremap <leader>5 5gt
    noremap <leader>6 6gt
    noremap <leader>7 7gt
    noremap <leader>8 8gt
    noremap <leader>9 9gt
    noremap <leader>0 :tablast<cr>

    " close buffer without closing the window
    nnoremap <LEADER>q :BD<CR>

    " plugin bindings
    noremap <leader>/ :Commentary<cr>

    " open ranger
    map <leader>f :RangerWorkingDirectory<CR>
    map <leader>F :RangerCurrentFile<CR>


    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gr <Plug>(coc-references)
    xmap <leader>b  <Plug>(coc-format-selected)
    nmap <leader>b  <Plug>(coc-format-selected)

    " disable useless ex-mode
    nnoremap Q <nop>

    " hide search highlighting
    nnoremap <silent> <CR> :nohlsearch<CR>:call SearchantStop()<CR><C-L>

    nnoremap <leader>o o<Esc>
    nnoremap <leader>O O<Esc>

    nnoremap <leader>[ :bprevious<CR>
    nnoremap <leader>] :bnext<CR>

    " Edit vimr configuration file
    nnoremap <leader>ve :e $MYVIMRC<CR>
    " " Reload vimr configuration file
    nnoremap <leader>vr :source $MYVIMRC<CR>

    :imap <A-BS> <C-W>
    :nmap <A-BS> <C-W>

    :nmap <Left> <C-W>W
    :nmap <Right> <C-W>w
    " :nmap <Right> <C-W><C-S-W>
    ":TmuxNavigateLeft<cr>
    " :nmap <Up> :TmuxNavigateUp<cr>
    " :nmap <Right> :TmuxNavigateRight<cr>
    " :nmap <Down> :TmuxNavigateDown<cr>
    :command WQ wq
    :command Wq wq
    :command W w
    :command Q q


    :command RM :!rm "%:p"


    nnoremap <silent> <leader>g :LazyGit<CR>


""""""""""""""""""""""""""""""
"" General Options
""""""""""""""""""""""""""""""
    " explicitly tell vim that the terminal supports 256 colors
    set t_Co=256

    " faster redrawing
    set ttyfast

    " autoreload files
    set autoread

    " set X lines to the cursors - when moving vertical
    set scrolloff=7
    set scrolloff=999

    set encoding=UTF-8

    " set history length
    set history=1000

    " keep undo history
    set undofile

    " enhanced command line completion
    set wildmenu
    " complete files like a shell
    set wildmode=list:longest

    " make backspace behave in a sane manner
    set backspace=indent,eol,start

    " use MacOS clipboard
    set clipboard=unnamed

    " enable mouse if possible
    if has('mouse')
        set mouse=a
    endif

    set nobackup
    set nowritebackup

    " set backupdir=~/.tmp,~/tmp,/var/tmp,/tmp
    set directory=~/.tmp,~/tmp,/var/tmp,/tmp

    " allow to navigate one character more at the EOL
    set virtualedit=onemore


    set timeoutlen=500

    " update time after editing stop to call plugins
    set updatetime=300

    "Reduce delay when switching out of insert mode
    set ttimeoutlen=0

    " set vim's shell to default's shell
    set shell=$SHELL

    " avoid hit-enter prompts
    if (v:version > 800 || has('nvim'))
        set shortmess+=c
    endif

    " Unknown
    if v:version > 800
        set diffopt+=vertical,iwhite,internal,algorithm:patience,hiddenoff
    endif
    set hidden " current buffer can be put into background


    " Pyenv
    if $DW_ARCH_MODE == 'rosetta'

        let g:python_host_prog = "~/.pyenv_intel/versions/neovim2/bin/python"
        let g:python3_host_prog = "~/.pyenv_intel/versions/neovim3/bin/python"
    elseif $DW_ARCH_MODE == 'arm'
        let g:python_host_prog = "~/.pyenv_arm/versions/neovim2/bin/python"
        let g:python3_host_prog = "~/.pyenv_arm/versions/neovim3/bin/python"
    else
        let g:python_host_prog = "~/.pyenv/versions/neovim2/bin/python"
        let g:python3_host_prog = "~/.pyenv/versions/neovim3/bin/python"
    endif

    vnoremap <silent> . :normal .<CR>

    " Run macros
    nnoremap <silent> <F2> @q
    nnoremap <silent> <F3> @@


    """"""""""""""""""""""""""
    " Appearence
    """"""""""""""""""""""""""
        " set cursorline

        " set good colors
        if has('termguicolors')
          set termguicolors
        endif

       " show the status line all the time
       set laststatus=2

       " set terminal title
       set title

       " show vertical rules
       set colorcolumn=120

       " open new split panes to right and bottom, which feels more natural than Vim’s default:
       set splitbelow
       set splitright

       " show line numbers
       set number

       " numbers relative to the current position
       " set relativenumber

       " highlight syntax
       syntax on

       " show incomplete commands
       set showcmd

       " don't show which mode
       set noshowmode

       " command bar height
       set cmdheight=1

       " show matching braces
       set showmatch

       " how many tenths of a second to blink when matching brackets
       set mat=2

       " always show left-side bar (for git, linters, etc)
       if (v:version > 800 || has("nvim"))
           set signcolumn=yes
       endif

    """"""""""""""""""""""""""
    " Tab control
    """"""""""""""""""""""""""
        " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
        set smarttab

        " the visible width of tabs
        set tabstop=4

        " edit as if the tabs are 4 characters wide
        set softtabstop=4

        " number of spaces to use for indent and unindent
        set shiftwidth=4

        " round indent to a multiple of 'shiftwidth'
        set shiftround

        " automatically set indent of new line
        set autoindent

        " expand tabs
        set expandtab

        " https://stackoverflow.com/questions/19320747/prevent-vim-from-indenting-line-when-typing-a-colon-in-python
        autocmd FileType python setlocal indentkeys-=<:>
        autocmd FileType python setlocal indentkeys-=:

        " enable language specific indent
        filetype plugin indent on
    """"""""""""""""""""""""""
    " Wrapping
    """"""""""""""""""""""""""

        " turn on line wrapping
        set wrap

        " wrap lines when coming within n characters from side
        set wrapmargin=0

        set formatoptions-=t

        " set soft wrapping
        set linebreak

        " show ellipsis at breaking
        set showbreak=…

    """"""""""""""""""""""""""
    " Search and Replace
    """"""""""""""""""""""""""

        " case insensitive searching
        set ignorecase

        " case-sensitive if expresson contains a capital letter
        set smartcase

        " highlight search results
        set hlsearch

        " set incremental search, like modern browsers
        set incsearch

        " don't redraw while executing macros
        set lazyredraw

        set magic " Set magic on, for regex

        if (has('nvim'))
            " show results of substition as they're happening
            " but don't open a split
            set inccommand=nosplit
        endif

    """"""""""""""""""""""""""
    " Error bells
    """"""""""""""""""""""""""

        set noerrorbells
        set visualbell
        set t_vb=

    """"""""""""""""""""""""""
    " Invisible characters
    """"""""""""""""""""""""""

        set list
        set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
        set showbreak=↪

    """"""""""""""""""""""""""
    " Custom functions
    """"""""""""""""""""""""""

        func! ToggleBG()
            let &background = ( &background == "dark"? "light" : "dark" )
            if &background == 'dark'
                hi InactiveWindow ctermbg=235 guibg=#282828
                hi ActiveWindow ctermbg=234 guibg=#1d2021

                set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow

                au VimEnter,WinEnter,BufEnter,BufWinEnter,FocusGained * setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
                au VimLeave,WinLeave,BufLeave,FocusLost * setlocal winhighlight=Normal:InactiveWindow,NormalNC:InactiveWindow
            else
                hi InactiveWindow ctermbg=229 guibg=#fbf1c7
                hi ActiveWindow ctermbg=230 guibg=#f9f5d7

                set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow

                au VimEnter,WinEnter,BufEnter,BufWinEnter,FocusGained * setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
                au VimLeave,WinLeave,BufLeave,FocusLost * setlocal winhighlight=Normal:InactiveWindow,NormalNC:InactiveWindow
            endif
        endfun

        " trim trailing whitespaces on save
        func! TrimWhitespace()
            let l:save = winsaveview()
            keeppatterns %s/\s\+$//e
            call winrestview(l:save)
        endfun

        augroup AutoTrim
            autocmd!
            autocmd BufWritePre * :call TrimWhitespace()
        augroup END

        " indent to 2 spaces for yaml
        augroup Yaml
            autocmd!
            autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
        augroup END

        function! ProcessFileChangedShell()
            if v:fcs_reason == 'mode' || v:fcs_reason == 'time'
                let v:fcs_choice = ''
            else
                let v:fcs_choice = 'ask'
            endif
        endfunction
        autocmd FileChangedShell <buffer> call ProcessFileChangedShell()

        " autocmd FocusGained * checktime

    """"""""""""""""""""""""""
    " Plugins
    """"""""""""""""""""""""""
        " Disable netrw
        let loaded_netrwPlugin = 1

        Plug 'nvim-lua/plenary.nvim'
        Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

        " use closest .git dir as root
        Plug 'airblade/vim-rooter'

        " highlight search under cursor
        " Plug 'timakro/vim-searchant'
        " autocmd CursorMoved * call SearchantStop()
        function SearchantStop()
            " :execute "normal \<Plug>SearchantStop"
        endfunction

        " open read-only files with sudo
        Plug 'lambdalisue/suda.vim'
        let g:suda_smart_edit = 1


        " indent text objects
        Plug 'michaeljsmith/vim-indent-object'

        " and even more text objects (and motions) for python
        Plug 'jeetsukumaran/vim-pythonsense'

        " close buffer without closing the window
        Plug 'qpkorr/vim-bufkill'

        " comment lines with one command
        Plug 'tpope/vim-commentary'

        " python 'black' formatter
        Plug 'psf/black', { 'tag': '*' }
        let g:black_linelength = 120
        let g:black_virtualenv = "~/.pyenv/versions/neovim3"

        " highlight word under cursor
        Plug 'RRethy/vim-illuminate'
        " hi illuminatedWord cterm=underline gui=underline
        " hi illuminatedWord guibg=#ff00ff ctermbg=1

        " ranger integration
        Plug 'francoiscabrol/ranger.vim'
        Plug 'rbgrouleff/bclose.vim'
        let g:ranger_map_keys = 0
        let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'

       """"""""""""""""""""""""""
       " Text utils
       """"""""""""""""""""""""""
       " modern surround
       Plug 'machakann/vim-sandwich'

       " more funny (no) general text objects
       Plug 'wellle/targets.vim'

       """"""""""""""""""""""""""
       " Appearence
       """"""""""""""""""""""""""

       " Plug 'sainnhe/everforest'
       " let g:everforest_background = 'hard'  " soft / medium / hard
       " let g:everforest_better_performance = 1
       " let g:everforest_dim_inactive_windows = 1
       " let g:everforest_show_eob = 1
       " let g:everforest_enable_italic = 1
       " let g:everforest_disable_italic_comment = 0
       " let g:everforest_ui_contrast = 'low' " high
       " let g:everforest_float_style = 'dim' " bright
       " let g:everforest_diagnostic_text_highlight = 0
       " " let g:everforest_colors_override = {'bg0': ['#000000', '234'], 'bg2': ['#282828', '235']}
       Plug 'dasupradyumna/midnight.nvim'
       Plug 'chriskempson/base16-vim'
       " Plug 'jmoggee/mirage.vim'

       " Plug 'TaDaa/vimade'
       " let g:vimade = {}
       " let g:vimade.fadelevel = 0.7
       " let g:vimade.enablesigns = 1

       " customize start screen
       "Plug 'mhinz/vim-startify'

       " status bar
       Plug 'vim-airline/vim-airline'
       Plug 'vim-airline/vim-airline-themes'

       " let g:airline_theme=''
       " let g:airline_theme='tokyonight'
       " let g:airline_theme='nord'
       " let g:airline_theme='shades_of_purple'
       " let g:airline_theme = 'everforest'
       let g:airline_theme = 'base16_synth_midnight_dark'
       " let g:airline_theme = 'base16_paraiso'

       let g:airline_powerline_fonts = 1
       let g:airline#extensions#tabline#enabled = 1
       let g:airline#extensions#tabline#show_tab_type = 1
       " let g:airline#extensions#tabline#show_splits = 1 "enable/disable displaying open splits per tab (only when tabs are opened). >
       let g:airline#extensions#tabline#show_buffers = 1 " enable/disable displaying buffers with a single tab
       " let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
       " let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
       let g:airline#extensions#coc#enabled = 1
       let g:airline#extensions#coc#error_symbol = 'E:'
       let g:airline#extensions#coc#warning_symbol = 'W:'
       let g:airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
       let g:airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

       " sexy scrolling
       " Plug 'psliwka/vim-smoothie'

       " sexy window switching
       " Plug 'camspiers/animate.vim'
       " Plug 'camspiers/lens.vim'
       " let g:lens#width_resize_max = 120
       "
       """"""""""""""""""""""""""
       " Session
       """"""""""""""""""""""""""
       Plug 'tpope/vim-obsession'

       """"""""""""""""""""""""""
       " Tmux
       """"""""""""""""""""""""""

            Plug 'christoomey/vim-tmux-navigator'
            Plug 'tmux-plugins/vim-tmux'
            Plug 'melonmanchan/vim-tmux-resizer'
            " Plug 'tmux-plugins/vim-tmux-focus-events'

            let g:tmux_navigator_no_mappings = 1
            nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
            nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
            nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
            nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
            " https://github.com/christoomey/vim-tmux-navigator/pull/172
            tnoremap <silent> <A-h>     <C-W>:TmuxNavigateLeft<cr>
            tnoremap <silent> <A-j>     <C-W>:TmuxNavigateDown<cr>
            tnoremap <silent> <A-k>     <C-W>:TmuxNavigateUp<cr>
            tnoremap <silent> <A-l>     <C-W>:TmuxNavigateRight<cr>

           let g:tmux_resizer_no_mappings = 1

           nnoremap <M-H> :TmuxResizeLeft<cr>
           nnoremap <M-J> :TmuxResizeDown<cr>
           nnoremap <M-K> :TmuxResizeUp<cr>
           nnoremap <M-L> :TmuxResizeRight<cr>

        """"""""""""""""""""""""""
        " Telescope
        """"""""""""""""""""""""""
            " Plug 'nvim-lua/popup.nvim'
            " Plug 'nvim-lua/plenary.nvim'
            " Plug 'nvim-telescope/telescope.nvim'
            " Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

            " nmap <silent> <leader>t <cmd>Telescope find_files<cr>

            " require('telescope').setup {
            "     extensions = {
            "         fzf = {
            "         fuzzy = true,                    -- false will only do exact matching
            "         override_generic_sorter = false, -- override the generic sorter
            "         override_file_sorter = true,     -- override the file sorter
            "         case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            "                                         -- the default case_mode is "smart_case"
            "         }
            "     }
            " }
            " require('telescope').load_extension('fzf')
            " nmap <silent> <leader>t :Telescope find_files<cr>

        """"""""""""""""""""""""""
        " FZF
        """"""""""""""""""""""""""

            if !empty(glob("/usr/local/opt/fzf"))
                Plug '/usr/local/opt/fzf'
            else
                Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
            endif

            Plug 'junegunn/fzf.vim'

            " let g:fzf_layout = { 'down': '~50%' }
            let g:fzf_layout = { 'window': 'call FloatingFZF()' }
            function! FloatingFZF()
                let buf = nvim_create_buf(v:false, v:true)
                call setbufvar(buf, '&signcolumn', 'no')

                let height = &lines - 8
                let width = float2nr(&columns - (&columns * 2 / 10))
                let col = float2nr((&columns - width) / 2)

                let opts = {
                        \ 'relative': 'editor',
                        \ 'row': 4,
                        \ 'col': col,
                        \ 'width': width,
                        \ 'height': height
                        \ }

                call nvim_open_win(buf, v:true, opts)
            endfunction

            function! DisableSmoothie()
                if exists('g:loaded_smoothie')
                    let g:smoothie_enabled = g:loaded_smoothie
                    let g:loaded_smoothie = 0
                endif
            endfunction

            function! EnableSmoothie()
                if exists('g:smoothie_enabled') && g:smoothie_enabled
                    let g:loaded_smoothie = 1
                endif
            endfunction

            command! FzfFiles call DisableSmoothie() | Files | call EnableSmoothie()

            " nmap <silent> <leader>T :Files<cr>
            nmap <silent> <leader>T :FzfFiles<cr>

            nnoremap <silent> <C-g> :Files<CR>

            if isdirectory(".git")
                " if in a git project, use :GFiles
                nmap <silent> <leader>t :GitFiles --cached --others --exclude-standard<cr>
                nmap <silent> <C-p> :GitFiles --cached --others --exclude-standard<cr>
            else
                " otherwise, use :FZF
                nmap <silent> <leader>t :FZF<cr>
                nmap <silent> <C-p> :FZF<cr>
            endif

            nmap <silent> <leader>b :Buffers<cr>

            " command! -bang -nargs=* Rg
            " \ call fzf#vim#grep(
            " \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
            " \   <bang>0 ? fzf#vim#with_preview('up:60%')
            " \           : fzf#vim#with_preview('right:60%'),
            " \   <bang>0)

        """"""""""""""""""""""""""
        " DevIcons
        """"""""""""""""""""""""""

            Plug 'ryanoasis/vim-devicons'

            let g:WebDevIconsOS = 'Darwin'
            let g:WebDevIconsUnicodeDecorateFolderNodes = 1
            let g:DevIconsEnableFoldersOpenClose = 1
            let g:DevIconsEnableFolderExtensionPatternMatching = 1

        """"""""""""""""""""""""""
        " Autocomplete, linting, etc
        """"""""""""""""""""""""""
            Plug 'tpope/vim-dadbod'
            Plug 'kristijanhusak/vim-dadbod-ui'

            let g:dbs = {
                \  'local': 'postgres://podb_master@localhost:5432/podb01_sb00'
            \ }
            let g:db_ui_use_nerd_fonts = 1



            Plug 'Exafunction/codeium.vim'
            let g:copilot_proxy = ''
            let g:copilot_enabled = v:false
            Plug 'github/copilot.vim'
            Plug 'neoclide/coc.nvim', {'branch': 'release'}
            " inoremap <silent><expr> <TAB>
            "     \ coc#pum#visible() ? coc#_select_confirm() :
            "     \ coc#expandableOrJumpable() ?
            "     \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            "     \ <SID>check_back_space() ? "\<TAB>" :
            "     \ coc#refresh()
            "
            "

            " function! s:check_back_space() abort
            "     let col = col('.') - 1
            "     return !col || getline('.')[col - 1]  =~# '\s'
            " endfunction

            " let g:coc_snippet_next = '<tab>'

            " inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"


            " " Use <c-space> to trigger completion.
            " " inoremap <silent><expr> <c-space> coc#refresh()

            " " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
            " " Coc only does snippet and additional edit on confirm.
            " inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

            " " Use `[g` and `]g` to navigate diagnostics
            " nmap <silent> [g <Plug>(coc-diagnostic-prev)
            " nmap <silent> ]g <Plug>(coc-diagnostic-next)
            " nmap <silent> <leader>m <Plug>(coc-diagnostic-info)


            " " Use K to show documentation in preview window
            " nnoremap <silent> K :call <SID>show_documentation()<CR>

            " function! s:show_documentation()
            " if (index(['vim','help'], &filetype) >= 0)
            "     execute 'h '.expand('<cword>')
            " else
            "     call CocAction('doHover')
            " endif
            " endfunction

            " " Highlight symbol under cursor on CursorHold
            " autocmd CursorHold * silent call CocActionAsync('highlight')

            " " Remap for rename current word
            " nmap <leader>rn <Plug>(coc-rename)

            " augroup mygroup
            " autocmd!
            " " Setup formatexpr specified filetype(s).
            " autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
            " " Update signature help on jump placeholder
            " autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
            " augroup end

            " " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
            " xmap <leader>a  <Plug>(coc-codeaction-selected)
            " nmap <leader>a  <Plug>(coc-codeaction-selected)

            " " Remap for do codeAction of current line
            " nmap <leader>ac  <Plug>(coc-codeaction)
            " " Fix autofix problem of current line
            " nmap <leader>qf  <Plug>(coc-fix-current)

            " " Create mappings for function text object, requires document symbols feature of languageserver.
            " xmap if <Plug>(coc-funcobj-i)
            " xmap af <Plug>(coc-funcobj-a)
            " omap if <Plug>(coc-funcobj-i)
            " omap af <Plug>(coc-funcobj-a)

            " " Use `:Format` to format current buffer
            " command! -nargs=0 Format :call CocAction('format')

            " " Use `:Fold` to fold current buffer
            " command! -nargs=? Fold :call     CocAction('fold', <f-args>)

            " " use `:OR` for organize import of current buffer
            " command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

            " " Add status line support, for integration with other plugin, checkout `:h coc-status`
            " set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

            " " Using CocList
            " " Show all diagnostics
            " nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
            " " Manage extensions
            " nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
            " " Show commands
            " nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
            " " Find symbol of current document
            " nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
            " " Search workspace symbols
            " nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
            " " Do default action for next item.
            " nnoremap <silent> <space>j  :<C-u>CocNext<CR>
            " " Do default action for previous item.
            " nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
            " " Resume latest coc list
            " nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

        """"""""""""""""""""""""""
        " Other
        """"""""""""""""""""""""""

        Plug 'kdheepak/lazygit.nvim'


        """"""""""""""""""""""""""
        " Try
        """"""""""""""""""""""""""

            " Plug 'justinmk/vim-sneak'
            " let g:sneak#label = 1

            " Plug 'moll/vim-bbye' " replace bufkil?

            """"""""""""""""""""""""""
            " Fugitive
            """"""""""""""""""""""""""

                " Plug 'tpope/vim-fugitive'
                " Plug 'tpope/vim-rhubarb' " github extension for fugitive

                " nmap <silent> <leader>gs :Gstatus<cr>
                " nmap <leader>ge :Gedit<cr>
                " nmap <silent><leader>gr :Gread<cr>
                " nmap <silent><leader>gb :Gblame<cr>

                " Plug 'sodapopcan/vim-twiggy'
                " Plug 'junegunn/gv.vim'
                " Plug 'tommcdo/vim-fubitive'

call plug#end()

" colorscheme everforest
colorscheme midnight
set background=dark
" colorscheme base16-paraiso
" set background=dark
" set background=light

" ! uncomment
" hi InactiveWindow ctermbg=235 guibg=#282828
" hi ActiveWindow ctermbg=234 guibg=#1d2021

" hi LineNr ctermfg=140 ctermbg=235 guifg=#A599E9 guibg=#28284E
set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow

au VimEnter,WinEnter,BufEnter,BufWinEnter,FocusGained * setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
au VimLeave,WinLeave,BufLeave,BufWinLeave,FocusLost * setlocal winhighlight=Normal:InactiveWindow,NormalNC:InactiveWindow

" " BufWinLeave triggers on popups and doesn't revert
" au VimEnter,WinEnter,BufEnter,BufWinEnter,FocusGained * setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
" au VimLeave,WinLeave,BufLeave,FocusLost * setlocal winhighlight=Normal:InactiveWindow,NormalNC:InactiveWindow

" au VimEnter,WinEnter,BufEnter,BufWinEnter,FocusGained * " au VimLeave,WinLeave,BufLeave,FocusLost * setlocal winhighlight=Normal:InactiveWindow,NormalNC:InactiveWindow
" au VimEnter,WinEnter,BufEnter,BufWinEnter,FocusGained * setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
" au VimLeave,WinLeave,BufLeave,FocusLost * setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow

" hi Search guibg=red guifg=black
" hi SearchCurrent guibg=#00ff00
" autocmd! VimLeave,WinLeave,BufLeave,FocusLost *

" vim:set foldmethod=marker foldlevel=0
