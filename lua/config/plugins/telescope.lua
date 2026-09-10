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

			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<space>fh", builtin.help_tags, { desc = "Help Tags" })
			vim.keymap.set("n", "<space>ff", builtin.find_files, { desc = "Find Files" })

			-- find directory (via file_browser extension)
			vim.keymap.set("n", "<space>fd", function()
				require("telescope").extensions.file_browser.file_browser({
					cwd = vim.fn.getcwd(),
					select_buffer = true,
				})
			end, { desc = "Find Directory / Browse" })

			-- find config files (nvim config)
			vim.keymap.set("n", "<space>fc", function()
				builtin.find_files({
					cwd = vim.fn.stdpath("config"),
				})
			end, { desc = "Find Nvim Config Files" })

			vim.keymap.set("n", "<space>fp", function()
				builtin.find_files({
					cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
				})
			end, { desc = "Find Plugin Source" })
			vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", {
				desc = "Find buffers",
			})

			require("config.telescope.multigrep").setup()
		end,
	},
}
