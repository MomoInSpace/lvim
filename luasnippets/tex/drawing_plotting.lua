-- # vim: foldmethod=marker
-- # vim: foldmarker=({{,}})

-- some shorthands...
-- local utils = require("luasniputils.utils")
-- local ts_utils = require("luasniputils.ts_utils")
-- local pipe = utils.pipe
-- local is_math = utils.with_opts(utils.is_math, true)
-- local not_math = utils.with_opts(utils.not_math, true)
-- local no_backslash = utils.no_backslash

local auto_luasnippets = {}
local tab_luasnippets = {}

--# Start of Snippets -----------------------------------------({{
	
-- There is a choice node in there! How?
local plot_tikz_tab  = {
	parse({trig = "plot", name = "plot"}, 
	[[
	\begin{figure}[$1]
		\centering
		\begin{tikzpicture}
			\begin{axis}[
				xmin= ${2:-10}, xmax= ${3:10},
				ymin= ${4:-10}, ymax = ${5:10},
				axis lines = middle,
			]
				\addplot[domain=$2:$3, samples=${6:100}]{$7};
			\end{axis}
		\end{tikzpicture}
		\caption{$8}
		\label{${9:$8}}
	\end{figure}
	]]),
	parse({trig = "tikn", name = "tikz node"}, "\\node[$5] (${1/[^0-9a-zA-Z]//g}${2}) ${3:at (${4:0,0}) }{$${1}$};"),
}

for _, snip in ipairs(plot_tikz_tab) do
    snip.wordTrig = false
	table.insert(tab_luasnippets,snip)
end

-- }})

return tab_luasnippets, auto_luasnippets
