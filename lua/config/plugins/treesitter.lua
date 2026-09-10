vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site")
return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",

		config = function()
			require("nvim-treesitter").setup()

			require("nvim-treesitter").install({
				"c",
				"cpp",
				"python",
				"lua",
				"javascript",
				"typescript",
				"json",
				"bash",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
			})

			-- Tree-sitter syntax highlighting
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"c",
					"cpp",
					"python",
					"lua",
					"javascript",
					"typescript",
					"json",
					"bash",
					"vim",
					"markdown",
				},
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
}
