return {
	setup = function()
		local dap, dapui = require("dap"), require("dapui")
		local dapgo = require("dap-go")

		--dapui.setup()
		--dapgo.setup()

		--dap.listeners.before.attach.dapui_config = function()
		--	dapui.open()
		--end

		--dap.listeners.before.launch.dapui_config = function()
		--	dapui.open()
		--end

		vim.keymap.set("n", "<leader>c", function()
			dap.continue()
		end)
		vim.keymap.set("n", "<F10>", function()
			dap.step_over()
		end)
		vim.keymap.set("n", "<F11>", function()
			dap.step_into()
		end)
		vim.keymap.set("n", "<F12>", function()
			dap.step_out()
		end)
		vim.keymap.set("n", "<Leader>q", function()
			dap.toggle_breakpoint()
		end)
		vim.keymap.set("n", "<Leader>Q", function()
			dap.set_breakpoint()
		end)
		vim.keymap.set("n", "<Leader>lp", function()
			dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end)
		vim.keymap.set("n", "<Leader>dr", function()
			dap.repl.open()
		end)
		vim.keymap.set("n", "<Leader>dl", function()
			dap.run_last()
		end)
	end,
}
