return {
	"CRAG666/code_runner.nvim",
	dependencies = {
		"preservim/vimux",
	},
	config = function()
		local code_runner = require("code_runner")
		code_runner.setup({
			mode = "vimux",
			-- startinsert = true,
			-- float = {
			-- 	border = true,
			-- 	height = 0.8,
			-- 	width = 0.8,
			-- 	x = 0.5,
			-- 	y = 0.5,
			-- },
			filetype = {
				java = {
					"cd $dir &&",
					"javac $fileName &&",
					"java $fileNameWithoutExt",
				},
				python = "python3 -u",
				typescript = "deno run",
				rust = {
					"cd $dir &&",
					"rustc $fileName &&",
					"$dir/$fileNameWithoutExt",
				},
				html = {
					"cd $dir &&",
					"live-server",
				},
				c = function(...)
					c_base = {
						"cd $dir &&",
						"gcc $fileName -o",
						"/tmp/$fileNameWithoutExt",
					}
					local c_exec = {
						"&& /tmp/$fileNameWithoutExt &&",
						"rm /tmp/$fileNameWithoutExt",
					}
					vim.ui.input({ prompt = "Add more args:" }, function(input)
						c_base[4] = input
						vim.print(vim.tbl_extend("force", c_base, c_exec))
						require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
					end)
				end,
			},
		})
	end,
}
