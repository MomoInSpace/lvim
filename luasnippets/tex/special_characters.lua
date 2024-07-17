-- # vim: foldmethod=marker
-- # vim: foldmarker=({{,}})
--
require("lsvars")
local mls                       = MyLuaSnipConfig
local parse                     = mls.parse_bm

local auto_luasnippets          = {}
local tab_luasnippets           = {}

local basic_operators           = { --({{
    parse({ trig = "td", name = "to the" }, "^{$1}$0"),
    parse({ trig = " td", name = "to the apart" }, "^{$1} $0"),
    parse({ trig = "tq", name = "to the" }, "\\sqrt{$1} $0"),
    -- parse({ trig = "ttq", name = "to the" },           t("\\sqrt[$1]{$2} $0"),
    -- parse({ trig = ";d", name = "down apart" },        t("_{$1} $0"),
    -- parse({ trig = " ;d", name = "down apart afar" },  t("_{$1} $0"),
    parse({ trig = " tb", name = "down apart" }, "_{$1} $0"),
    parse({ trig = " txt", name = "text apart" }, "_{\\text{$1}} $0"),
    parse({ trig = "tex", name = "text" }, "\\text{$1} $0"),
    -- parse({ trig = " ;tt", name = "text apart afar" }, t("_{\\text{$1}} $0"),
    parse({ trig = " ^", name = "up apart" }, "^$0"),
    -- parse({ trig = "tb", name = "down" },              t("_{$1}$0"),
    -- parse({ trig = " _", name = "down afar" },         t("_"),
    -- parse({ trig = "_T_", name = "down" },             t("_{\\text{$1}} $0"),
    parse({ trig = "[*][*]", name = 'Cdots' }, "\\cdot"),
}                                   -- }})

local word_trig_operators       = { --({{
    parse({ trig = "xx", name = 'times' }, "\\times"),
    parse({ trig = "\\.\\.\\.", name = 'ldots' }, "\\ldots"),
    parse({ trig = "=>", name = 'implies' }, "\\implies"),
    parse({ trig = "<=", name = 'implied by' }, "\\impliedby"),
    parse({ trig = "<>", name = 'iff' }, "\\iff"),
    parse({ trig = "=n", name = 'unequals' }, "\\not="),
    parse({ trig = "=d", name = 'define' }, "\\equiv"),
    parse({ trig = "=!", name = 'overset' }, "\\overset{${1:!}}{=}$0"),
    parse({ trig = "<=", name = 'lower equal' }, "\\le"),
    parse({ trig = ">=", name = 'lower equal' }, "\\ge"),
    parse({ trig = ">>", name = 'gg' }, "\\gg"),
    parse({ trig = "<<", name = 'll' }, "\\ll"),
    mls.s({
        trig      = "o*",
        name      = 'Verknuepfung',
        condition = mls.pipe({ mls.in_mathzone, mls.no_backslash }),
        wordTrig  = false,
    }, mls.t("\\circ")),
    parse({ trig = "~~", name = 'sim' }, "\\sim"),
    parse({ trig = "=s", name = 'sim2' }, "\\sim"),
    parse({ trig = "cc", name = 'subset' }, "\\subset"),
    parse({ trig = "qq", name = 'quad' }, "\\quad"),
    parse({ trig = "tto", name = 'to' }, "\\to"),
    parse({ trig = "->", name = 'to' }, "\\to"),
    parse({ trig = "too", name = 'to' }, "\\to"),
    parse({ trig = "dra", name = 'down to' }, "\\searrow"),
    parse({ trig = "ura", name = 'up to' }, "\\nearrow"),
    parse({ trig = "lra", name = 'leftrightarrow' }, "\\leftrightarrow"),
    parse({ trig = "Lra", name = 'Leftrightarrow' }, "\\Leftrightarrow"),
    parse({ trig = "mto", name = 'mapsto' }, "\\mapsto"),
    parse({ trig = "invs", name = "inverse" }, "^{-1}"),
    parse({ trig = "OO", name = "Order" }, "\\mathcal{O}"),
    parse({ trig = "oo", name = "Infty" }, "\\infty"),
    -- parse({ trig = "00", name = "empty" }, "\\emptyset"),
    parse({ trig = "RR", name = "R" }, "\\mathbb{R}"),
    parse({ trig = "QQ", name = "Q" }, "\\mathbb{Q}"),
    parse({ trig = "ZZ", name = "Z" }, "\\mathbb{Z}"),
    parse({ trig = "NN", name = "C" }, "\\mathbb{N}"),
    parse({ trig = "CC", name = "C" }, "\\mathbb{C}"),
    parse({ trig = "UU", name = "cup" }, "\\cup "),
    parse({ trig = "AA", name = "for all" }, "\\forall"),
    parse({ trig = "Re", name = "Reynolds" }, "\\Re"),
    parse({ trig = "||", name = "mid" }, " \\mid "),
    parse({ trig = "Nn", name = "cap" }, "\\cap "),
    parse({ trig = "cc", name = "subset" }, "\\subset "),
    parse({ trig = "inn", name = "element of" }, "\\in "),
    parse({ trig = "nabl", name = "nabla" }, "\\nabla$0"),
    parse({ trig = "dd", name = "diff_d" }, "\\mathtt{d}"),
    parse({ trig = "DD", name = "diff_D" }, "\\mathtt{D}"),
    -- parse({ trig = "mtt", name = "text" }, "\\mathtt{$1} $0"),
    -- parse({ trig = "tt", name = "text" }, "\\text{$1} $0"),
    --parse({ trig = "SI", name = "text" }, "\\text{\\,$1} $0"),
    parse({ trig = "del", name = "partial" }, "\\partial$0"),
    parse({ trig = "deb", name = "partial" }, "\\partial_{$1} $0"),
    parse({ trig = "sin", name = "sin" }, "\\text{sin} "),
    parse({ trig = "cos", name = "cos" }, "\\text{cos} "),
    parse({ trig = "tan", name = "tan" }, "\\text{tan} "),
    parse({ trig = "sec", name = "sec" }, "\\text{sec} "),
    parse({ trig = "csc", name = "csc" }, "\\text{csc} "),
    parse({ trig = "cot", name = "cot" }, "\\text{cot} "),
    parse({ trig = "ln", name = "ln" }, "\\text{ln}"),
    parse({ trig = "log", name = "log" }, "\\text{log} "),
    parse({ trig = "exp", name = "exp" }, "\\text{exp} "),
    parse({ trig = "star", name = "star" }, "\\star "),
    parse({ trig = "'\\*", name = "star" }, "\\star "),
    parse({ trig = "pi", name = "pi" }, "\\pi "),
    parse({ trig = "perp", name = "perp" }, "\\perp "),
    parse({ trig = "sup", name = "sup" }, "\\text{sup} "),
    parse({ trig = "inf", name = "inf" }, "\\text{inf} "),
    parse({ trig = "max", name = "max" }, "\\text{max} "),
    parse({ trig = "min", name = "min" }, "\\text{min} "),
    parse({ trig = "arcsin", name = "arcsin" }, "\\text{arcsin} "),
    parse({ trig = "arctan", name = "arctan" }, "\\text{arctan} "),
    parse({ trig = "arcsec", name = "arcsec" }, "\\text{arcsec} "),
    parse({ trig = "asin", name = "asin" }, "\\text{arcsin} "),
    parse({ trig = "atan", name = "atan", priority = 2 }, "\\text{arctan} "),
    parse({ trig = "asec", name = "asec" }, "\\text{arcsec} "),
}                                   -- }})

local basic_operators_backslash = { --({{
    parse({ trig = "\\sim~", name = 'approx' }, "\\approx"),
    parse({ trig = "~2", name = 'approx' }, "\\approx"),
    parse({ trig = "pto", name = 'propto' }, "\\propto"),
    parse({ trig = "\\\\s", name = 'setminus' }, "\\setminus"), } -- }})

local greek_letters             = {                               --({{
    mls.bm(";a", { mls.t({ '\\alpha' }) }),                       -- alpha
    mls.bm(";A", { mls.t({ '\\Alpha' }) }),                       -- Alpha
    mls.bm(";b", { mls.t({ '\\beta' }) }),                        -- beta
    mls.bm(";B", { mls.t({ '\\Beta' }) }),                        -- Beta
    mls.bm(";ch", { mls.t({ '\\chi' }) }),                        -- chi
    mls.bm(";Ch", { mls.t({ '\\Chi' }) }),                        -- Chi
    mls.bm(";d", { mls.t({ '\\delta' }) }),                       -- delta
    mls.bm(";D", { mls.t({ '\\Delta' }) }),                       -- Delta
    mls.bm(";ep", { mls.t({ '\\epsilon' }) }),                    -- epsilon
    mls.bm(";Ep", { mls.t({ '\\Epsilon' }) }),                    -- Epsilon
    mls.bm(";vep", { mls.t({ '\\varepsilon' }) }),                -- varepsilon
    mls.bm(";et", { mls.t({ '\\eta' }) }),                        -- eta
    mls.bm(";y", { mls.t({ '\\gamma' }) }),                       -- gamma
    mls.bm(";Y", { mls.t({ '\\Gamma' }) }),                       -- Gamma
    mls.bm(";i", { mls.t({ '\\iota' }) }),                        -- iota
    mls.bm(";I", { mls.t({ '\\Iota' }) }),                        -- Iota
    mls.bm(";k", { mls.t({ '\\kappa' }) }),                       -- kappa
    mls.bm(";K", { mls.t({ '\\Kappa' }) }),                       -- Kappa
    mls.bm(";l", { mls.t({ '\\lambda' }) }),                      -- lambda
    mls.bm(";L", { mls.t({ '\\Lambda' }) }),                      -- Lambda
    mls.bm(";m", { mls.t({ '\\mu' }) }),                          -- mu
    mls.bm(";M", { mls.t({ '\\Mu' }) }),                          -- Mu
    mls.bm(";n", { mls.t({ '\\nu' }) }),                          -- nu
    mls.bm(";N", { mls.t({ '\\Nu' }) }),                          -- Nu
    mls.bm(";w", { mls.t({ '\\omega' }) }),                       -- omega
    mls.bm(";W", { mls.t({ '\\Omega' }) }),                       -- Omega
    mls.bm(";ph", { mls.t({ '\\phi' }) }),                        -- phi
    mls.bm(";Ph", { mls.t({ '\\Phi' }) }),                        -- Phi
    mls.bm(";vph", { mls.t({ '\\varphi' }) }),                    -- varphi
    mls.bm(";pi", { mls.t({ '\\pi' }) }),                         -- pi
    mls.bm(";Pi", { mls.t({ '\\Pi' }) }),                         -- Pi
    mls.bm(";ps", { mls.t({ '\\psi' }) }),                        -- psi
    mls.bm(";Ps", { mls.t({ '\\Psi' }) }),                        -- Psi
    mls.bm(";rh", { mls.t({ '\\rho' }) }),                        -- rho
    mls.bm(";Rh", { mls.t({ '\\Rho' }) }),                        -- Rho
    mls.bm(";vr", { mls.t({ '\\varrho' }) }),                     -- varrho
    mls.bm(";Vr", { mls.t({ '\\Varrho' }) }),                     -- Varrho
    mls.bm(";si", { mls.t({ '\\sigma' }) }),                      -- sigma
    mls.bm(";Si", { mls.t({ '\\Sigma' }) }),                      -- Sigma
    mls.bm(";ta", { mls.t({ '\\tau' }) }),                        -- tau
    mls.bm(";Ta", { mls.t({ '\\Tau' }) }),                        -- Tau
    mls.bm(";th", { mls.t({ '\\theta' }) }),                      -- theta
    mls.bm(";Th", { mls.t({ '\\Theta' }) }),                      -- Theta
    mls.bm(";vth", { mls.t({ '\\vartheta' }) }),                  -- vartheta
    mls.bm(";x", { mls.t({ '\\xi' }) }),                          -- xi
    mls.bm(";X", { mls.t({ '\\Xi' }) }),                          -- Xi
    mls.bm(";z", { mls.t({ '\\zeta' }) }),                        -- zeta
    mls.bm(";Z", { mls.t({ '\\Zeta' }) })                         -- Zeta
}                                                                 -- }})

for _, snip_list in ipairs({ basic_operators, word_trig_operators, basic_operators_backslash, greek_letters }) do
    for _, snip in ipairs(snip_list) do
        table.insert(auto_luasnippets, snip)
    end
end

return tab_luasnippets, auto_luasnippets
