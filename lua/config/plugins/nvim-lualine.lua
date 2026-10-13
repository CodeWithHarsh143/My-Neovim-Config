return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",

		opts = {
			options = {
				theme = "auto",
				globalstatus = true,
			},

			sections = {
				lualine_a = {
					"mode",
				},

				lualine_b = {
					"branch",
				},

				lualine_c = {
					"filename",
				},

				lualine_x = {
					"diagnostics",
				},

				lualine_y = {
					{
						"progress",
						separator = "",
					},
				},

				lualine_z = {
					{
						"datetime",
						style = "%H:%M",
					},
				},
			},
		},
	},
}
