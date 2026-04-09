return {
	setup = function()
		local ai = require("codecompanion")

		ai.setup({
			ignore_warnings = true,
			strategies = {
				chat = {
					adapter = "copilot",
					model = "claude sonnet 4",
				},
			},
			opts = {
				log_level = "DEBUG",
			},
			adapters = {
				http = {
					openai = function()
						return require("codecompanion.adapters").extend("openai", {
							schema = {
								model = {
									default = "claude-sonnet-4",
								},
							},
						})
					end,
				},
			},
		})
	end,
}
