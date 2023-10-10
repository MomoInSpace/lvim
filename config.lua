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
    {'nosduco/remote-sshfs.nvim'},

    -- Markdown Preview
    -- You must install glow globally
    -- https://github.com/charmbracelet/glow
    -- yay -S glow
    {
      "npxbr/glow.nvim",
      ft = {"markdown"}
      -- build = "yay -S glow"
    },
}

