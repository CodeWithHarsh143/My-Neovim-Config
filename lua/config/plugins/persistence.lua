return {
	"folke/persistence.nvim",

	event = "BufReadPre",

	opts = {
		dir = vim.fn.stdpath("state") .. "/sessions/",

		options = {
			"buffers",
			"curdir",
			"tabpages",
			"winsize",
		},
	},

	keys = {
		{
			"<leader>qs",
			function()
				require("persistence").load()
			end,
			desc = "Restore session",
		},

		{
			"<leader>ql",
			function()
				require("persistence").load({ last = true })
			end,
			desc = "Restore last session",
		},

		{
			"<leader>qd",
			function()
				require("persistence").stop()
			end,
			desc = "Stop session persistence",
		},
	},
}
