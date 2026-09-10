-- Core Configuration
-- ============================================================
-- Load Lazy.nvim / plugins
require("config.lazy")

-- Load general Neovim options
require("options")
for _, mode in ipairs({ "n", "i", "v" }) do
	vim.keymap.set(mode, "<Up>", "<Nop>")
	vim.keymap.set(mode, "<Down>", "<Nop>")
	vim.keymap.set(mode, "<Left>", "<Nop>")
	vim.keymap.set(mode, "<Right>", "<Nop>")
end
vim.keymap.set("n", "<Space><Space>x", "<cmd>% source <CR>")
vim.keymap.set("n", "<Space>x", "<cmd>.lua<CR>")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<A-w>", "<cmd>bdelete<CR>")
-- Move current line up/down
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("t", "<C-n>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>")
-- ============================================================
-- Clipboard
-- ============================================================

-- Use the system clipboard for yank/paste
--
-- y  -> system clipboard
-- p  -> paste from system clipboard
vim.opt.clipboard = "unnamedplus"

-- ============================================================
-- Highlight on Yank
-- ============================================================

-- Briefly highlight text after yanking it.
-- Works in normal Neovim AND Neovide.
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", {
		clear = true,
	}),
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})

-- ============================================================
-- Neovide Configuration
-- ============================================================

if vim.g.neovide then
	-- --------------------------------------------------------
	-- Font
	-- --------------------------------------------------------

	-- Font family + size
	vim.o.guifont = "Source Code Pro:h14"

	-- Extra spacing between lines
	vim.opt.linespace = 0

	-- --------------------------------------------------------
	-- Zoom Keybindings
	-- --------------------------------------------------------

	local function neovideScale(amount)
		local temp = vim.g.neovide_scale_factor + amount
		vim.g.neovide_scale_factor = math.max(0.5, math.min(3.0, temp))
	end

	vim.keymap.set("n", "<C-=>", function()
		neovideScale(0.1)
	end)
	vim.keymap.set("n", "<C-->", function()
		neovideScale(-0.1)
	end)
	vim.keymap.set("n", "<C-0>", function()
		vim.g.neovide_scale_factor = 1.0
	end)

	-- --------------------------------------------------------
	-- Window / UI Scale
	-- --------------------------------------------------------

	-- Overall Neovide scale
	vim.g.neovide_scale_factor = 1.0
	--
	-- -- Pixel rendering geometry
	-- vim.g.neovide_pixel_geometry = "RGBH"

	-- --------------------------------------------------------
	-- Window Padding
	-- --------------------------------------------------------

	-- Remove padding around the Neovim grid
	vim.g.neovide_padding_top = 0
	vim.g.neovide_padding_bottom = 0
	vim.g.neovide_padding_right = 0
	vim.g.neovide_padding_left = 0

	-- --------------------------------------------------------
	-- Window Corners
	-- --------------------------------------------------------

	-- Rounded window corners
	vim.g.neovide_corner_preference = "round"

	-- --------------------------------------------------------
	-- Window Blur
	-- --------------------------------------------------------

	-- Blur the background behind the Neovide window
	vim.g.neovide_window_blurred = true

	-- Blur amount for floating windows
	vim.g.neovide_floating_blur_amount_x = 2.0
	vim.g.neovide_floating_blur_amount_y = 2.0

	-- --------------------------------------------------------
	-- Floating Window Shadows
	-- --------------------------------------------------------

	-- Enable floating window shadows
	vim.g.neovide_floating_shadow = true

	-- Height/depth of floating window shadow
	vim.g.neovide_floating_z_height = 10

	-- Direction of the light source
	vim.g.neovide_light_angle_degrees = 45

	-- Radius of the light/shadow
	vim.g.neovide_light_radius = 5

	-- --------------------------------------------------------
	-- Window Opacity
	-- --------------------------------------------------------

	-- Opacity of the entire Neovide window
	vim.g.neovide_opacity = 1.0
	--
	-- -- Opacity of the normal Neovide window
	vim.g.neovide_normal_opacity = 1.0

	-- Show window border
	vim.g.neovide_show_border = true

	-- --------------------------------------------------------
	-- Window Animations
	-- --------------------------------------------------------

	-- Animation when the window changes position
	vim.g.neovide_position_animation_length = 0.15

	-- --------------------------------------------------------
	-- Scroll Animation
	-- --------------------------------------------------------

	-- Smooth scrolling
	vim.g.neovide_scroll_animation_length = 0.3

	-- Distance after which scrolling animation changes behavior
	vim.g.neovide_scroll_animation_far_lines = 1

	-- --------------------------------------------------------
	-- Progress Bar
	-- --------------------------------------------------------

	-- Enable progress bar
	vim.g.neovide_progress_bar_enabled = true

	-- Progress bar height
	vim.g.neovide_progress_bar_height = 5.0

	-- Progress bar animation speed
	vim.g.neovide_progress_bar_animation_speed = 200.0

	-- Delay before hiding the progress bar
	vim.g.neovide_progress_bar_hide_delay = 0.2

	-- --------------------------------------------------------
	-- Mouse
	-- --------------------------------------------------------

	-- Hide mouse cursor while typing
	vim.g.neovide_hide_mouse_when_typing = true

	-- --------------------------------------------------------
	-- Theme
	-- --------------------------------------------------------

	-- Automatically follow the system light/dark theme
	vim.g.neovide_theme = "auto"

	-- --------------------------------------------------------
	-- Performance / Idle
	-- --------------------------------------------------------

	-- Prevent Neovide from idling
	vim.g.neovide_no_idle = true

	-- --------------------------------------------------------
	-- Quit Behavior
	-- --------------------------------------------------------

	-- Ask for confirmation before quitting
	vim.g.neovide_confirm_quit = true

	-- --------------------------------------------------------
	-- Fullscreen / Window Size
	-- --------------------------------------------------------

	-- Start Neovide in fullscreen
	vim.g.neovide_fullscreen = true

	-- Remember previous window size
	vim.g.neovide_remember_window_size = true

	-- --------------------------------------------------------
	-- Cursor
	-- --------------------------------------------------------

	-- Cursor workaround/hack
	vim.g.neovide_cursor_hack = true

	-- Normal cursor animation duration
	vim.g.neovide_cursor_animation_length = 0.150

	-- Short cursor animation duration
	vim.g.neovide_cursor_short_animation_length = 0.04

	-- Cursor trail length
	vim.g.neovide_cursor_trail_size = 1.0

	-- Animate cursor in Insert mode
	vim.g.neovide_cursor_animate_in_insert_mode = true

	-- Animate cursor when using command line
	vim.g.neovide_cursor_animate_command_line = true

	-- Outline width when Neovide loses focus
	vim.g.neovide_cursor_unfocused_outline_width = 0.125
	vim.g.neovide_cursor_cell_color_fallback = true
end
