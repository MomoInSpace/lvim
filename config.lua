--[[

░█████╗░░█████╗░███╗░░██╗███████╗██╗░██████╗░░░░██╗░░░░░██╗░░░██╗░█████╗░
██╔══██╗██╔══██╗████╗░██║██╔════╝██║██╔════╝░░░░██║░░░░░██║░░░██║██╔══██╗
██║░░╚═╝██║░░██║██╔██╗██║█████╗░░██║██║░░██╗░░░░██║░░░░░██║░░░██║███████║
██║░░██╗██║░░██║██║╚████║██╔══╝░░██║██║░░╚██╗░░░██║░░░░░██║░░░██║██╔══██║
╚█████╔╝╚█████╔╝██║░╚███║██║░░░░░██║╚██████╔╝██╗███████╗╚██████╔╝██║░░██║
░╚════╝░░╚════╝░╚═╝░░╚══╝╚═╝░░░░░╚═╝░╚═════╝░╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝

LunarVim configuratin file

--]]

require('settings')
require('keymaps')
-- require('plugins.luasnips')
-- Snippets from LuaSnips
-- require('snippets.init')

-- lvim.builtin.luasnip.sources = textstuff
local ls = require('luasnip')
ls.config.setup({ enable_autosnippets = true })

lvim.plugins = {
    { "voldikss/vim-floaterm" },

    -- Colorschemes and visual plugins:
    { 'bluz71/vim-moonfly-colors' },
    { 'itchyny/lightline.vim' }, -- Fancier statusline
    { "lunarvim/colorschemes" },
    -- {"folke/tokyonight.nvim"},

    { "morhetz/gruvbox" },
    {
        "ray-x/lsp_signature.nvim",
        config = function() require "lsp_signature".on_attach() end,
        event = "InsertEnter"
    },
}
