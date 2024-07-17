-- # vim: foldmethod=marker
-- # vim: foldmarker=({{,}})

local utils = require("luasniputils.utils")
-- local ts_utils = require("luasniputils.ts_utils")
--local pipe = utils.pipe
-- local is_math = utils.with_opts(utils.is_math, true)
local not_math = utils.with_opts(utils.not_math, true)
-- local no_backslash = utils.no_backslash

local auto_luasnippets = {}
local tab_luasnippets = {}

--# Start of Snippets -----------------------------------------({{


--# math environments -----------------------------------------

-- function for recursive luasnippets:
local rec_ls
rec_ls = function()
    return sn(nil, {
        c(1, {
            -- important!! Having the sn(...) as the first choice will cause infinite recursion.
            t({ "" }),
            -- The same dynamicNode as in the snippet (also note: self reference).
            sn(nil, { t({ "", "\t\\item " }), i(1), d(2, rec_ls, {}) }),
        }),
    });
end

local rec_align
rec_align = function()
    return sn(nil, {
        c(1, {
            -- important!! Having the sn(...) as the first choice will cause infinite recursion.
            t({ "" }),
            -- The same dynamicNode as in the snippet (also note: self reference).
            sn(nil, { t({ "", "\t\t" }), i(1), t(" &= "), i(2), t("\\\\"), d(3, rec_align, {}) }),
        }),
    });
end

local math_envs_tab = {
    -- Begin/End
    parse({ trig = "beg", name = "begin_env" },
        [[
	\\begin{$1}
		$2
	\\end{$1} $0
	]]),
    -- Equation
    parse({ trig = "equ", name = "begin_equation" },
        [[
	\\begin{equation}
		$1
		\\label{eq_$2}
	\\end{equation} $0
	]]),
    -- Aligned
    parse({ trig = "ali", name = "begin_align*" },
        [[
	\\begin{aligned}
		$1
	\\end{aligned} $0
	]]),
    -- Aligne*
    parse({ trig = "alis", name = "begin_align*" },
        [[
	\\begin{align*}
		$1
	\\end{align*} $0
	]]),
    -- Equation Aligned
    parse({ trig = "ale", name = "begin_equation_aligned" },
        [[
	\\begin{equation}
		\\begin{aligned}
			$1
		\\end{aligned}
		\\label{eq_$2}
	\\end{equation}$0
	]]),
    -- \label:
    parse({ trig = "lab", name = "label" }, "\\label{$1}$0"),
    -- figure
    parse({ trig = "fig", name = "figure" },
        [[
	\begin{figure}[${1:htpb}]
		\centering
		\includegraphics[width=0.8\textwidth]{$2}
		\caption{$3}
		\label{fig_$4}
	\end{figure} $0
	]]),
    parse({ trig = "figs", name = "figure" },
        [[
	\begin{figure}[${1:htpb}]
		\centering
		$2
		\hfill
		$3
		\caption{$4}
		\label{fig_$5}
	\end{figure} $0
	]]),
    parse({ trig = "subfig", name = "subfigure" },
        [[
     \begin{subfigure}[b]{0.49\textwidth}
	\centering
	\includegraphics[width=1\textwidth]{$1}
	\caption{$2}
	\label{fig_sub_$3}
     \end{subfigure} $0
	]]),
    -- list
    s("ls", {
        t({ "\\begin{itemize}",
            "\t\\item " }), i(1), d(2, rec_ls, {}),
        t({ "", "\\end{itemize}" }), i(0)
    }),
    -- enumerate
    s("enum", {
        t({ "\\begin{enumerate}" }),
        c(1, {
            t(''),
            t('[a)]'),
            t('[I)]'),
            { t('['), i(1), t(']') },
        }),
        t({ "", "\t\\item " }), i(2), d(3, rec_ls, {}),
        t({ "", "\\end{enumerate}" }), i(0)
    }),
    -- enumerate
    s("eac", {
        t({ "\\begin{equation}" }),
        t({ "", "\t\\begin{aligned}" }),
        t({ "", "\t\t" }), i(1), t(" &= "), i(2), t("\\\\"), d(3, rec_align, {}),
        t({ "", "\t\\end{aligned}" }),
        t({ "", "\t\\label{eq_" }), i(4), t({ "}" }),
        t({ "", "\\end{equation}" }), i(0)
    }),
}

for _, snip in ipairs(math_envs_tab) do
    snip.wordTrig = true
    table.insert(tab_luasnippets, snip)
end


local math_envs_auto = {
    parse({ trig = "mk", name = "inline_math" }, "\\$$1\\$"),
}

for _, snip in ipairs(math_envs_auto) do
    snip.condition = not_math --pipe({ is_math })
    snip.show_condition = not_math
    snip.wordTrig = true
    table.insert(auto_luasnippets, snip)
end



--# Theorems -----------------------------------------({{

local theorems_tab = {
    parse({ trig = "de", name = "Defintion" }, "\\begin{de}[$1]\n $2 \n\\label{de_$1}\n\\end{de}\n$0"),
    parse({ trig = "rem", name = "Remark" }, "\\begin{rem}[$1]\n $2 \n\\label{rem_$1}\n\\end{rem}\n$0"),
    parse({ trig = "ex", name = "Example" }, "\\begin{ex}[$1]\n $2 \n\\label{ex_$1}\n\\end{ex}\n$0"),
    parse({ trig = "lem", name = "Lemma" }, "\\begin{lem}[$1]\n $2 \n\\label{lem_$1}\n\\end{lem}\n$0"),
    parse({ trig = "thm", name = "Theorem" }, "\\begin{thm}[$1]\n $2 \n\\label{thm_$1}\n\\end{thm}\n$0"),
    parse({ trig = "cor", name = "Corollary" }, "\\begin{cor}[$1]\n $2 \n\\label{cor_$1}\n\\end{cor}\n$0"),

}

for key, snip in ipairs(theorems_tab) do
    snip.priority = key
    snip.wordTrig = false
    table.insert(tab_luasnippets, snip)
end
-- }})

--# sections -----------------------------------------({{

local sections_tab = {
    parse({ trig = "part", name = "part" }, "\\part{$1}\n$0"),
    parse({ trig = "chap", name = "chapter" }, "\\chapter{$1}\n$0"),
    parse({ trig = "sec", name = "section" }, "\\section{$1}\n$0"),
    parse({ trig = "sub", name = "subsection" }, "\\subsection{$1}\n$0"),
    parse({ trig = "sub2", name = "subsubsection" }, "\\subsubsection{$1}\n$0"),
    parse({ trig = "part*", name = "part" }, "\\part*{$1}\n$0"),
    parse({ trig = "chap*", name = "chapter" }, "\\chapter*{$1}\n$0"),
    parse({ trig = "sec*", name = "section" }, "\\section*{$1}\n$0"),
    parse({ trig = "sub*", name = "subsection" }, "\\subsection*{$1}\n$0"),
    parse({ trig = "sub2*", name = "subsubsection" }, "\\subsubsection*{$1}\n$0"),
}

for key, snip in ipairs(sections_tab) do
    snip.priority = key
    snip.wordTrig = false
    table.insert(tab_luasnippets, snip)
end
-- }})

--# Textblocks -----------------------------------------({{

local text_luasnippets_tab = {
    -- emphasize
    parse({ trig = "emp", name = "emphasize" }, "\\emph{$1}$0"),
    -- textbf
    parse({ trig = "bf", name = "textbf" }, "\\textbf{$1}$0"),
    parse({ trig = "ref", name = "ref" }, "\\ref{$1}$0"),
    parse({ trig = "eqr", name = "ref equation" }, "\\eqref{eq_$1}$0"),
}

for key, snip in ipairs(text_luasnippets_tab) do
    snip.priority = key
    snip.wordTrig = false
    table.insert(tab_luasnippets, snip)
end
-- }})

-- }})

return tab_luasnippets, auto_luasnippets


-- -- # vim: foldmethod=marker
-- -- # vim: foldmarker=({{,}})

-- -- This needs to be made better!!!


-- require("lsvars")
-- local s                = MyLuaSnipConfig.bm
-- local sn               = MyLuaSnipConfig.sn
-- local c                = MyLuaSnipConfig.c
-- local t                = MyLuaSnipConfig.t
-- local d                = MyLuaSnipConfig.d
-- local i                = MyLuaSnipConfig.i

-- local auto_luasnippets = {}
-- local tab_luasnippets  = {}

-- -- function for recursive luasnippets:
-- local rec_ls
-- rec_ls                 = function()
--     return sn(nil, {
--         c(1, {
--             -- important!! Having the sn(...) as the first choice will cause infinite recursion.
--             t({ "" }),
--             -- The same dynamicNode as in the snippet (also note: self reference).
--             sn(nil, { t({ "", "\t\\item " }), i(1), d(2, rec_ls, {}) }),
--         }),
--     })
-- end

-- local rec_align
-- rec_align              = function()
--     return sn(nil, {
--         c(1, {
--             -- important!! Having the sn(...) as the first choice will cause infinite recursion.
--             t({ "" }),
--             -- The same dynamicNode as in the snippet (also note: self reference).
--             sn(nil, { t({ "", "\t\t" }), i(1), t(" &= "), i(2), t("\\\\"), d(3, rec_align, {}) }),
--         }),
--     })
-- end

-- local math_envs_tab    = { --({{
--     -- Begin/End ({{
--     s({ trig = "beg", name = "begin_env" }, {
--         t("\\begin{$1}\n\t$2\n\\end{$1} $0")
--     }), --}})

--     -- Equation ({{
--     s({ trig = "equ", name = "begin_equation" }, {
--         t("\\begin{equation}\n\t$1\n\t\\label{eq_$2}\n\\end{equation} $0")
--     }), --}})

--     -- Sub equations ({{
--     s({ trig = "subeq", name = "sub equations" }, {
--         t("\\begin{subequations}\n\\begin{align}\n\t$1\n\\end{align}\n\\label{eq_$2}\n\\end{subequations} $0")
--     }), --}})

--     -- Aligned ({{
--     s({ trig = "ali", name = "begin_align" }, {
--         t("\\begin{align}\n\t$1\n\\end{align} $0")
--     }), --}})

--     -- Aligned* ({{
--     s({ trig = "alid", name = "begin_align*" }, {
--         t("\\begin{aligned}\n\t$1\n\\end{aligned} $0")
--     }), --}})

--     -- Align* ({{
--     s({ trig = "alis", name = "begin_align*" }, {
--         t("\\begin{align*}\n\t$1\n\\end{align*} $0")
--     }), --}})

--     -- Equation Aligned ({{
--     s({ trig = "ale", name = "begin_equation_aligned" }, {
--         t("\\begin{equation}\n\\begin{aligned}\n\t$1\n\\end{aligned}\n\\label{eq_$2}\n\\end{equation}$0")
--     }), --}})

--     -- ExerciseLine ({{
--     s({ trig = "exlin", name = "exercise Line" }, {
--         t(
--             "---------------------------------------------------------------------------------------------------------------")
--     }), --}})

--     -- \label ({{
--     s({ trig = "lab", name = "label" }, {
--         t("\\label{$1}$0")
--     }), --}})

--     -- Figure ({{
--     s({ trig = "fig", name = "figure" }, {
--         t(
--             "\\begin{figure}[${1:htpb}]\n\t\\centering\n\t\\includegraphics[width=0.8\\textwidth]{$2}\n\t\\caption{$3}\n\t\\label{fig_$4}\n\\end{figure} $0")
--     }), --}})

--     -- Subfigure ({{
--     s({ trig = "subfig", name = "subfigure" }, {
--         t(
--             "\\begin{subfigure}[b]{0.49\\textwidth}\n\t\\centering\n\t\\includegraphics[width=1\\textwidth]{$1}\n\t\\caption{$2}\n\t\\label{fig_sub_$3}\n\\end{subfigure} $0")
--     }), --}})

--     -- List ({{
--     s("ls", {
--         t("\\begin{itemize}\n\t\\item "), i(1), d(2, rec_ls, {}), t("\n\\end{itemize}"), i(0)
--     }), --}})

--     -- Enumerate ({{
--     s("enum", {
--         t("\\begin{enumerate}"), c(1, { t(''), t('[a)]'), t('[I)]'), { t('['), i(1), t(']') } }),
--         t("\n\t\\item "), i(2), d(3, rec_ls, {}), t("\n\\end{enumerate}"), i(0)
--     }), --}})

--     -- Enumerate with align ({{
--     s("eac", {
--         t("\\begin{equation}\n\t\\begin{aligned}\n\t\t"), i(1), t(" &= "), i(2), t("\\\\"), d(3, rec_align, {}),
--         t("\n\t\\end{aligned}\n\t\\label{eq_"), i(4), t("}\n\\end{equation}"), i(0)
--     }), --}})
-- }       --}})

-- for _, snip in ipairs(math_envs_tab) do
--     table.insert(tab_luasnippets, snip)
-- end

-- local math_envs_auto = { --({{
--     s({ trig = "mk", name = "inline_math" }, { t("\\11\\1") })
-- }                        --}})

-- for _, snip in ipairs(math_envs_auto) do
--     table.insert(auto_luasnippets, snip)
-- end

-- local theorems_tab = { --({{
--     s({ trig = "de", name = "Defintion" }, { t("\\begin{de}[$1]\n $2 \n\\label{de_$1}\n\\end{de}\n$0") }),
--     s({ trig = "rem", name = "Remark" }, { t("\\begin{rem}[$1]\n $2 \n\\label{rem_$1}\n\\end{rem}\n$0") }),
--     s({ trig = "ex", name = "Example" }, { t("\\begin{ex}[$1]\n $2 \n\\label{ex_$1}\n\\end{ex}\n$0") }),
--     s({ trig = "lem", name = "Lemma" }, { t("\\begin{lem}[$1]\n $2 \n\\label{lem_$1}\n\\end{lem}\n$0") }),
--     s({ trig = "thm", name = "Theorem" }, { t("\\begin{thm}[$1]\n $2 \n\\label{thm_$1}\n\\end{thm}\n$0") }),
--     s({ trig = "cor", name = "Corollary" }, { t("\\begin{cor}[$1]\n $2 \n\\label{cor_$1}\n\\end{cor}\n$0") }),
-- } --}})

-- for key, snip in ipairs(theorems_tab) do
--     -- snip.priority = key
--     -- snip.wordTrig = false
--     table.insert(tab_luasnippets, snip)
-- end
-- -- }})

-- --# sections -----------------------------------------({{
-- local sections_tab = {
--     s({ trig = "part", name = "part" }, { t("\\part{$1}\n$0") }),
--     s({ trig = "chap", name = "chapter" }, { t("\\chapter{$1}\n$0") }),
--     s({ trig = "sec", name = "section" }, { t("\\section{$1}\n$0") }),
--     s({ trig = "sub", name = "subsection" }, { t("\\subsection{$1}\n$0") }),
--     s({ trig = "sub2", name = "subsubsection" }, { t("\\subsubsection{$1}\n$0") }),
--     s({ trig = "part*", name = "part*" }, { t("\\part*{$1}\n$0") }),
--     s({ trig = "chap*", name = "chapter*" }, { t("\\chapter*{$1}\n$0") }),
--     s({ trig = "sec*", name = "section*" }, { t("\\section*{$1}\n$0") }),
--     s({ trig = "sub*", name = "subsection*" }, { t("\\subsection*{$1}\n$0") }),
--     s({ trig = "sub2*", name = "subsubsection*" }, { t("\\subsubsection*{$1}\n$0") })
-- } --}})

-- for key, snip in ipairs(sections_tab) do
--     table.insert(tab_luasnippets, snip)
-- end

-- --# Textblocks -----------------------------------------({{
-- local text_luasnippets_tab = {
--     s({ trig = "emp", name = "emphasize" }, { t("\\emph{$1}$0") }),
--     s({ trig = "bf", name = "textbf" }, { t("\\textbf{$1}$0") }),
--     s({ trig = "ref", name = "ref" }, { t("\\ref{$1}$0") }),
--     s({ trig = "eqr", name = "ref equation" }, { t("\\eqref{eq_$1}$0") }),
--     s({ trig = "feqr", name = "free ref equation" }, { t("\\eqref{$1}$0") })
-- } --}})

-- for key, snip in ipairs(text_luasnippets_tab) do
--     table.insert(tab_luasnippets, snip)
-- end

-- return tab_luasnippets, auto_luasnippets
