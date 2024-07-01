-- # vim: foldmethod=marker
-- # vim: foldmarker=({{,}})

require("lsvars")
local mls              = MyLuaSnipConfig

local auto_luasnippets = {}
local modyfier_auto    = {}
local tab_luasnippets  = {}

-- overrightarrow ({{
local vec_node         = {
    mls.f(function(_, snip)
        return string.format("\\overrightarrow{%s}", snip.captures[1])
    end, {}),
} --}})

-- hat ({{
local hat_node         = {
    mls.f(function(_, snip)
        return string.format("\\hat{%s}", snip.captures[1])
    end, {}),
} --}})

-- overline ({{
local bar_node         = {
    mls.f(function(_, snip)
        return string.format("\\overline{%s}", snip.captures[1])
    end, {}),
} --}})

-- underbrace ({{
local brace_node       = {
    mls.f(function(_, snip)
        return string.format("\\underbrace{%s}", snip.captures[1])
    end, {}),
} --}})

-- boldsymbol ({{
local bold_node        = {
    mls.f(function(_, snip)
        return string.format("\\boldsymbol{%s}", snip.captures[1])
    end, {}),
} --}})

-- widetilde ({{
local tilde_node       = {
    mls.f(function(_, snip)
        return string.format("\\widetilde{%s}", snip.captures[1])
    end, {}),
} --}})

-- mathbb ({{
local math_bb_node     = {
    mls.f(function(_, snip)
        return string.format("\\mathbb{%s}", snip.captures[1])
    end, {}),
} --}})

-- mathcal ({{
local math_cal_node    = {
    mls.f(function(_, snip)
        return string.format("\\mathcal{%s}", snip.captures[1])
    end, {}),
} --}})

-- mathprime ({{
local math_prime_node  = {
    mls.f(function(_, snip)
        return string.format("%s^{\\prime}", snip.captures[1])
    end, {}),
} --}})

-- mathstar ({{
local math_star_node   = {
    mls.f(function(_, snip)
        return string.format("%s^{*}", snip.captures[1])
    end, {}),
} --}})

-- text ({{
local math_text1_node  = {
    mls.f(function(_, snip)
        return string.format("\\text{%s}", snip.captures[1])
    end, {}),
} --}})

-- mathtt ({{
local math_text2_node  = {
    mls.f(function(_, snip)
        return string.format("\\mathtt{%s}", snip.captures[1])
    end, {}),
} --}})

local nodearray        = { vec_node, hat_node, bar_node, bold_node, brace_node, bold_node, tilde_node, math_bb_node,
    math_cal_node, math_prime_node, math_star_node, math_text1_node, math_text2_node }

local trigarray        = { "vec", "hat", "bar", "ff", "ubrace", "bb", "til", "mbb", "mcal", "''", "star", "txt", "mtt" }

for key, node in pairs(nodearray) do
    regex_strings = {
        "([%w]+)",
        "(\\[%a]+[%{]?[%w]+[%}]?)",
        "%(([%a,%\\%{%}_%s%d%+%-%^]+)%)"
    }

    for regKey, trigString in pairs(regex_strings) do
        local trigger = trigString .. trigarray[key]
        local node_double_char = mls.bm({ trig = trigger }, vim.deepcopy(node))
        table.insert(modyfier_auto, node_double_char)
    end
end


--local modyfier_tab = {
--s({ trig = "([%a][%a])(%.,)" }, vim.deepcopy(vec_node)),
--s({ trig = "([%a][%a])(,%.)" }, vim.deepcopy(vec_node)),
--s({ trig = "([%a])(%.,)" }, vim.deepcopy(vec_node)),
--s({ trig = "([%a])(,%.)" }, vim.deepcopy(vec_node)),
--}

for key, snip in ipairs(modyfier_auto) do
    table.insert(auto_luasnippets, snip)
end


return tab_luasnippets, auto_luasnippets
