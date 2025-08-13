return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzf-native.nvim",
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
		build = {
			cmd = "make",
		},
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local trouble = require("trouble")

		-- Setup Telescope
		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = function(prompt_bufnr)
							actions.send_selected_to_qflist(prompt_bufnr)
							require("trouble.providers.telescope").open()
						end,
					},
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = false, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				},
			},
		})

		-- Load extensions
		telescope.load_extension("fzf")

		-- Set keymaps
		local keymap = vim.keymap

		keymap.set(
			"n",
			"<leader>ff",
			"<cmd>Telescope find_files<cr>",
			{ silent = true, desc = "Fuzzy find files in cwd" }
		)
		keymap.set(
			"n",
			"<leader>fr",
			"<cmd>Telescope oldfiles<cr>",
			{ silent = true, desc = "Fuzzy find recent files" }
		)
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { silent = true, desc = "Find string in cwd" })
		keymap.set(
			"n",
			"<leader>fc",
			"<cmd>Telescope grep_string<cr>",
			{ silent = true, desc = "Find string under cursor in cwd" }
		)
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { silent = true, desc = "Find todos" })
	end,
}
