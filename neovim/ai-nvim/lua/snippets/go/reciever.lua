local bufnr = 8
local winid = 1010

local cursor = vim.fn.getcurpos(winid)
local row = cursor[2] - 1
local col = cursor[3] - 1

local function isTypeDeclaration(node_type)
	if node_type == "type_declaration" then
		return true
	end

	return false
end

local function getStructAtCursor()
	local node = vim.treesitter.get_node({
		bufnr = bufnr,
		pos = { row, col },
	})
	while node ~= nil do
		if isTypeDeclaration(node:type()) then
			break
		end

		node = node:parent()
	end

	if not node then
		vim.notify("not inside struct")
		return
	end

	print(vim.treesitter.get_node_text(node, bufnr))
end

getStructAtCursor()
