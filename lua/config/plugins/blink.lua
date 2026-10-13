return {
	"saghen/blink.cmp",

	dependencies = {
		"rafamadriz/friendly-snippets",
	},

	version = "1.*",

	opts = {
		keymap = {
			preset = "default",

			["<Tab>"] = {
				function(cmp)
					if cmp.snippet_active() then
						return cmp.accept()
					end

					if cmp.is_visible() then
						return cmp.select_and_accept()
					end

					return false
				end,

				"snippet_forward",
				"fallback",
			},

			["<S-Tab>"] = {
				function(cmp)
					if cmp.is_visible() then
						return cmp.select_prev()
					end

					return false
				end,

				"snippet_backward",
				"fallback",
			},

			["<CR>"] = {
				"accept",
				"fallback",
			},

			["<C-Space>"] = {
				"show",
				"show_documentation",
				"hide_documentation",
			},

			["<C-e>"] = {
				"hide",
				"fallback",
			},
		},

		completion = {
			documentation = {
				auto_show = false,
			},

			menu = {
				auto_show = true,
			},

			list = {
				selection = {
					preselect = true,
					auto_insert = false,
				},
			},

			ghost_text = {
				enabled = false,
			},
		},
		signature = {
			enabled = false,

			window = {
				show_documentation = true,
			},
		},

		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
				"buffer",
			},
		},
	},
}
