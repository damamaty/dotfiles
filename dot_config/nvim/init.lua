vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Detect the operating system
local is_windows = jit.os == "Windows"
local is_mac = jit.os == "OSX"
local is_linux = jit.os == "Linux"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

--- -------------------------------------------------------------------------------------------------------------------
--- Keybindings
--- -------------------------------------------------------------------------------------------------------------------

--- -------------------------------------------------------------------------------------------------------------------
--- Keybindings --- Core
--- -------------------------------------------------------------------------------------------------------------------

-- Map <leader>1 to <leader>9 to switch to tabs 1 to 9
for i = 1, 9 do
  vim.keymap.set('n', '<leader>' .. i, i .. 'gt')
end

-- Map <leader>0 to switch to the last tab
vim.keymap.set('n', '<leader>0', ':tablast<CR>')

-- Buffer navigation
vim.keymap.set('n', '<leader>[', ':bprevious<CR>')
vim.keymap.set('n', '<leader>]', ':bnext<CR>')

-- Nvim Pane Navigation: Meta + up/down/right/left
vim.keymap.set("n", "<M-h>", "<C-w>h", { silent = true })    -- h - Navigate Right
vim.keymap.set("n", "<M-j>", "<C-w>j", { silent = true })    -- j - Navigate Down
vim.keymap.set("n", "<M-k>", "<C-w>k", { silent = true })    -- k - Navigate Up
vim.keymap.set("n", "<M-l>", "<C-w>l", { silent = true })    -- l - Navigate Left

-- Escape in terminal for command mode
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })

-- Insert a new line without entering insert mode
vim.keymap.set('n', '<leader>o', 'o<Esc>')
vim.keymap.set('n', '<leader>O', 'O<Esc>')

-- Disable the Ex mode
vim.keymap.set('n', 'Q', '<nop>')

-- Hide search highlighting
vim.keymap.set('n', '<CR>', ':nohlsearch<CR><C-L>', { silent = true })

-- Map Alt-Backspace to delete the previous word in insert and normal modes
vim.keymap.set('i', '<A-BS>', '<C-W>')
vim.keymap.set('n', '<A-BS>', '<C-W>')

-- Navigate between windows using arrow keys
vim.keymap.set('n', '<Left>', '<C-W>W')
vim.keymap.set('n', '<Right>', '<C-W>w')

-- Create user commands for common actions
vim.api.nvim_create_user_command('WQ', 'wq', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Q', 'q', {})

-- Close buffer without closing the window
vim.keymap.set('n', '<leader>q', ':BD<CR>')

-- Disable the spacebar in normal mode
vim.keymap.set('n', '<Space>', '<Nop>')

-- Make 'Y' behave like 'D' and 'C', yanking to the end of the line
vim.keymap.set('n', 'Y', 'y$')

-- Repeat the last change in visual mode using '.'
vim.keymap.set('v', '.', ':normal .<CR>', { silent = true })

--- -------------------------------------------------------------------------------------------------------------------
--- Keybindings --- Plugins
--- -------------------------------------------------------------------------------------------------------------------

--- -------------------------------------------------------------------------------------------------------------------
--- Keybindings --- Plugins --- coc.nvim
--- -------------------------------------------------------------------------------------------------------------------

vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true })
vim.keymap.set('x', '<leader>b', '<Plug>(coc-format-selected)')
vim.keymap.set('n', '<leader>b', '<Plug>(coc-format-selected)')

--- -------------------------------------------------------------------------------------------------------------------
--- Keybindings --- Plugins --- codeium
--- -------------------------------------------------------------------------------------------------------------------

vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })

--- -------------------------------------------------------------------------------------------------------------------
--- Keybindings --- Plugins --- fzf-lua
--- -------------------------------------------------------------------------------------------------------------------

vim.keymap.set('n', '<leader>t', '<cmd>FzfLua files<CR>', { noremap = true, silent = true, desc = 'FzfLua Files' })
vim.keymap.set('n', '<leader>r', '<cmd>FzfLua live_grep<CR>', { noremap = true, silent = true, desc = 'FzfLua Live Grep' })

vim.api.nvim_create_user_command('Files', 'FzfLua files', { desc = 'Search files with FzfLua' })
vim.api.nvim_create_user_command('Rg', 'FzfLua live_grep', { desc = 'Live grep with FzfLua' })


--- -------------------------------------------------------------------------------------------------------------------
--- Keybindings --- Plugins --- tmux
--- -------------------------------------------------------------------------------------------------------------------

-- Tmux Navigator Key Mappings
vim.keymap.set('n', '<M-h>', ':TmuxNavigateLeft<CR>', { silent = true })
vim.keymap.set('n', '<M-j>', ':TmuxNavigateDown<CR>', { silent = true })
vim.keymap.set('n', '<M-k>', ':TmuxNavigateUp<CR>', { silent = true })
vim.keymap.set('n', '<M-l>', ':TmuxNavigateRight<CR>', { silent = true })

-- Terminal mode mappings
vim.keymap.set('t', '<M-h>', '<C-\\><C-n>:TmuxNavigateLeft<CR>', { silent = true })
vim.keymap.set('t', '<M-j>', '<C-\\><C-n>:TmuxNavigateDown<CR>', { silent = true })
vim.keymap.set('t', '<M-k>', '<C-\\><C-n>:TmuxNavigateUp<CR>', { silent = true })
vim.keymap.set('t', '<M-l>', '<C-\\><C-n>:TmuxNavigateRight<CR>', { silent = true })

--- -------------------------------------------------------------------------------------------------------------------
--- Keybindings --- Plugins --- Misc
--- -------------------------------------------------------------------------------------------------------------------

vim.keymap.set('', '<leader>/', ':Commentary<CR>', { desc = 'Toggle Comment' })
vim.keymap.set('n', '<leader>g', ':LazyGit<CR>', { silent = true, desc = 'Open LazyGit' })

--- -------------------------------------------------------------------------------------------------------------------
--- Vim Settings
--- -------------------------------------------------------------------------------------------------------------------

--- -------------------------------------------------------------------------------------------------------------------
--- Vim Settings --- Core
--- -------------------------------------------------------------------------------------------------------------------

vim.opt.clipboard = 'unnamedplus'

-- Allow navigating one character beyond the end of line
vim.opt.virtualedit = 'onemore'

-- Enable hidden buffers
vim.opt.hidden = true

-- Automatically reload files when changed outside of Vim
vim.opt.autoread = true

-- Keep the cursor centered vertically
vim.opt.scrolloff = 999

-- Set command history length
vim.opt.history = 1000

-- Enable persistent undo
vim.opt.undofile = true

-- Enhanced command-line completion
vim.opt.wildmenu = true
vim.opt.wildmode = 'list:longest'

-- Make backspace behave in a sane manner
vim.opt.backspace = { 'indent', 'eol', 'start' }

-- Enable mouse support
vim.opt.mouse = 'a'

-- Disable backup files
vim.opt.backup = false
vim.opt.writebackup = false

-- Set swap file directory
vim.opt.directory = { '~/.tmp', '~/tmp', '/var/tmp', '/tmp' }

-- Set timeouts
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 0

-- Set update time for triggering events (e.g., CursorHold)
vim.opt.updatetime = 300

-- Use the system's default shell
if is_windows then
    if vim.fn.executable('powershell') == 1 then
        vim.o.shell = 'powershell'
    else
        vim.o.shell = vim.env.SHELL or 'sh'
    end
else
    vim.opt.shell = vim.env.SHELL or 'sh'
end

-- Avoid hit-enter prompts for completion messages
vim.opt.shortmess:append('c')

-- Improve diff options
vim.opt.diffopt:append { 'vertical', 'iwhite', 'internal', 'algorithm:patience', 'hiddenoff' }

-- Set Python host programs (adjust paths as needed)
if is_windows then
  vim.g.python3_host_prog = vim.fn.expand('~\\.pyenv-win-venv\\envs\\neovim3\\Scripts\\python.exe')
else
  vim.g.python3_host_prog = vim.fn.expand('~/.pyenv/versions/neovim3/bin/python')
end


--- -------------------------------------------------------------------------------------------------------------------
--- Vim Settings --- Tab Control
--- -------------------------------------------------------------------------------------------------------------------

-- Smart tab behavior
vim.opt.smarttab = true

-- Set tab width
vim.opt.tabstop = 4

-- Set soft tab width
vim.opt.softtabstop = 4

-- Set indentation width
vim.opt.shiftwidth = 4

-- Round indent to multiple of 'shiftwidth'
vim.opt.shiftround = true

-- Enable automatic indentation
vim.opt.autoindent = true

-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Adjust indent keys for Python files
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function()
    vim.opt_local.indentkeys:remove { '<:', ':' }
  end,
})

-- Enable filetype detection, plugins, and indentation
vim.cmd('filetype plugin indent on')

--- -------------------------------------------------------------------------------------------------------------------
--- Vim Settings --- Wrapping
--- -------------------------------------------------------------------------------------------------------------------

-- Enable line wrapping
vim.opt.wrap = true
vim.opt.wrapmargin = 0

-- Remove automatic text wrapping at 'textwidth'
vim.opt.formatoptions:remove('t')

-- Enable soft wrapping at word boundaries
vim.opt.linebreak = true

-- Show an ellipsis at wrap points
vim.opt.showbreak = '…'

--- -------------------------------------------------------------------------------------------------------------------
--- Vim Settings --- Search and replace
--- -------------------------------------------------------------------------------------------------------------------

-- Case-insensitive searching
vim.opt.ignorecase = true

-- Case-sensitive if uppercase letters are used
vim.opt.smartcase = true

-- Highlight search results
vim.opt.hlsearch = true

-- Show search matches as you type
vim.opt.incsearch = true

-- Don't redraw while executing macros
vim.opt.lazyredraw = true

-- Use magic for regular expressions
vim.opt.magic = true

-- Show effects of commands incrementally
vim.opt.inccommand = 'nosplit'

--- -------------------------------------------------------------------------------------------------------------------
--- Vim Settings --- Error Bells
--- -------------------------------------------------------------------------------------------------------------------

-- Disable error bells
vim.opt.errorbells = false
vim.opt.visualbell = false

--- -------------------------------------------------------------------------------------------------------------------
--- Vim Settings --- Invisible Characters
--- -------------------------------------------------------------------------------------------------------------------

-- Show invisible characters
vim.opt.list = true
vim.opt.listchars = {
  tab = '→ ',
  eol = '¬',
  trail = '⋅',
  extends = '❯',
  precedes = '❮',
}
vim.opt.showbreak = '↪'

--- -------------------------------------------------------------------------------------------------------------------
--- Vim Settings --- Appearance
--- -------------------------------------------------------------------------------------------------------------------

-- Enable true color support
vim.opt.termguicolors = true

-- Always show the status line
vim.opt.laststatus = 3

-- Set terminal title
vim.opt.title = true

-- Show vertical line at column 120
vim.opt.colorcolumn = '120'

-- Open new split panes to right and bottom
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Show line numbers
vim.opt.number = true

-- Highlight matching braces
vim.opt.showmatch = true
vim.opt.matchtime = 2

-- Show command in the last line of the screen
vim.opt.showcmd = true

-- Don't show the default mode indicator (e.g., -- INSERT --)
vim.opt.showmode = false

-- Set command bar height
vim.opt.cmdheight = 1

-- Always show the sign column
vim.opt.signcolumn = 'yes'

-- Enable syntax highlighting
vim.cmd('syntax on')

--- -------------------------------------------------------------------------------------------------------------------
--- Plugins
--- -------------------------------------------------------------------------------------------------------------------

--- -------------------------------------------------------------------------------------------------------------------
--- Plugins --- Settings
--- -------------------------------------------------------------------------------------------------------------------

--- -------------------------------------------------------------------------------------------------------------------
--- Plugins --- Install
--- -------------------------------------------------------------------------------------------------------------------

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- comment lines with one command
    "tpope/vim-commentary",

    -- indent text objects
    "michaeljsmith/vim-indent-object",

    -- modern surround
    "machakann/vim-sandwich",

    -- more funny (no) general text objects
    "wellle/targets.vim",

    -- and even more text objects (and motions) for python
    "jeetsukumaran/vim-pythonsense",

    -- close buffer without closing the window
    "qpkorr/vim-bufkill",

    -- python 'black' formatter
    {
        "psf/black",
        init = function()
            vim.g.black_linelength = 120

            if is_windows then
                vim.g.black_virtualenv = vim.fn.expand('~\\.pyenv-win-venv\\envs\\neovim3')
            else
                vim.g.black_virtualenv = vim.fn.expand('~/.pyenv/versions/neovim3')
            end

        end,
    },

    -- highlight word under cursor
    "RRethy/vim-illuminate",

    -- Color scheme
    "dasupradyumna/midnight.nvim",
    "chriskempson/base16-vim",

    "kdheepak/lazygit.nvim",
    {"neoclide/coc.nvim", branch = 'release'},

    "ryanoasis/vim-devicons",

    -- status bar
    {
        "vim-airline/vim-airline",
        dependencies = { "vim-airline/vim-airline-themes" },
        init = function()
            -- Set the airline theme
            vim.g.airline_theme = 'base16_synth_midnight_dark'

            -- Enable powerline fonts
            vim.g.airline_powerline_fonts = 1

            -- Enable the tabline extension
            vim.g['airline#extensions#tabline#enabled'] = 1

            -- Show tab type in the tabline
            vim.g['airline#extensions#tabline#show_tab_type'] = 1

            -- Enable displaying buffers with a single tab
            vim.g['airline#extensions#tabline#show_buffers'] = 1

            -- Enable the Coc.nvim extension for airline
            vim.g['airline#extensions#coc#enabled'] = 1

            -- Set error and warning symbols for the Coc.nvim extension
            vim.g['airline#extensions#coc#error_symbol'] = 'E:'
            vim.g['airline#extensions#coc#warning_symbol'] = 'W:'

            -- Set status line format for errors and warnings
            vim.g['airline#extensions#coc#stl_format_err'] = '%E{[%e(#%fe)]}'
            vim.g['airline#extensions#coc#stl_format_warn'] = '%W{[%w(#%fw)]}'
        end
    },

    {
	  'Exafunction/codeium.vim',
      event = 'BufEnter',
	},
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local fzf = require("fzf-lua")

            fzf.setup({
                -- "fzf-vim",             -- fzf-vim commands like :Files, :Buffers, etc
                winopts = { preview = { default = "bat" } }
            })
        end
    },

    {
        -- tmux navigator plugin
        "christoomey/vim-tmux-navigator",
        init = function()
            vim.g.tmux_navigator_no_mappings = 1
        end,
    },
    {
        -- tmux resizer plugin
        "melonmanchan/vim-tmux-resizer",
        init = function()
            vim.g.tmux_resizer_no_mappings = 1
        end,
    },
    "tmux-plugins/vim-tmux",
    {
        "nvim-focus/focus.nvim",
        version = '*' ,
        config = function()
            require("focus").setup({
                enable = true, -- Enable module
                commands = true, -- Create Focus commands
                autoresize = {
                    enable = true, -- Enable or disable auto-resizing of splits
                    width = 0, -- Force width for the focused window
                    height = 0, -- Force height for the focused window
                    minwidth = 0, -- Force minimum width for the unfocused window
                    minheight = 0, -- Force minimum height for the unfocused window
                    height_quickfix = 10, -- Set the height of quickfix panel
                },
                split = {
                    bufnew = false, -- Create blank buffer for new split windows
                    tmux = false, -- Create tmux splits instead of neovim splits
                },
                ui = {
                    number = false, -- Display line numbers in the focussed window only
                    relativenumber = false, -- Display relative line numbers in the focussed window only
                    hybridnumber = false, -- Display hybrid line numbers in the focussed window only
                    absolutenumber_unfocussed = false, -- Preserve absolute numbers in the unfocussed windows

                    cursorline = true, -- Display a cursorline in the focussed window only
                    cursorcolumn = false, -- Display cursorcolumn in the focussed window only
                    colorcolumn = {
                        enable = false, -- Display colorcolumn in the foccused window only
                        list = '+1', -- Set the comma-saperated list for the colorcolumn
                    },
                    signcolumn = true, -- Display signcolumn in the focussed window only
                    winhighlight = false, -- Auto highlighting for focussed/unfocussed windows
                }
            })
        end
    },

    -- Deprecated:
    -- { "junegunn/fzf", build = "./install --bin" }
    --
    -- Unsorted (to review, old, etc):
    -- {"lambdalisue/suda.vim", init = function() vim.g.suda_smart_edit = 1 end},
    -- {'nvim-telescope', tag = '0.1.8', dependencies = {'nvim-lua/plenary.nvim'}},
    -- use closest .git dir as root
    -- "airblade/vim-rooter",
    --
    -- {
    --     "hrsh7th/nvim-cmp",
    --     -- event = 'InsertEnter',
    --     -- event = "VeryLazy",
    --     dependencies = {
    --     "hrsh7th/cmp-nvim-lsp",
    --     "onsails/lspkind-nvim",
    --     "hrsh7th/cmp-path",
    --     "hrsh7th/cmp-buffer",
    --     "hrsh7th/cmp-omni",
    --     "hrsh7th/cmp-emoji",
    --     "quangnguyen30192/cmp-nvim-ultisnips",
    --     },
    --     -- sources = {
    --     --     { name = "codeium" },
    --     -- },
    --     -- config = function()
    --     --     require("config.nvim-cmp")
    --     -- end,
    -- },
    --
    -- sexy scrolling
    -- Plug 'psliwka/vim-smoothie'
    -- sexy window switching
    -- Plug 'camspiers/animate.vim'
    -- Plug 'camspiers/lens.vim'
    -- let g:lens#width_resize_max = 120
    -- An eye friendly plugin that fades your inactive buffers and preserves your syntax highlighting!
       -- " Plug 'TaDaa/vimade'
       -- " let g:vimade = {}
       -- " let g:vimade.fadelevel = 0.7
       -- " let g:vimade.enablesigns = 1
       --
       --
       --       " customize start screen
       -- "Plug 'mhinz/vim-startify'
    -- sessions
    -- Plug 'tpope/vim-obsession'
    --
       -- " Plug 'sainnhe/everforest'
       -- " let g:everforest_background = 'hard'  " soft / medium / hard
       -- " let g:everforest_better_performance = 1
       -- " let g:everforest_dim_inactive_windows = 1
       -- " let g:everforest_show_eob = 1
       -- " let g:everforest_enable_italic = 1
       -- " let g:everforest_disable_italic_comment = 0
       -- " let g:everforest_ui_contrast = 'low' " high
       -- " let g:everforest_float_style = 'dim' " bright
       -- " let g:everforest_diagnostic_text_highlight = 0
       -- " " let g:everforest_colors_override = {'bg0': ['#000000', '234'], 'bg2': ['#282828', '235']}
       --
    -- https://github.com/echasnovski/mini.pick
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = false },
})

--- -------------------------------------------------------------------------------------------------------------------
--- Misc
--- -------------------------------------------------------------------------------------------------------------------

-- Trim trailing whitespace on save
local function trim_trailing_whitespace()
  local save = vim.fn.winsaveview()
  vim.cmd([[keeppatterns %s/\s\+$//e]])
  vim.fn.winrestview(save)
end

local auto_trim_group = vim.api.nvim_create_augroup('AutoTrim', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  group = auto_trim_group,
  pattern = '*',
  callback = trim_trailing_whitespace,
})

-- Set indentation to 2 spaces for YAML files
local yaml_group = vim.api.nvim_create_augroup('Yaml', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = yaml_group,
  pattern = 'yaml',
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})


-- Handle file changes on disk
local function process_file_changed_shell()
  if vim.v.fcs_reason == 'mode' or vim.v.fcs_reason == 'time' then
    vim.v.fcs_choice = ''
  else
    vim.v.fcs_choice = 'ask'
  end
end

vim.api.nvim_create_autocmd('FileChangedShell', {
  buffer = 0,
  callback = process_file_changed_shell,
})
