print("snippets loaded")
local ls = require("luasnip")
local s = ls.s
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmta

local bufnr = 0

local function getStructs()
	local tree = vim.treesitter.get_parser(0):parse()[1]
	local query = assert(vim.treesitter.query.get("go", "return-snippets"), "no-query")

	local type_names = {}
	for id, node, capture in query:iter_captures(tree:root(), bufnr) do
		type_names[id] = vim.treesitter.get_node_text(node, bufnr)
	end

	return type_names
end

local function isStructType(line_to_cursor, matched_trigger, captures)
	local structs = getStructs()
	for _, type_name in pairs(structs) do
		local tn = type_name .. "."

		print("ltc", line_to_cursor)
		print("tn", tn)

		if line_to_cursor == tn then
			print(true)
			return true
		end
	end

	return false
end
local pattern = [[^(?:[A-Za-z_-][A-Za-z0-9_-]*\.)*[A-Za-z_-][A-Za-z0-9_-]*\.rec$]]

--ls.add_snippets("go", {
--	s(
--		{
--			trig = pattern,
--			name = "reciever function",
--			desc = "creates a reciever function for struct",
--			--show_condition = isStructType,
--			trig_engine = "ecma",
--		},
--		fmt(
--			[[
--        hello <val>
--        ]],
--			{
--				val = i(1),
--			}
--		)
--	),
--})
