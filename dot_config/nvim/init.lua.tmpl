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

-- vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
-- vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true })
-- vim.keymap.set('x', '<leader>b', '<Plug>(coc-format-selected)')
-- vim.keymap.set('n', '<leader>b', '<Plug>(coc-format-selected)')

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
vim.cmd([[nnoremap \ :Neotree toggle<cr>]])

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

vim.env.PYENV_VERSION = vim.fn.system('pyenv version'):match('(%S+)%s+%(.-%)')


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
    -- detect tabstop and shiftwidth automatically
    "tpope/vim-sleuth",

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
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000 ,
        config = true,
        opts = {

        }
    },

    -- yank animations
    {
        "rachartier/tiny-glimmer.nvim",
        event = "TextYankPost",
        opts = {
            default_animation = "rainbow",
            -- fade bounce left_to_right pulse rainbow custom
        },
    },

    -- chunk highlight
    {
        "shellRaining/hlchunk.nvim",
        -- event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("hlchunk").setup({
                chunk = {
                    enable = true,
                    -- style = {
                    --     vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
                    -- },
                    style = {
                        { fg = "#806d9c" },
                        { fg = "#c21f30" },
                    },
                    use_treesitter = true,
                    chars = {
                        horizontal_line = "─",
                        vertical_line = "│",
                        left_top = "╭",
                        left_bottom = "╰",
                        right_arrow = ">",
                    },
                    error_sign = true,
                    -- style = "#806d9c",
                },
                -- chunk = {
                --     priority = 15,
                --     style = {
                --         "#806d9c", -- Violet
                --         "#c21f30", -- maple red
                --     },
                --     use_treesitter = true,
                --     chars = {
                --         horizontal_line = "─",
                --         vertical_line = "│",
                --         left_top = "╭",
                --         left_bottom = "╰",
                --         right_arrow = ">",
                --     },
                --     -- textobject = "",
                --     -- max_file_size = 1024 * 1024,
                --     -- -- animation related
                --     -- duration = 200,
                --     -- delay = 300,
                --     -- ...
                -- },
                indent = {
                    enable = true,
                    priority = 10,
                    use_treesitter = false,
                    chars = { "│", "┊", },
                    ahead_lines = 5,
                    delay = 100,
                    -- style = { "#881100", "#772200", "#663300", "#554400" },
                    -- style = {
                    --     { bg = "#FF0000", fg = "#FFFFFF" },
                    --     { bg = "#FF7F00", fg = "FF7F00" },
                    --     -- ...
                    -- },
                    style = {
                        vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
                    },
                },
                line_num = {
                    enable = true
                    -- ...
                },
                blank = {
                    enable = true
                    -- ...
                },
            })
        end,
    },

    {
        'jinh0/eyeliner.nvim',
        config = function()
            require'eyeliner'.setup {
            -- show highlights only after keypress
            highlight_on_key = true,

            -- dim all other characters if set to true (recommended!)
            dim = false,

            -- set the maximum number of characters eyeliner.nvim will check from
            -- your current cursor position; this is useful if you are dealing with
            -- large files: see https://github.com/jinh0/eyeliner.nvim/issues/41
            max_length = 9999,

            -- filetypes for which eyeliner should be disabled;
            -- e.g., to disable on help files:
            -- disabled_filetypes = {"help"}
            disabled_filetypes = {},

            -- buftypes for which eyeliner should be disabled
            -- e.g., disabled_buftypes = {"nofile"}
            disabled_buftypes = {},

            -- add eyeliner to f/F/t/T keymaps;
            -- see section on advanced configuration for more information
            default_keymaps = true,
            }
        end
    },

    { -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
        },
        },
    },

    "kdheepak/lazygit.nvim",
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
        library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
        },
    },
    "sindrets/diffview.nvim",

    {
        -- Main LSP Configuration
        'neovim/nvim-lspconfig',
        dependencies = {
        -- Automatically install LSPs and related tools to stdpath for Neovim
        -- Mason must be loaded before its dependents so we need to set it up here.
        -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
        { 'williamboman/mason.nvim', opts = {} },
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',

        -- Useful status updates for LSP.
        { 'j-hui/fidget.nvim', opts = {} },

        -- Allows extra capabilities provided by nvim-cmp
        'hrsh7th/cmp-nvim-lsp',
        },
        config = function()
            -- Brief aside: **What is LSP?**
            --
            -- LSP is an initialism you've probably heard, but might not understand what it is.
            --
            -- LSP stands for Language Server Protocol. It's a protocol that helps editors
            -- and language tooling communicate in a standardized fashion.
            --
            -- In general, you have a "server" which is some tool built to understand a particular
            -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
            -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
            -- processes that communicate with some "client" - in this case, Neovim!
            --
            -- LSP provides Neovim with features like:
            --  - Go to definition
            --  - Find references
            --  - Autocompletion
            --  - Symbol Search
            --  - and more!
            --
            -- Thus, Language Servers are external tools that must be installed separately from
            -- Neovim. This is where `mason` and related plugins come into play.
            --
            -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
            -- and elegantly composed help section, `:help lsp-vs-treesitter`

            --  This function gets run when an LSP attaches to a particular buffer.
            --    That is to say, every time a new file is opened that is associated with
            --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
            --    function will be executed to configure the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
                callback = function(event)
                    -- NOTE: Remember that Lua is a real programming language, and as such it is possible
                    -- to define small helper and utility functions so you don't have to repeat yourself.
                    --
                    -- In this case, we create a function that lets us more easily define mappings specific
                    -- for LSP related items. It sets the mode, buffer and description for us each time.
                    local map = function(keys, func, desc, mode)
                        mode = mode or 'n'
                        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                    end

                    -- -- Jump to the definition of the word under your cursor.
                    -- --  This is where a variable was first declared, or where a function is defined, etc.
                    -- --  To jump back, press <C-t>.
                    -- map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

                    -- -- Find references for the word under your cursor.
                    -- map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

                    -- -- Jump to the implementation of the word under your cursor.
                    -- --  Useful when your language has ways of declaring types without an actual implementation.
                    -- map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

                    -- -- Jump to the type of the word under your cursor.
                    -- --  Useful when you're not sure what type a variable is and you want to see
                    -- --  the definition of its *type*, not where it was *defined*.
                    -- map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

                    -- -- Fuzzy find all the symbols in your current document.
                    -- --  Symbols are things like variables, functions, types, etc.
                    -- map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

                    -- -- Fuzzy find all the symbols in your current workspace.
                    -- --  Similar to document symbols, except searches over your entire project.
                    -- map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

                    -- Rename the variable under your cursor.
                    --  Most Language Servers support renaming across files, etc.
                    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

                    -- Execute a code action, usually your cursor needs to be on top of an error
                    -- or a suggestion from your LSP for this to activate.
                    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

                    -- WARN: This is not Goto Definition, this is Goto Declaration.
                    --  For example, in C this would take you to the header.
                    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

                    -- The following two autocommands are used to highlight references of the
                    -- word under your cursor when your cursor rests there for a little while.
                    --    See `:help CursorHold` for information about when this is executed
                    --
                    -- When you move your cursor, the highlights will be cleared (the second autocommand).
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
                        local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
                        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.clear_references,
                        })

                        vim.api.nvim_create_autocmd('LspDetach', {
                        group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
                        callback = function(event2)
                            vim.lsp.buf.clear_references()
                            vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
                        end,
                        })
                    end

                    -- The following code creates a keymap to toggle inlay hints in your
                    -- code, if the language server you are using supports them
                    --
                    -- This may be unwanted, since they displace some of your code
                    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
                        map('<leader>th', function()
                        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
                        end, '[T]oggle Inlay [H]ints')
                    end
                end,
            })

            -- Change diagnostic symbols in the sign column (gutter)
            -- if vim.g.have_nerd_font then
            --   local signs = { ERROR = '', WARN = '', INFO = '', HINT = '' }
            --   local diagnostic_signs = {}
            --   for type, icon in pairs(signs) do
            --     diagnostic_signs[vim.diagnostic.severity[type]] = icon
            --   end
            --   vim.diagnostic.config { signs = { text = diagnostic_signs } }
            -- end

            -- LSP servers and clients are able to communicate to each other what features they support.
            --  By default, Neovim doesn't support everything that is in the LSP specification.
            --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
            --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

            -- Enable the following language servers
            --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
            --
            --  Add any additional override configuration in the following tables. Available keys are:
            --  - cmd (table): Override the default command used to start the server
            --  - filetypes (table): Override the default list of associated filetypes for the server
            --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
            --  - settings (table): Override the default settings passed when initializing the server.
            --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
            local servers = {
                -- clangd = {},
                -- gopls = {},
                pyright = {
                    settings = {
                        python = {
                            analysis = {
                                ignore = { "*" },
                            },
                        },
                    },
                },
                -- rust_analyzer = {},
                -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
                --
                -- Some languages (like typescript) have entire language plugins that can be useful:
                --    https://github.com/pmizio/typescript-tools.nvim
                --
                -- But for many setups, the LSP (`ts_ls`) will work just fine
                -- ts_ls = {},
                --

                lua_ls = {
                -- cmd = { ... },
                -- filetypes = { ... },
                -- capabilities = {},
                settings = {
                    Lua = {
                    completion = {
                        callSnippet = 'Replace',
                    },
                    -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                    -- diagnostics = { disable = { 'missing-fields' } },
                    },
                },
                },
            }

            -- Ensure the servers and tools above are installed
            --
            -- To check the current status of installed tools and/or manually install
            -- other tools, you can run
            --    :Mason
            --
            -- You can press `g?` for help in this menu.
            --
            -- `mason` had to be setup earlier: to configure its options see the
            -- `dependencies` table for `nvim-lspconfig` above.
            --
            -- You can add other tools here that you want Mason to install
            -- for you, so that they are available from within Neovim.
            local ensure_installed = vim.tbl_keys(servers or {})
            vim.list_extend(ensure_installed, {
                'stylua', -- Used to format Lua code
            })
            require('mason-tool-installer').setup { ensure_installed = ensure_installed }

            require('mason-lspconfig').setup {
                handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    -- This handles overriding only values explicitly passed
                    -- by the server configuration above. Useful when disabling
                    -- certain features of an LSP (for example, turning off formatting for ts_ls)
                    server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                    require('lspconfig')[server_name].setup(server)
                end,
                },
            }
        end,
    },

    { -- Autocompletion
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            {
                'L3MON4D3/LuaSnip',
                build = (function()
                -- Build Step is needed for regex support in snippets.
                -- This step is not supported in many windows environments.
                -- Remove the below condition to re-enable on windows.
                if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
                    return
                end
                return 'make install_jsregexp'
                end)(),
                dependencies = {
                -- `friendly-snippets` contains a variety of premade snippets.
                --    See the README about individual language/framework/plugin snippets:
                --    https://github.com/rafamadriz/friendly-snippets
                -- {
                --   'rafamadriz/friendly-snippets',
                --   config = function()
                --     require('luasnip.loaders.from_vscode').lazy_load()
                --   end,
                -- },
                },
            },
            'saadparwaiz1/cmp_luasnip',

            -- Adds other completion capabilities.
            --  nvim-cmp does not ship with all sources by default. They are split
            --  into multiple repos for maintenance purposes.
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
        },
        config = function()
            -- See `:help cmp`
            local cmp = require 'cmp'
            local luasnip = require 'luasnip'
            luasnip.config.setup {}

            cmp.setup {
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                -- makes cmp not preselect the entries
                completion = { completeopt = "noselect" },
                -- makes cmp ignore preselect requests from language servers. (:h cmp-config.preselect)
                preselect = cmp.PreselectMode.None,

                -- For an understanding of why these mappings were
                -- chosen, you will need to read `:help ins-completion`
                --
                -- No, but seriously. Please read `:help ins-completion`, it is really good!
                mapping = cmp.mapping.preset.insert {
                    -- Select the [n]ext item
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    -- Select the [p]revious item
                    ['<C-p>'] = cmp.mapping.select_prev_item(),

                    -- Scroll the documentation window [b]ack / [f]orward
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),

                    -- Accept ([y]es) the completion.
                    --  This will auto-import if your LSP supports it.
                    --  This will expand snippets if the LSP sent a snippet.
                    ['<C-y>'] = cmp.mapping.confirm { select = true },

                    -- If you prefer more traditional completion keymaps,
                    -- you can uncomment the following lines
                    --['<CR>'] = cmp.mapping.confirm { select = true },
                    --['<Tab>'] = cmp.mapping.select_next_item(),
                    --['<S-Tab>'] = cmp.mapping.select_prev_item(),

                    -- Manually trigger a completion from nvim-cmp.
                    --  Generally you don't need this, because nvim-cmp will display
                    --  completions whenever it has completion options available.
                    ['<C-Space>'] = cmp.mapping.complete {},

                    -- Think of <c-l> as moving to the right of your snippet expansion.
                    --  So if you have a snippet that's like:
                    --  function $name($args)
                    --    $body
                    --  end
                    --
                    -- <c-l> will move you to the right of each of the expansion locations.
                    -- <c-h> is similar, except moving you backwards.
                    ['<C-l>'] = cmp.mapping(function()
                        if luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                        end
                    end, { 'i', 's' }),
                    ['<C-h>'] = cmp.mapping(function()
                        if luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                        end
                    end, { 'i', 's' }),

                    -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
                    --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
                },
                sources = {
                    {
                        name = 'lazydev',
                        -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
                        group_index = 0,
                    },
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'path' },
                },
            }
        end,
    },
    -- { -- optional cmp completion source for require statements and module annotations
    --     "hrsh7th/nvim-cmp",
    --     opts = function(_, opts)
    --     opts.sources = opts.sources or {}
    --     table.insert(opts.sources, {
    --         name = "lazydev",
    --         group_index = 0, -- set group index to 0 to skip loading LuaLS completions
    --     })
    --     end,
    -- },
    { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        main = 'nvim-treesitter.configs', -- Sets main module to use for opts
        -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
        opts = {
            ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
            -- Autoinstall languages that are not installed
            auto_install = true,
            highlight = {
                enable = true,
                -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
                --  If you are experiencing weird indenting issues, add the language to
                --  the list of additional_vim_regex_highlighting and disabled languages for indent.
                additional_vim_regex_highlighting = { 'ruby' },
            },
            indent = { enable = true, disable = { 'ruby' } },
        },
        -- There are additional nvim-treesitter modules that you can use to interact
        -- with nvim-treesitter. You should go explore a few and see what interests you:
        --
        --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
        --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
        --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    },
    -- {"neoclide/coc.nvim", branch = 'release'},
    {
        'stevearc/conform.nvim',
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform will run multiple formatters sequentially
                python = { "isort", "black" },
                -- You can customize some of the format options for the filetype (:help conform.format)
                rust = { "rustfmt", lsp_format = "fallback" },
                -- Conform will run the first available formatter
                javascript = { "prettierd", "prettier", stop_after_first = true },
            },
        },
        keys = {
            {
                -- Customize or remove this keymap to your liking
                "<leader>f",
                function()
                    require("conform").format({ async = true })
                end,
                mode = "",
                desc = "Format buffer",
            },
        },
        init = function()
            -- If you want the formatexpr, here is the place to set it
            vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        end,
    },
    "ryanoasis/vim-devicons",

    -- status bar
    {
        "vim-airline/vim-airline",
        dependencies = { "vim-airline/vim-airline-themes" },
        init = function()
            -- Set the airline theme
            -- vim.g.airline_theme = 'base16_synth_midnight_dark'
            vim.g.airline_theme = 'base16_gruvbox_dark_hard'

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

    { -- Useful plugin to show you pending keybinds.
        'folke/which-key.nvim',
        event = 'VimEnter', -- Sets the loading event to 'VimEnter'
        opts = {
            -- delay between pressing a key and opening which-key (milliseconds)
            -- this setting is independent of vim.opt.timeoutlen
            delay = 0,
            icons = {
                -- set icon mappings to true if you have a Nerd Font
                mappings = vim.g.have_nerd_font,
                -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
                -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
                keys = vim.g.have_nerd_font and {} or {
                Up = '<Up> ',
                Down = '<Down> ',
                Left = '<Left> ',
                Right = '<Right> ',
                C = '<C-…> ',
                M = '<M-…> ',
                D = '<D-…> ',
                S = '<S-…> ',
                CR = '<CR> ',
                Esc = '<Esc> ',
                ScrollWheelDown = '<ScrollWheelDown> ',
                ScrollWheelUp = '<ScrollWheelUp> ',
                NL = '<NL> ',
                BS = '<BS> ',
                Space = '<Space> ',
                Tab = '<Tab> ',
                F1 = '<F1>',
                F2 = '<F2>',
                F3 = '<F3>',
                F4 = '<F4>',
                F5 = '<F5>',
                F6 = '<F6>',
                F7 = '<F7>',
                F8 = '<F8>',
                F9 = '<F9>',
                F10 = '<F10>',
                F11 = '<F11>',
                F12 = '<F12>',
                },
            },

            -- Document existing key chains
            spec = {
                -- { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
                -- { '<leader>d', group = '[D]ocument' },
                -- { '<leader>r', group = '[R]ename' },
                -- { '<leader>s', group = '[S]earch' },
                -- { '<leader>w', group = '[W]orkspace' },
                -- { '<leader>t', group = '[T]oggle' },
                -- { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
            },
        },
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
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
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
  -- install = { colorscheme = { "habamax" } },
  -- install = { colorscheme = { "habamax" } },
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

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

vim.opt.foldenable = false
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
-- vim.opt.foldtext = "nvim_treesitter#foldtext()"
local function fold_virt_text(result, s, lnum, coloff)
  if not coloff then
    coloff = 0
  end
  local text = ""
  local hl
  for i = 1, #s do
    local char = s:sub(i, i)
    local hls = vim.treesitter.get_captures_at_pos(0, lnum, coloff + i - 1)
    local _hl = hls[#hls]
    if _hl then
      local new_hl = "@" .. _hl.capture
      if new_hl ~= hl then
        table.insert(result, { text, hl })
        text = ""
        hl = nil
      end
      text = text .. char
      hl = new_hl
    else
      text = text .. char
    end
  end
  table.insert(result, { text, hl })
end

function _G.custom_foldtext()
  local start = vim.fn.getline(vim.v.foldstart):gsub("\t", string.rep(" ", vim.o.tabstop))
  local end_str = vim.fn.getline(vim.v.foldend)
  local end_ = vim.trim(end_str)
  local result = {}
  fold_virt_text(result, start, vim.v.foldstart - 1)
  table.insert(result, { " ... ", "Delimiter" })
  fold_virt_text(result, end_, vim.v.foldend - 1, #(end_str:match("^(%s+)") or ""))
  return result
end

vim.opt.foldtext = "v:lua.custom_foldtext()"
vim.opt.foldlevel = 99
--
vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

