-- # vim: foldmethod=marker
-- # vim: foldmarker=({{,}})

-- some shorthands...
local utils = require("luasniputils.utils")
-- local ts_utils = require("luasniputils.ts_utils")
local pipe = utils.pipe
local is_math = utils.with_opts(utils.is_math, true)
-- local not_math = utils.with_opts(utils.not_math, true)
local no_backslash = utils.no_backslash

local auto_luasnippets = {}
local tab_luasnippets = {}

--# Start of Snippets -----------------------------------------({{

local vec_node = {
  f(function(_, snip)
    return string.format("\\overrightarrow{%s}", snip.captures[1])
  end, {}),
}

local hat_node = {
  f(function(_, snip)
    return string.format("\\hat{%s}", snip.captures[1])
  end, {}),
}

local bar_node = {
  f(function(_, snip)
    return string.format("\\overline{%s}", snip.captures[1])
  end, {}),
}

-- Instead use Boldsymbol
-- local ff_node = {
--   f(function(_, snip)
--     return string.format("\\mathbf{%s}", snip.captures[1])
--   end, {}),
-- }

local brace_node = {
  f(function(_, snip)
    return string.format("\\underbrace{%s}", snip.captures[1])
  end, {}),
}

local bold_node = {
  f(function(_, snip)
    return string.format("\\boldsymbol{%s}", snip.captures[1])
  end, {}),
}

local tilde_node = {
  f(function(_, snip)
    return string.format("\\widetilde{%s}", snip.captures[1])
  end, {}),
}

local math_bb_node = {
  f(function(_, snip)
    return string.format("\\mathbb{%s}", snip.captures[1])
  end, {}),
}

local math_cal_node = {
  f(function(_, snip)
    return string.format("\\mathcal{%s}", snip.captures[1])
  end, {}),
}

local math_prime_node = {
  f(function(_, snip)
    return string.format("%s^{\\prime}", snip.captures[1])
  end, {}),
}

local math_star_node = {
  f(function(_, snip)
    return string.format("%s^{*}", snip.captures[1])
  end, {}),
}

local nodearray = 	{vec_node, hat_node, bar_node, bold_node, brace_node, bold_node, tilde_node, math_bb_node, math_cal_node,math_prime_node, math_star_node }
local trigarray = 	{"vec", "hat", "bar", "ff", "ubrace", "bb","til", "mbb", "mcal", "''", "star"}
modyfier_auto = {}


for key, node in pairs(nodearray) do
	regex_strings = {
		"([%w]+)",
		"(\\[%a]+[%{]?[%w]+[%}]?)",
		"%(([%a,%\\%{%}_%s%d%+%-%^]+)%)"
	}

	for regKey, trigString in pairs(regex_strings) do

		local trigger = trigString..trigarray[key]
		node_double_char = s({ trig = trigger}, vim.deepcopy(node))
		table.insert(modyfier_auto,node_double_char)
	end
end


--local modyfier_tab = {
--s({ trig = "([%a][%a])(%.,)" }, vim.deepcopy(vec_node)),
--s({ trig = "([%a][%a])(,%.)" }, vim.deepcopy(vec_node)),
--s({ trig = "([%a])(%.,)" }, vim.deepcopy(vec_node)),
--s({ trig = "([%a])(,%.)" }, vim.deepcopy(vec_node)),
--}

for key, snip in ipairs(modyfier_auto) do
	snip.priority = key
    snip.regTrig = true
	snip.condition = pipe({is_math, no_backslash})
	table.insert(auto_luasnippets,snip)
end

-- }})

return tab_luasnippets, auto_luasnippets
