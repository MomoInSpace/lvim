-- # vim: foldmethod=marker
-- # vim: foldmarker=({{,}})

require("lsvars")
local mls                 = MyLuaSnipConfig
local bm                  = mls.bm
local t                   = mls.t

local auto_luasnippets    = {}
local tab_luasnippets     = {}

local basic_math_ops_tab  = { --({{
    bm({ trig = "Dt", name = "Absolute Diff" }, { t({ "\\frac{\\text{D} $1}{\\text{D} $2} $0" }) }),
    bm({ trig = "Dtt", name = "Absolute Diff time" }, { t({ "\\frac{\\text{D} $1}{\\text{D} t} $0" }) }),
    bm({ trig = "dt", name = "Small absolute Diff" }, { t({ "\\frac{\\text{d} $1}{\\text{d} $2} $0" }) }),
    bm({ trig = "det", name = "partial diff" }, { t({ "\\frac{\\partial $1}{\\partial $2} $0" }) }),
    bm({ trig = "Dt(", name = "Absolute Diff" }, { t({ "\\left(\\frac{\\Dt $1}{\\Dt $2}\\right) $0" }) }),
    bm({ trig = "Dtt(", name = "Absolute Diff time" }, { t({ "\\left(\\frac{\\Dt $1}{\\Dt}\\right) $0" }) }),
    bm({ trig = "dt(", name = "Small absolute Diff" }, { t({ "\\left(\\frac{\\d $1}{\\d $2}\\right) $0" }) }),
    bm({ trig = "det(", name = "partial diff" },
        { t({ "\\left(\\frac{\\partial $1}{\\partial $2}\\right) $0" }) }),
    bm({ trig = "SI", name = "Si units" }, { t({ "\\SI{$1}{$2}$0" }) }),
    bm({ trig = "si", name = "Si units small" }, { t({ "\\,\\si{$1}$0" }) }),
    bm({ trig = "int", name = "integral" }, { t({ "\\int_{$1}$0" }) }),
    bm({ trig = "Int", name = "Integral" }, { t({ "\\int_{$1}^{$2}$0" }) }),
    bm({ trig = "sum", name = "sum" }, { t({ "\\sum_{$1}$0" }) }),
    bm({ trig = "Sum", name = "sum" }, { t({ "\\sum_{$1}^{$2}$0" }) }),
    bm({ trig = "prod", name = "prod" }, { t({ "\\prod_{$1}$0" }) }),
    bm({ trig = "Prod", name = "Prod" }, { t({ "\\prod_{$1}^{$2}$0" }) }),
    bm({ trig = "lim", name = "lim" }, { t({ "\\lim_{$1}$0" }) }),
    -- bm({ trig = "mc",    name = "Mathcal" },           { t({ "\\mathcal{$1}$0" }) }),
    bm({ trig = "set", name = "set" }, { t({ "\\{$1 \\\\}$0" }) }),
    bm({ trig = "abs", name = "abs" }, { t({ "|$1| $0" }) }),
}                             --}})

local basic_math_ops_auto = { --({{
    -- bm({ trig = "lr(", name = "left right ()" }, { t({ "\\left($1\\right) $0" }) }),
    -- bm({ trig = "lr[", name = "left right []" }, { t({ "\\left[ $1\\right] $0" }) }),
    -- bm({ trig = "lrg(", name = "left right {}" }, { t({ "\\left\\\\{ 1 \\right\\\\} " }) }),
    -- bm({ trig = "lr|", name = "left right ||" }, { t({ "\\left|$1\\right |$0" }) }),
    -- bm({ trig = "lr<", name = "left right <>" }, { t({ "\\left< $1 \\right> $0" }) }),
    -- bm({ trig = "lr{", name = "left right {}" }, { t({ "\\left\\{ $1 \\right\\}" }) }),

    -- parse({ trig = "ll(", name = "left (" }, "\\left($0"),
    -- parse({ trig = "rr)", name = "right )" }, "\\right)$0"),
    -- parse({ trig = "ll[", name = "left [" }, "\\left[$0"),
    -- parse({ trig = "rr]", name = "right ]" }, "\\right]$0"),
    -- parse({ trig = "llg(", name = "left {" }, "\\left\\{$0"),
    -- parse({ trig = "rrg)", name = "right }" }, "\\right\\}$0"),
} --}})

for _, snip in ipairs(basic_math_ops_tab) do
    table.insert(tab_luasnippets, snip)
end

for _, snip in ipairs(basic_math_ops_auto) do
    table.insert(auto_luasnippets, snip)
end

return tab_luasnippets, auto_luasnippets
