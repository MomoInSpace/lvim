--[[

░█████╗░░█████╗░███╗░░██╗███████╗██╗░██████╗░░░░██╗░░░░░██╗░░░██╗░█████╗░
██╔══██╗██╔══██╗████╗░██║██╔════╝██║██╔════╝░░░░██║░░░░░██║░░░██║██╔══██╗
██║░░╚═╝██║░░██║██╔██╗██║█████╗░░██║██║░░██╗░░░░██║░░░░░██║░░░██║███████║
██║░░██╗██║░░██║██║╚████║██╔══╝░░██║██║░░╚██╗░░░██║░░░░░██║░░░██║██╔══██║
╚█████╔╝╚█████╔╝██║░╚███║██║░░░░░██║╚██████╔╝██╗███████╗╚██████╔╝██║░░██║
░╚════╝░░╚════╝░╚═╝░░╚══╝╚═╝░░░░░╚═╝░╚═════╝░╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝

LunarVim configuratin file

--]]

-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- If treesitter doesn't work, you need pacman -S tree-sitter-cli
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

require('settings')
require("nvim-treesitter.health").check()
require('keymaps')
require('plugins')
require("lsvars")
--
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
    { "lervag/wiki.vim" },

    -- Fortran Coding
    { "rudrab/vimf90" },
    { "pseewald/fprettify" }
}

-- vim.g.vimtex_compiler_latexmk.build_dir = ".tex"
-- vim.g.vimtex_compiler_latexmk = {
-- build_dir = 'build',                 -- Set the build directory to a desired subfolder
-- }
--
-- require 'lspconfig'.fortls.setup {}
require 'lspconfig'.fortls.setup {
    cmd = {
        'fortls',
        '--lowercase_intrisics',
        '--hover_signature',
        '--hover_language=fortran',
        '--use_signature_help',
        '--formatting.arrangeSection=alignVariables'
    }
}
--
vim.g.vimtex_compiler_method = 'latexmk' -- Set the compiler method to latexmk
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

vim.cmd([[
  augroup filetype_cuf
    autocmd!
    autocmd BufRead,BufNewFile *.cuf setfiletype fortran
  augroup END
]])
