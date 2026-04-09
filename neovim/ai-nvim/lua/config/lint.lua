return {
	setup = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			-- its not yet clear to me what the
			-- golanci-lint does, so i have it disabled until i can find an
			-- example of a problem it will show me that gopls will not
			--go = { "golangcilint" },
		}
	end,
}
