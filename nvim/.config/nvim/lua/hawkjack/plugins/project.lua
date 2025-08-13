return {
	"ahmedkhalf/project.nvim",
	opts = {
		manual_mode = true,
	},
	event = "VeryLazy",
	config = function()
		require("project_nvim").setup({
			patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
			detection_methods = { "lsp", "pattern" },
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		})
	end,
	keys = {
		{ "<leader>p", "<Cmd>Telescope projects<CR>", desc = "Projects" },
	},
}
