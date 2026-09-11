return {
	{
		"nvim-telescope/telescope.nvim",
		-- tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						theme = "ivy",
					},
					live_grep = {

						theme = "ivy",
					},
					buffers = {

						theme = "dropdown",
					},
					keymaps = {

						theme = "cursor",
					},
				},
				extensions = {
					fzf = {},
					file_browser = {
						theme = "ivy",
						hijack_netrw = true,
					},
				},
			})
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("file_browser")

			require("config.telescope.multigrep").setup()
		end,
	},
}
