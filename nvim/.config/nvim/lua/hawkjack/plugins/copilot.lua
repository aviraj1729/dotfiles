return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			local chat = require("CopilotChat")

			chat.setup({
				debug = false,
				auto_load = true,
				show_help = false,
				window = {
					layout = "float",
					width = 0.5,
					height = 0.6,
					border = "rounded",
				},
				mappings = {
					-- 👇 this is the key fix
					submit = {
						normal = "<CR>",
						insert = "<CR>",
					},
					close = { normal = "q", insert = "<C-c>" },
					reset = { normal = "<leader>r" },
				},
			})

			-- Ensure <CR> works properly in insert mode inside chat
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "copilot-chat",
				callback = function()
					vim.keymap.set("i", "<CR>", function()
						chat.ask() -- sends message
					end, { buffer = true })
				end,
			})

			-- Shortcut to toggle chat
			vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat" })
		end,
	},
}
