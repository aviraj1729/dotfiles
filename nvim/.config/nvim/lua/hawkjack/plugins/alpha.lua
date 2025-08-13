return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = {
			[[██╗  ██╗ █████╗ ██╗       ██╗██╗  ██╗     ██╗ █████╗  █████╗ ██╗  ██╗]],
			[[██║  ██║██╔══██╗██║  ██╗  ██║██║ ██╔╝     ██║██╔══██╗██╔══██╗██║ ██╔╝]],
			[[███████║███████║╚██╗████╗██╔╝█████═╝      ██║███████║██║  ╚═╝█████═╝ ]],
			[[██╔══██║██╔══██║ ████╔═████║ ██╔═██╗ ██╗  ██║██╔══██║██║  ██╗██╔═██╗ ]],
			[[██║  ██║██║  ██║ ╚██╔╝ ╚██╔╝ ██║ ╚██╗╚█████╔╝██║  ██║╚█████╔╝██║ ╚██╗]],
			[[╚═╝  ╚═╝╚═╝  ╚═╝  ╚═╝   ╚═╝  ╚═╝  ╚═╝ ╚════╝ ╚═╝  ╚═╝ ╚════╝ ╚═╝  ╚═╝]],
		}
		dashboard.section.header.opts.hl = "Include"
		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("n", "  > New File", "<cmd>ene<CR>"),
			dashboard.button("p", "  > Find project", ":Telescope projects <CR>"),
			dashboard.button("r", "󰦛  > Recently used files", ":Telescope oldfiles <CR>"),
			dashboard.button("e", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
			dashboard.button("s", "  > Colorscheme", ":Telescope colorscheme <CR>"),
			dashboard.button("f", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("c", "  > Configuration", ":e ~/.config/nvim/init.lua <CR>"),
			dashboard.button("l", "󰒲  > Lazy", "<cmd>Lazy<CR>"),
			dashboard.button("t", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("sr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
			dashboard.button("q", "󰩈  > Quit NVIM", "<cmd>qa<CR>"),
		}

		dashboard.section.footer.opts.hl = "Type"

		local function stat()
			local stats = require("lazy").stats()
			local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
			return {
				"",
				"⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
			}
		end
		-- local footer = { quote(), stat() }

		dashboard.section.footer.val = stat()
		dashboard.section.footer.opts.hl = "Type"
		dashboard.section.header.opts.hl = "Include"
		dashboard.section.buttons.opts.hl = "Keyword"

		dashboard.opts.opts.noautocmd = true
		-- Send config to alpha
		alpha.setup(dashboard.opts)
	end,
}
