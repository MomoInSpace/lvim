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
require('plugins')

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

    -- Remote-sshfs
    { 'nosduco/remote-sshfs.nvim' },

    -- Markdown Preview
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        ft = "markdown",
        config = function()
            vim.g.mkdp_auto_start = 1
        end,
    },
}
