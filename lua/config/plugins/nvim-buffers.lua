return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	opts = {
		options = {
			separator_style = "slant",
		},
	},

	keys = {
		{
			"<Tab>",
			"<cmd>BufferLineCycleNext<CR>",
			desc = "Next buffer",
		},
		{
			"<S-Tab>",
			"<cmd>BufferLineCyclePrev<CR>",
			desc = "Previous buffer",
		},
	},
}
