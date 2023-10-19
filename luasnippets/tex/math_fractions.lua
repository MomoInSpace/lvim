-- # vim: foldmethod=marker
-- # vim: foldmarker=({{,}})

-- some shorthands...
local utils = require("luasniputils.utils")
--local ts_utils = require("luasniputils.ts_utils")
local pipe = utils.pipe
local is_math = utils.with_opts(utils.is_math, true)
local not_math = utils.with_opts(utils.not_math, true)
local no_backslash = utils.no_backslash

local auto_luasnippets = {}
-- local tab_luasnippets = {}

-- local ls = require("luasnip")
-- local s = ls.snippet
-- local f = ls.function_node
-- local i = ls.insert_node
-- local t = ls.text_node

local frac_no_parens = {
    f(function(_, snip)
        return string.format("\\frac{%s}", snip.captures[1])
    end, {}),
    t("{"),
    i(1),
    t("}"),
    i(0),
}

local frac = s({
    priority = 1000,
    trig = ".*%)/",
    wordTrig = true,
    name = "() frac",
}, {
    f(function(_, snip)
        local match = vim.trim(snip.trigger)

        local stripped = match:sub(1, #match - 1)

        i = #stripped
        local depth = 0
        while true do
            if stripped:sub(i, i) == ")" then
                depth = depth + 1
            end
            if stripped:sub(i, i) == "(" then
                depth = depth - 1
            end
            if depth == 0 then
                break
            end
            i = i - 1
        end

        local rv = string.format(
            "%s\\frac{%s}",
            stripped:sub(1, i - 1),
            stripped:sub(i + 1, #stripped - 1)
        )
        return rv
    end, {}),
    t("{"),
    i(1),
    t("}"),
    i(0),
})

local math_wrA = {
    frac,

    s({
        trig = "([\\%a]+)(%d)",
        name = "auto subscript",
    }, {
        f(function(_, snip)
            return string.format("%s_%s", snip.captures[1], snip.captures[2])
        end, {}),
        i(0),
    }),

    s({
        trig = "([%a])_(%d%d)",
        name = "auto subscript 2",
    }, {
        f(function(_, snip)
            return string.format("%s_{%s}", snip.captures[1], snip.captures[2])
        end, {}),
        i(0),
    }),

    s({
        trig = "(\\?[%w]+\\?^%w)/",
        name = "Fraction no ()",
    }, vim.deepcopy(frac_no_parens)),

    s({
        trig = "(\\?[%w]+\\?_%w)/",
        name = "Fraction no ()",
    }, vim.deepcopy(frac_no_parens)),

    s({
        trig = "(\\?[%w]+\\?^{%w*})/",
        name = "Fraction no ()",
    }, vim.deepcopy(frac_no_parens)),

    s({
        trig = "(\\?[%w]+\\?_{%w*})/",
        name = "Fraction no ()",
    }, vim.deepcopy(frac_no_parens)),

    s({
        trig = "(\\?%w+)/",
        name = "Fraction no ()",
    }, vim.deepcopy(frac_no_parens)),
    s({
        trig = "ACAB",
        name = "Fraction no ()",
    }, t("Assigned Chaos at Birth")),
}

-- for _, snip in ipairs(frac_no_parens) do
--     snip.condition = pipe({ is_math, no_backslash })
--     snip.show_condition = is_math
--     -- snip.wordTrig = false
--     table.insert(auto_luasnippets, snip)
-- end

-- for _, snip in ipairs(frac) do
--     snip.condition = pipe({ is_math, no_backslash })
--     snip.show_condition = is_math
--     -- snip.wordTrig = false
--     table.insert(auto_luasnippets, snip)
-- end

for _, snip in ipairs(math_wrA) do
    snip.condition = pipe({ is_math, no_backslash })
    snip.show_condition = is_math
    snip.wordTrig = true
    snip.regTrig = true
    table.insert(auto_luasnippets, snip)
end

return {}, auto_luasnippets
