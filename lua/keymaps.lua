-----------------------------------------------------------
-- LunarVim Keymaps
-----------------------------------------------------------

lvim.builtin.which_key.mappings["q"] = {
    "<cmd>:quitall<CR>", "Quit"
}

lvim.builtin.which_key.mappings["r"] = {
    "<cmd>:NvimTreeRefresh<CR>", "Refresh explorer"
}

lvim.builtin.which_key.mappings["t"] = {
    "<cmd>:FloatermToggle<CR>", "Toggle Terminal"
}

-----------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
--- and plugins.
-----------------------------------------------------------

local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

-----------------------------------------------------------
-- Neovim shortcuts:
-----------------------------------------------------------

-- fast saving with <leader> and s
-- map('n', '<leader>s', ':w<CR>', default_opts)

-- move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h', default_opts)
map('n', '<C-j>', '<C-w>j', default_opts)
map('n', '<C-k>', '<C-w>k', default_opts)
map('n', '<C-l>', '<C-w>l', default_opts)

-- Close all windows and exit from neovim
-- map('n', '<leader>q', ':quitall<CR>', default_opts)

-- Use escape to leave insert mode in terminal
map('t', '<Esc>', '<C-\\><C-n>', default_opts)

-----------------------------------------------------------
-- Plugins shortcuts:
-----------------------------------------------------------

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- lvim.builtin.telescope.on_config_done = function()
--   local actions = require "telescope.actions"
--   -- for input mode
--   lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
--   lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
--   -- for normal mode
--   lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
-- end

-- Move Between Tabs
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
