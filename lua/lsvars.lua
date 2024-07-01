local ls           = require("luasnip")
local s            = ls.snippet
local utils        = require("luasniputils.utils")
local pipe         = utils.pipe
local no_backslash = utils.no_backslash

local in_mathzone  = function()
    -- The `in_mathzone` function requires the VimTeX plugin
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

MyLuaSnipConfig    = {
    ls           = require("luasnip"),
    s            = ls.snippet,
    sn           = ls.snippet_node,
    t            = ls.text_node,
    i            = ls.insert_node,
    f            = ls.function_node,
    c            = ls.choice_node,
    d            = ls.dynamic_node,
    r            = ls.restore_node,
    l            = require("luasnip.extras").lambda,
    rep          = require("luasnip.extras").rep,
    p            = require("luasnip.extras").partial,
    m            = require("luasnip.extras").match,
    n            = require("luasnip.extras").nonempty,
    dl           = require("luasnip.extras").dynamic_lambda,
    fmt          = require("luasnip.extras.fmt").fmt,
    fmta         = require("luasnip.extras.fmt").fmta,
    types        = require("luasnip.util.types"),
    conds        = require("luasnip.extras.expand_conditions"),
    parse        = ls.parser.parse_snippet,
    utils        = require("luasniputils.utils"),
    ts_utils     = require("luasniputils.ts_utils"),
    pipe         = utils.pipe,
    is_math      = utils.with_opts(utils.is_math, true),
    not_math     = utils.with_opts(utils.not_math, true),
    no_backslash = utils.no_backslash,
    in_mathzone  = function()
        -- The `in_mathzone` function requires the VimTeX plugin
        return vim.fn['vimtex#syntax#in_mathzone']() == 1
    end,
    -- basic math
    bm           = ls.extend_decorator.apply(s,
        {
            condition = pipe({ in_mathzone, no_backslash }),
            show_condition = in_mathzone,
            wordTrig = false,
            regTrig = true,
            priority = 1
        }),
    -- basic math bracket
    bmb          = ls.extend_decorator.apply(s,
        {
            condition = pipe({ in_mathzone }),
            show_condition = in_mathzone,
            wordTrig = false,
            regTrig = true,
            priority = 1
        }),
}

return MyLuaSnipConfig
