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
						return cmp.select_next()
					end

					return false
				end,

				"fallback",
			},

			["<S-Tab>"] = {
				function(cmp)
					if cmp.snippet_active() then
						return cmp.snippet_backward()
					end

					if cmp.is_visible() then
						return cmp.select_prev()
					end

					return false
				end,

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
