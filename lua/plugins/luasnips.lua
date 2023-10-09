-- LuaSnips is a Snippet Engine and lets you create Snippets. 
-- They are saved and loaded in either the 'snippets' or the 'luasnippets' subdirectory of the nvim/lvim config.
-- https://github.com/L3MON4D3/LuaSnip

local ls = require('luasnip')
ls.config.setup({ enable_autosnippets = true })
