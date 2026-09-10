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
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local opts = { buffer = event.buf }

					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				end,
			})
		end,
	},
}
