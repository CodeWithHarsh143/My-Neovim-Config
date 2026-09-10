return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },

		opts = {
			formatters_by_ft = {
				lua = { "stylua" },

				python = { "ruff_format" },

				c = { "clang_format" },
				cpp = { "clang_format" },

				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},

		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({
						async = true,
						lsp_format = "fallback",
					})
				end,
				mode = "",
				desc = "Format file",
			},
		},
	},
}
