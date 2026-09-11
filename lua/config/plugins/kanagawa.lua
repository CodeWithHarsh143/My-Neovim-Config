return {
	"rebelot/kanagawa.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		require("kanagawa").setup({
			theme = "dragon",
			background = {
				theme = "wave",
			},
		})

		vim.cmd.colorscheme("kanagawa-wave")
	end,
}
