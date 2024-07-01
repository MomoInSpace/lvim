-- # vim: foldmethod=marker
-- # vim: foldmarker=({{,}})

-- some shorthands...
-- local ts_utils = require("luasniputils.ts_utils")
-- local not_math = utils.with_opts(utils.not_math, true)

local auto_luasnippets = {}
local tab_luasnippets = {}

--# Start of Snippets -----------------------------------------({{

-- # basic operators------------------------------------({{
basic_operators = {
    parse({ trig = ";o", name = "OE" }, "ö"),
    parse({ trig = ";u", name = "OE" }, "ü"),
    parse({ trig = ";a", name = "OE" }, "ä"),

}

for key, snip in ipairs(basic_operators) do
    snip.priority = key + 1000
    -- snip.condition = pipe({ is_math, no_backslash })
    -- snip.show_condition = is_math
    snip.wordTrig = true
    snip.regTrig = true
    table.insert(auto_luasnippets, snip)
end



return tab_luasnippets, auto_luasnippets
