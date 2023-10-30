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

    -- LatexLive Compile
    { "lervag/vimtex" },

    -- -- Remember last Cursor Position:
    { "farmergreg/vim-lastplace" },

    -- Rainbow parenthesis
    { "HiPhish/rainbow-delimiters.nvim" },

    -- Personal Wiki:
    -- { "vimwiki/vimwiki" }
    { "lervag/wiki.vim" }
}

-- vim.g.vimtex_compiler_latexmk.build_dir = ".tex"

-- vim.g.vimtex_compiler_method = 'latexmk' -- Set the compiler method to latexmk
-- vim.g.vimtex_compiler_latexmk = {
--     build_dir = 'build',                 -- Set the build directory to a desired subfolder
-- }

vim.g.vimtex_compiler_latexmk = {
    aux_dir = '.tex_aux',
    out_dir = 'tex_pdf',
    callback = 1,
    continuous = 1,
    executable = 'latexmk',
    hooks = {},
    options = {
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
    },
}
