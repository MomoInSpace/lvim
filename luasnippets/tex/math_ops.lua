-- # vim: foldmethod=marker
-- # vim: foldmarker=({{,}})

require("lsvars")
local mls                 = MyLuaSnipConfig
local bm                  = mls.bm
local t                   = mls.t
local parse               = mls.parse_bm

local auto_luasnippets    = {}
local tab_luasnippets     = {}

local basic_math_ops_tab  = { --({{
    parse({ trig = "Dt", name = "Absolute Diff" }, "\\frac{\\text{D} $1}{\\text{D} $2} $0"),
    parse({ trig = "Dtt", name = "Absolute Diff time" }, "\\frac{\\text{D} $1}{\\text{D} t} $0"),
    parse({ trig = "dt", name = "Small absolute Diff" }, "\\frac{\\text{d} $1}{\\text{d} $2} $0"),
    parse({ trig = "det", name = "partial diff" }, "\\frac{\\partial $1}{\\partial $2} $0"),
    parse({ trig = "Dt(", name = "Absolute Diff" }, "\\left(\\frac{\\Dt $1}{\\Dt $2}\\right) $0"),
    parse({ trig = "Dtt(", name = "Absolute Diff time" }, "\\left(\\frac{\\Dt $1}{\\Dt}\\right) $0"),
    parse({ trig = "dt(", name = "Small absolute Diff" }, "\\left(\\frac{\\d $1}{\\d $2}\\right) $0"),
    parse({ trig = "det(", name = "partial diff" }, "\\left(\\frac{\\partial $1}{\\partial $2}\\right) $0"),
    parse({ trig = "SI", name = "Si units" }, "\\,\\si{$1}$0"),
    parse({ trig = "si", name = "Si units small" }, "\\si{$1}$0"),
    parse({ trig = "int", name = "integral" }, "\\int_{$1}$0"),
    parse({ trig = "Int", name = "Integral" }, "\\int_{$1}^{$2}$0"),
    parse({ trig = "sum", name = "sum" }, "\\sum_{$1}$0"),
    parse({ trig = "Sum", name = "sum" }, "\\sum_{$1}^{$2}$0"),
    parse({ trig = "prod", name = "prod" }, "\\prod_{$1}$0"),
    parse({ trig = "Prod", name = "Prod" }, "\\prod_{$1}^{$2}$0"),
    parse({ trig = "lim", name = "lim" }, "\\lim_{$1}$0"),
    -- parse({ trig = "mc",    name = "Mathcal" }, "\\mathcal{$1}$0" ),
    parse({ trig = "set", name = "set" }, "\\{$1 \\\\}$0"),
    parse({ trig = "abs", name = "abs" }, "|1∣1| 1∣0"), -- bm({ trig = "abs", name = "abs" }, { t({ "|$1| $0" }) }),
} --}})

local basic_math_ops_auto = { --({{
    -- bm({ trig = "lr\\(", name = "left right ()" }, { t({ "\\left($1\\right) $0" }) }),
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
