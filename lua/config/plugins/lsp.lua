return {
	{
		"mason-org/mason.nvim",
		opts = {
			ensure_installed = {
				-- Formatters
				"stylua",
				"ruff",
				"clang-format",
				"prettier",
			},
		},
	},

	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"clangd",
				"lua_ls",
				"pyright",
				"ts_ls",
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Lua
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},

						diagnostics = {
							globals = { "vim" },
						},

						workspace = {
							checkThirdParty = false,
						},
					},
				},
			})

			-- Python
			vim.lsp.config("pyright", {
				settings = {
					python = {
						analysis = {
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							diagnosticMode = "workspace",
							typeCheckingMode = "standard",
						},
					},
				},
			})

			-- C / C++
			vim.lsp.config("clangd", {
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--completion-style=detailed",
				},
			})

			-- JavaScript / TypeScript
			vim.lsp.config("ts_ls", {
				init_options = {
					hostInfo = "neovim",
				},
			})

			-- Enable LSPs
			vim.lsp.enable({
				"lua_ls",
				"pyright",
				"clangd",
				"ts_ls",
			})
		end,
	},
}
