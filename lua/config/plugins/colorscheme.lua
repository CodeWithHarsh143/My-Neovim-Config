return {
	"ellisonleao/gruvbox.nvim",
	enabled = false,
	priority = 1000,
	config = function()
		vim.o.background = "dark"

		require("gruvbox").setup({
			terminal_colors = true,
			undercurl = true,
			underline = false,
			bold = true,
			litalic = {
				strings = true,
				comments = true,
				operators = false,
				folds = true,
			},

			contrast = "hard", -- "soft", "medium", "hard"
			palette_overrides = {},
			overrides = {},
			dim_inactive = false,
			transparent_mode = false,
		})

		vim.cmd.colorscheme("gruvbox")
	end,
}
