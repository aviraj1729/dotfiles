return {
	"mfussenegger/nvim-jdtls",
	dependencies = { "folke/which-key.nvim" },
	ft = java_filetypes,
	opts = function()
		local mason_registry = require("mason-registry")
		local lombok_jar = mason_registry.get_package("jdtls"):get_install_path() .. "/lombok.jar"
		return {
			-- How to find the root dir for a given filename. The default comes from
			-- lspconfig which provides a function specifically for java projects.
			root_dir = require("lspconfig.server_configurations.jdtls").default_config.root_dir,

			-- How to find the project name for a given root dir.
			project_name = function(root_dir)
				return root_dir and vim.fs.basename(root_dir)
			end,

			-- Where are the config and workspace dirs for a project?
			jdtls_config_dir = function(project_name)
				return vim.fn.stdpath("cache") .. "/jdtls/" .. project_name .. "/config"
			end,
			jdtls_workspace_dir = function(project_name)
				return vim.fn.stdpath("cache") .. "/jdtls/" .. project_name .. "/workspace"
			end,

			-- How to run jdtls. This can be overridden to a full java command-line
			-- if the Python wrapper script doesn't suffice.
			cmd = {
				vim.fn.exepath("jdtls"),
				string.format("--jvm-arg=-javaagent:%s", lombok_jar),
			},
			full_cmd = function(opts)
				local fname = vim.api.nvim_buf_get_name(0)
				local root_dir = opts.root_dir(fname)
				local project_name = opts.project_name(root_dir)
				local cmd = vim.deepcopy(opts.cmd)
				if project_name then
					vim.list_extend(cmd, {
						"-configuration",
						opts.jdtls_config_dir(project_name),
						"-data",
						opts.jdtls_workspace_dir(project_name),
					})
				end
				return cmd
			end,

			-- These depend on nvim-dap, but can additionally be disabled by setting false here.
			dap = { hotcodereplace = "auto", config_overrides = {} },
			dap_main = {},
			test = true,
			settings = {
				java = {
					inlayHints = {
						parameterNames = {
							enabled = "all",
						},
					},
				},
			},
		}
	end,
	config = function(_, opts)
		local mason_registry = require("mason-registry")
		local bundles = {} ---@type string[]

		-- Check if `nvim-dap` is installed
		local has_nvim_dap = pcall(require, "nvim-dap")
		local has_cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

		if opts.dap and has_nvim_dap and mason_registry.is_installed("java-debug-adapter") then
			local java_dbg_pkg = mason_registry.get_package("java-debug-adapter")
			local java_dbg_path = java_dbg_pkg:get_install_path()
			local jar_patterns = {
				java_dbg_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar",
			}

			if opts.test and mason_registry.is_installed("java-test") then
				local java_test_pkg = mason_registry.get_package("java-test")
				local java_test_path = java_test_pkg:get_install_path()
				vim.list_extend(jar_patterns, {
					java_test_path .. "/extension/server/*.jar",
				})
			end

			for _, jar_pattern in ipairs(jar_patterns) do
				for _, bundle in ipairs(vim.split(vim.fn.glob(jar_pattern), "\n")) do
					table.insert(bundles, bundle)
				end
			end
		end

		local function attach_jdtls()
			local fname = vim.api.nvim_buf_get_name(0)

			local config = {
				cmd = opts.full_cmd(opts),
				root_dir = opts.root_dir(fname),
				init_options = {
					bundles = bundles,
				},
				settings = opts.settings,
				capabilities = has_cmp_nvim_lsp and require("cmp_nvim_lsp").default_capabilities() or nil,
			}

			require("jdtls").start_or_attach(config)
		end

		vim.api.nvim_create_autocmd("FileType", {
			pattern = java_filetypes,
			callback = attach_jdtls,
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client and client.name == "jdtls" then
					local wk = require("which-key")
					wk.add({
						mode = "n",
						buffer = args.buf,
						["<leader>cx"] = { name = "extract" },
						["<leader>cxv"] = { require("jdtls").extract_variable_all, desc = "Extract Variable" },
						["<leader>cxc"] = { require("jdtls").extract_constant, desc = "Extract Constant" },
						["gs"] = { require("jdtls").super_implementation, desc = "Goto Super" },
						["gS"] = { require("jdtls.tests").goto_subjects, desc = "Goto Subjects" },
						["<leader>co"] = { require("jdtls").organize_imports, desc = "Organize Imports" },
					})

					if opts.dap and has_nvim_dap and mason_registry.is_installed("java-debug-adapter") then
						require("jdtls").setup_dap(opts.dap)
						require("jdtls.dap").setup_dap_main_class_configs(opts.dap_main)

						if opts.test and mason_registry.is_installed("java-test") then
							wk.add({
								mode = "n",
								buffer = args.buf,
								["<leader>t"] = { name = "test" },
								["<leader>tt"] = {
									function()
										require("jdtls.dap").test_class({
											config_overrides = opts.test.config_overrides,
										})
									end,
									desc = "Run All Test",
								},
								["<leader>tr"] = {
									function()
										require("jdtls.dap").test_nearest_method({
											config_overrides = opts.test.config_overrides,
										})
									end,
									desc = "Run Nearest Test",
								},
								["<leader>tT"] = { require("jdtls.dap").pick_test, desc = "Run Test" },
							})
						end
					end

					if opts.on_attach then
						opts.on_attach(args)
					end
				end
			end,
		})

		attach_jdtls()
	end,
}
