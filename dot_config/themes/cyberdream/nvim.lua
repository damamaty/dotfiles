vim.o.background = "dark"
require("cyberdream").setup({
    variant = "default",
    transparent = true, -- editor body transparent so wezterm blur shows through
    italic_comments = true,
    terminal_colors = true,
    cache = false,
})
vim.cmd("colorscheme cyberdream")
