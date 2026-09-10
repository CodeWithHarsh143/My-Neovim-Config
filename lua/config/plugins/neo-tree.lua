return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		cmd = "Neotree",
		keys = {
			{ "<space>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-tree" },
			{ "<space>ge", "<cmd>Neotree float git_status<cr>", desc = "Git Status (float)" },
			{ "<space>be", "<cmd>Neotree toggle buffers<cr>", desc = "Toggle Buffers" },
		},
		init = function()
			-- disable netrw at the very start, neo-tree replaces it
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
		end,
		opts = {
			close_if_last_window = true,
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,
			sort_case_insensitive = false,

			default_component_configs = {
				indent = {
					indent_size = 2,
					padding = 1,
					with_markers = true,
					with_expanders = true,
				},
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "󰉖",
					default = "",
				},
				modified = {
					symbol = "[+]",
				},
				git_status = {
					symbols = {
						added = "",
						modified = "",
						deleted = "✖",
						renamed = "󰁕",
						untracked = "",
						ignored = "",
						unstaged = "󰄱",
						staged = "",
						conflict = "",
					},
				},
			},

			window = {
				position = "left",
				width = 30,
				mappings = {
					["<space>"] = "none",
					["<cr>"]    = "open",
					["o"]       = "open",
					["<tab>"]   = "toggle_node",
					["s"]       = "open_split",
					["v"]       = "open_vsplit",
					["t"]       = "open_tabnew",
					["w"]       = "open_with_window_picker",
					["C"]       = "close_node",
					["z"]       = "close_all_nodes",
					["a"]       = { "add", config = { show_path = "none" } },
					["A"]       = "add_directory",
					["d"]       = "delete",
					["r"]       = "rename",
					["y"]       = "copy_to_clipboard",
					["x"]       = "cut_to_clipboard",
					["p"]       = "paste_from_clipboard",
					["c"]       = "copy",
					["m"]       = "move",
					["R"]       = "refresh",
					["?"]       = "show_help",
					["<"]       = "prev_source",
					[">"]       = "next_source",
					["i"]       = "show_file_details",
				},
			},

			filesystem = {
				filtered_items = {
					visible = false,
					hide_dotfiles = false,
					hide_gitignored = true,
					hide_by_name = {
						"node_modules",
						".git",
					},
					never_show = {
						".DS_Store",
						"thumbs.db",
					},
				},
				follow_current_file = {
					enabled = true,
				},
				use_libuv_file_watcher = true,
				hijack_netrw_behavior = "open_default",
			},

			buffers = {
				follow_current_file = {
					enabled = true,
				},
			},

			git_status = {
				window = {
					position = "float",
				},
			},
		},
	},
}
