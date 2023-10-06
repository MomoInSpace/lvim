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
local default_opts = { noremap = true, silent = true }

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




-- Settings for nvim-cmp

local cmp = require("cmp")
local types = require("cmp.types")
local str = require("cmp.utils.str")

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local luasnip = require("luasnip")

-- Do not jump to snippet if i'm outside of it
-- https://github.com/L3MON4D3/LuaSnip/issues/78
-- luasnip.config.setup({
-- 	region_check_events = "CursorMoved",
-- 	delete_check_events = "TextChanged",
-- })

-- local lspkind = require("lspkind")
-- local neogen = require("neogen")

-- Keymaps for LuaSnips
cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<C-j>"] = cmp.mapping(
            cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
            { "i", "s", "c" }
        ),
        ["<C-k>"] = cmp.mapping(
            cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
            { "i", "s", "c" }
        ),
        -- ["<Tab>"] = cmp.mapping(function(fallback)
        -- 	-- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
        -- 	if cmp.visible() then
        -- 		local entry = cmp.get_selected_entry()
        -- 		if not entry then
        -- 			cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        -- 		end
        -- 		cmp.confirm()
        -- 	else
        -- 		fallback()
        -- 	end
        -- end, {
        -- 	"i",
        -- 	"s",
        -- 	"c",
        -- }),
        ["<C-l>"] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
                vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
            elseif neogen.jumpable() then
                vim.fn.feedkeys(t("<cmd>lua require('neogen').jump_next()<CR>"), "")
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<C-h>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<C-a>"] = cmp.mapping(function(fallback)
            if luasnip.choice_active() then
                vim.fn.feedkeys(t("<Plug>luasnip-next-choice"), "")
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<C-s>"] = cmp.mapping(function(fallback)
            if luasnip.choice_active() then
                vim.fn.feedkeys(t("<Plug>luasnip-prev-choice"), "")
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    },

    -- You should specify your *installed* sources.
    -- sources = {
    --     { name = "cmp_git" },
    --     { name = "path" },
    --     { name = "luasnip" },
    --     { name = "nvim_lsp" },
    --     { name = "buffer",  keyword_length = 5, max_item_count = 5 },
    --     { name = "neorg" },
    -- },

    -- formatting = {
    --     -- Youtube: How to set up nice formatting for your sources.
    --     format = lspkind.cmp_format {
    --         with_text = true,
    --         menu = {
    --             buffer = "[buf]",
    --             nvim_lsp = "[LSP]",
    --             nvim_lua = "[api]",
    --             path = "[path]",
    --             luasnip = "[snip]",
    --             gh_issues = "[issues]",
    --             tn = "[TabNine]",
    --         },
    --     },
    -- },

    -- experimental = {
    --     ghost_text = false,
    -- },
})

require("cmp").setup.cmdline(":", {
    sources = {
        { name = "cmdline", keyword_length = 2 },
    },
})
