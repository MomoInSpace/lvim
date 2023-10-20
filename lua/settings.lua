-----------------------------------------------------------
-- LunarVim settings
--- General LunarVim settings
-----------------------------------------------------------
-----------------------------------------------------------
-- LunarVim Theme
-----------------------------------------------------------
-- lvim.colorscheme = "tokyonight"
-- vim.g.tokyonight_style = "storm"
lvim.colorscheme = "gruvbox"

-----------------------------------------------------------
-- LunarVim Settings
-----------------------------------------------------------
lvim.log.level = "info"
lvim.format_on_save = true
lvim.lint_on_save = true
-- lvim.leader = ","
lvim.builtin.terminal.active = true
-- lvim.builtin.notify.active = true Deprecated
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.filters.dotfiles = false
lvim.line_wrap_cursor_movement = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-----------------------------------------------------------
-- Neovim settings
--- General Neovim settings
-----------------------------------------------------------
-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
local cmd = vim.cmd            -- execute Vim commands
local exec = vim.api.nvim_exec -- execute Vimscript
local fn = vim.fn              -- call Vim functions
local g = vim.g                -- global variables
local opt = vim.opt            -- global/buffer/windows-scoped options

-- Spelling:
vim.opt.spelllang = 'en_us'
vim.opt.spell = true

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'               -- enable mouse support
opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
opt.swapfile = false          -- don't use swapfile
opt.wrap = true               -- line wrapping
opt.linebreak = true          -- don't split words

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.syntax = 'enable'     -- enable syntax highlighting
opt.number = true         -- show line number
opt.showmatch = true      -- highlight matching parenthesis
opt.relativenumber = true -- show relative distance between rows
opt.scrolloff = 10        -- keep 10 row buffer on screen edges
opt.foldmethod = 'marker' -- enable folding (default 'foldmarker')
opt.colorcolumn = '120'   -- line length marker at 80 columns
opt.splitright = true     -- vertical split to the right
opt.splitbelow = true     -- horizontal split to the bottom
opt.ignorecase = true     -- ignore case letters when search
opt.smartcase = true      -- ignore lowercase for the whole pattern
opt.hlsearch = false      -- remove highlighting after search

-- highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)

-- open terminal on bottom-right
cmd [[:command Termy belowright 10split | terminal]]

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true     -- enable background buffers
opt.history = 100     -- remember n lines in history
opt.lazyredraw = true -- faster scrolling
opt.synmaxcol = 240   -- max column for syntax highlight

-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
opt.termguicolors = true -- enable 24-bit RGB colors

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true   -- use spaces instead of tabs
opt.shiftwidth = 4     -- shift 4 spaces when tab
opt.tabstop = 4        -- 1 tab == 4 spaces
opt.smartindent = true -- autoindent new lines
