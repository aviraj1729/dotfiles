return {
	"christoomey/vim-tmux-navigator",
	lazy = false, -- make sure it loads on startup
	config = function()
		-- Optional: You can skip this if you just want the default keys to work
		vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", { silent = true })
		vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", { silent = true })
		vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", { silent = true })
		vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", { silent = true })
		vim.keymap.set("n", "<C-\\>", ":TmuxNavigatePrevious<CR>", { silent = true })
	end,
}
