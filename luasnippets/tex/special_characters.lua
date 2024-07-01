-- # vim: foldmethod=marker
-- # vim: foldmarker=({{,}})
--
require("lsvars")
local mls                       = MyLuaSnipConfig

local auto_luasnippets          = {}
local tab_luasnippets           = {}

local basic_operators           = { --({{
    mls.bm({ trig = "td", name = "to the" }, mls.t("^{$1}$0")),
    mls.bm({ trig = " td", name = "to the apart" }, mls.t("^{$1} $0")),
    mls.bm({ trig = "tq", name = "to the" }, mls.t("\\sqrt{$1} $0")),
    -- mls.bm({ trig = "ttq", name = "to the" },           t("\\sqrt[$1]{$2} $0")),
    -- mls.bm({ trig = ";d", name = "down apart" },        t("_{$1} $0")),
    -- mls.bm({ trig = " ;d", name = "down apart afar" },  t("_{$1} $0")),
    mls.bm({ trig = " tb", name = "down apart" }, mls.t("_{$1} $0")),
    mls.bm({ trig = " txt", name = "text apart" }, mls.t("_{\\text{$1}} $0")),
    mls.bm({ trig = "text", name = "text" }, mls.t("\\text{$1} $0")),
    -- mls.bm({ trig = " ;tt", name = "text apart afar" }, t("_{\\text{$1}} $0")),
    mls.bm({ trig = " ^", name = "up apart" }, mls.t("^$0")),
    -- mls.bm({ trig = "tb", name = "down" },              t("_{$1}$0")),
    -- mls.bm({ trig = " _", name = "down afar" },         t("_")),
    -- mls.bm({ trig = "_T_", name = "down" },             t("_{\\text{$1}} $0")),
    mls.bm({ trig = "[*][*]", name = 'Cdots' }, mls.t("\\cdot")),
}                                   -- }})

local word_trig_operators       = { --({{
    mls.bm({ trig = "xx", name = 'times' }, mls.t("\\times")),
    mls.bm({ trig = "\\.\\.\\.", name = 'ldots' }, mls.t("\\ldots")),
    mls.bm({ trig = "=>", name = 'implies' }, mls.t("\\implies")),
    mls.bm({ trig = "<=", name = 'implied by' }, mls.t("\\impliedby")),
    mls.bm({ trig = "<>", name = 'iff' }, mls.t("\\iff")),
    mls.bm({ trig = "=n", name = 'unequals' }, mls.t("\\not=")),
    mls.bm({ trig = "=d", name = 'define' }, mls.t("\\equiv")),
    mls.bm({ trig = "=!", name = 'overset' }, mls.t("\\overset{${1:!}}{=}$0")),
    mls.bm({ trig = "<=", name = 'lower equal' }, mls.t("\\le")),
    mls.bm({ trig = ">=", name = 'lower equal' }, mls.t("\\ge")),
    mls.bm({ trig = ">>", name = 'gg' }, mls.t("\\gg")),
    mls.bm({ trig = "<<", name = 'll' }, mls.t("\\ll")),
    mls.s({
        trig      = "o*",
        name      = 'Verknuepfung',
        condition = mls.pipe({ mls.in_mathzone, mls.no_backslash }),
        wordTrig  = false,
    }, mls.t("\\circ")),
    mls.bm({ trig = "~~", name = 'sim' }, mls.t("\\sim")),
    mls.bm({ trig = "=s", name = 'sim2' }, mls.t("\\sim")),
    mls.bm({ trig = "cc", name = 'subset' }, mls.t("\\subset")),
    mls.bm({ trig = "qq", name = 'quad' }, mls.t("\\quad")),
    mls.bm({ trig = "tto", name = 'to' }, mls.t("\\to")),
    mls.bm({ trig = "->", name = 'to' }, mls.t("\\to")),
    mls.bm({ trig = "too", name = 'to' }, mls.t("\\to")),
    mls.bm({ trig = "dra", name = 'down to' }, mls.t("\\searrow")),
    mls.bm({ trig = "ura", name = 'up to' }, mls.t("\\nearrow")),
    mls.bm({ trig = "lra", name = 'leftrightarrow' }, mls.t("\\leftrightarrow")),
    mls.bm({ trig = "Lra", name = 'Leftrightarrow' }, mls.t("\\Leftrightarrow")),
    mls.bm({ trig = "mto", name = 'mapsto' }, mls.t("\\mapsto")),
    mls.bm({ trig = "invs", name = "inverse" }, mls.t("^{-1}")),
    mls.bm({ trig = "OO", name = "Order" }, mls.t("\\mathcal{O}")),
    mls.bm({ trig = "oo", name = "Infty" }, mls.t("\\infty")),
    mls.bm({ trig = "00", name = "empty" }, mls.t("\\emptyset")),
    mls.bm({ trig = "RR", name = "R" }, mls.t("\\mathbb{R}")),
    mls.bm({ trig = "QQ", name = "Q" }, mls.t("\\mathbb{Q}")),
    mls.bm({ trig = "ZZ", name = "Z" }, mls.t("\\mathbb{Z}")),
    mls.bm({ trig = "NN", name = "C" }, mls.t("\\mathbb{N}")),
    mls.bm({ trig = "CC", name = "C" }, mls.t("\\mathbb{C}")),
    mls.bm({ trig = "UU", name = "cup" }, mls.t("\\cup ")),
    mls.bm({ trig = "AA", name = "for all" }, mls.t("\\forall")),
    mls.bm({ trig = "Re", name = "Reynolds" }, mls.t("\\Re")),
    mls.bm({ trig = "||", name = "mid" }, mls.t(" \\mid ")),
    mls.bm({ trig = "Nn", name = "cap" }, mls.t("\\cap ")),
    mls.bm({ trig = "cc", name = "subset" }, mls.t("\\subset ")),
    mls.bm({ trig = "inn", name = "element of" }, mls.t("\\in ")),
    mls.bm({ trig = "nabl", name = "nabla" }, mls.t("\\nabla$0")),
    mls.bm({ trig = "dd", name = "diff_d" }, mls.t("\\mathtt{d}")),
    mls.bm({ trig = "DD", name = "diff_D" }, mls.t("\\mathtt{D}")),
    -- mls.bm({ trig = "mtt", name = "text" },          mls.t("\\mathtt{$1} $0")),
    -- mls.bm({ trig = "tt", name = "text" },           mls.t("\\text{$1} $0")),
    mls.bm({ trig = "SI", name = "text" }, mls.t("\\text{\\,$1} $0")),
    mls.bm({ trig = "del", name = "partial" }, mls.t("\\partial$0")),
    mls.bm({ trig = "deb", name = "partial" }, mls.t("\\partial_{$1} $0")),
    mls.bm({ trig = "sin", name = "sin" }, mls.t("\\text{sin} ")),
    mls.bm({ trig = "cos", name = "cos" }, mls.t("\\text{cos} ")),
    mls.bm({ trig = "tan", name = "tan" }, mls.t("\\text{tan} ")),
    mls.bm({ trig = "sec", name = "sec" }, mls.t("\\text{sec} ")),
    mls.bm({ trig = "csc", name = "csc" }, mls.t("\\text{csc} ")),
    mls.bm({ trig = "cot", name = "cot" }, mls.t("\\text{cot} ")),
    mls.bm({ trig = "ln", name = "ln" }, mls.t("\\text{ln}")),
    mls.bm({ trig = "log", name = "log" }, mls.t("\\text{log} ")),
    mls.bm({ trig = "exp", name = "exp" }, mls.t("\\text{exp} ")),
    mls.bm({ trig = "star", name = "star" }, mls.t("\\star ")),
    mls.bm({ trig = "'\\*", name = "star" }, mls.t("\\star ")),
    mls.bm({ trig = "pi", name = "pi" }, mls.t("\\pi ")),
    mls.bm({ trig = "perp", name = "perp" }, mls.t("\\perp ")),
    mls.bm({ trig = "sup", name = "sup" }, mls.t("\\text{sup} ")),
    mls.bm({ trig = "inf", name = "inf" }, mls.t("\\text{inf} ")),
    mls.bm({ trig = "max", name = "max" }, mls.t("\\text{max} ")),
    mls.bm({ trig = "min", name = "min" }, mls.t("\\text{min} ")),
    mls.bm({ trig = "arcsin", name = "arcsin" }, mls.t("\\text{arcsin} ")),
    mls.bm({ trig = "arctan", name = "arctan" }, mls.t("\\text{arctan} ")),
    mls.bm({ trig = "arcsec", name = "arcsec" }, mls.t("\\text{arcsec} ")),
    mls.bm({ trig = "asin", name = "asin" }, mls.t("\\text{arcsin} ")),
    mls.bm({ trig = "atan", name = "atan", priority = 2 }, mls.t("\\text{arctan} ")),
    mls.bm({ trig = "asec", name = "asec" }, { mls.t("\\text{arcsec} ") }),
}                                   -- }})

local basic_operators_backslash = { --({{
    mls.bmb({ trig = "\\sim~", name = 'approx' }, mls.t("\\approx")),
    mls.bmb({ trig = "~2", name = 'approx' }, mls.t("\\approx")),
    mls.bmb({ trig = "pto", name = 'propto' }, mls.t("\\propto")),
    mls.bmb({ trig = "\\\\s", name = 'setminus' }, mls.t("\\setminus")),
}                                                  -- }})

local greek_letters             = {                --({{
    mls.bm(";a", { mls.t({ '\\alpha' }) }),        -- alpha
    mls.bm(";A", { mls.t({ '\\Alpha' }) }),        -- Alpha
    mls.bm(";b", { mls.t({ '\\beta' }) }),         -- beta
    mls.bm(";B", { mls.t({ '\\Beta' }) }),         -- Beta
    mls.bm(";ch", { mls.t({ '\\chi' }) }),         -- chi
    mls.bm(";Ch", { mls.t({ '\\Chi' }) }),         -- Chi
    mls.bm(";d", { mls.t({ '\\delta' }) }),        -- delta
    mls.bm(";D", { mls.t({ '\\Delta' }) }),        -- Delta
    mls.bm(";ep", { mls.t({ '\\epsilon' }) }),     -- epsilon
    mls.bm(";Ep", { mls.t({ '\\Epsilon' }) }),     -- Epsilon
    mls.bm(";vep", { mls.t({ '\\varepsilon' }) }), -- varepsilon
    mls.bm(";et", { mls.t({ '\\eta' }) }),         -- eta
    mls.bm(";y", { mls.t({ '\\gamma' }) }),        -- gamma
    mls.bm(";Y", { mls.t({ '\\Gamma' }) }),        -- Gamma
    mls.bm(";i", { mls.t({ '\\iota' }) }),         -- iota
    mls.bm(";I", { mls.t({ '\\Iota' }) }),         -- Iota
    mls.bm(";k", { mls.t({ '\\kappa' }) }),        -- kappa
    mls.bm(";K", { mls.t({ '\\Kappa' }) }),        -- Kappa
    mls.bm(";l", { mls.t({ '\\lambda' }) }),       -- lambda
    mls.bm(";L", { mls.t({ '\\Lambda' }) }),       -- Lambda
    mls.bm(";m", { mls.t({ '\\mu' }) }),           -- mu
    mls.bm(";M", { mls.t({ '\\Mu' }) }),           -- Mu
    mls.bm(";n", { mls.t({ '\\nu' }) }),           -- nu
    mls.bm(";N", { mls.t({ '\\Nu' }) }),           -- Nu
    mls.bm(";w", { mls.t({ '\\omega' }) }),        -- omega
    mls.bm(";W", { mls.t({ '\\Omega' }) }),        -- Omega
    mls.bm(";ph", { mls.t({ '\\phi' }) }),         -- phi
    mls.bm(";Ph", { mls.t({ '\\Phi' }) }),         -- Phi
    mls.bm(";vph", { mls.t({ '\\varphi' }) }),     -- varphi
    mls.bm(";pi", { mls.t({ '\\pi' }) }),          -- pi
    mls.bm(";Pi", { mls.t({ '\\Pi' }) }),          -- Pi
    mls.bm(";ps", { mls.t({ '\\psi' }) }),         -- psi
    mls.bm(";Ps", { mls.t({ '\\Psi' }) }),         -- Psi
    mls.bm(";rh", { mls.t({ '\\rho' }) }),         -- rho
    mls.bm(";Rh", { mls.t({ '\\Rho' }) }),         -- Rho
    mls.bm(";vr", { mls.t({ '\\varrho' }) }),      -- varrho
    mls.bm(";Vr", { mls.t({ '\\Varrho' }) }),      -- Varrho
    mls.bm(";si", { mls.t({ '\\sigma' }) }),       -- sigma
    mls.bm(";Si", { mls.t({ '\\Sigma' }) }),       -- Sigma
    mls.bm(";ta", { mls.t({ '\\tau' }) }),         -- tau
    mls.bm(";Ta", { mls.t({ '\\Tau' }) }),         -- Tau
    mls.bm(";th", { mls.t({ '\\theta' }) }),       -- theta
    mls.bm(";Th", { mls.t({ '\\Theta' }) }),       -- Theta
    mls.bm(";vth", { mls.t({ '\\vartheta' }) }),   -- vartheta
    mls.bm(";x", { mls.t({ '\\xi' }) }),           -- xi
    mls.bm(";X", { mls.t({ '\\Xi' }) }),           -- Xi
    mls.bm(";z", { mls.t({ '\\zeta' }) }),         -- zeta
    mls.bm(";Z", { mls.t({ '\\Zeta' }) })          -- Zeta
}                                                  -- }})

for _, snip_list in ipairs({ basic_operators, word_trig_operators, basic_operators_backslash, greek_letters }) do
    for _, snip in ipairs(snip_list) do
        table.insert(auto_luasnippets, snip)
    end
end

return tab_luasnippets, auto_luasnippets
