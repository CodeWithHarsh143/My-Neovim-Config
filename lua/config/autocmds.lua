local ACTIVE_WINDOW_DIM_FACTOR = 0.85

local function set_window_highlights()
	local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })

	if normal_hl.bg then
		local bg = normal_hl.bg
		local r = math.floor(bg / 65536)
		local g = math.floor((bg % 65536) / 256)
		local b = bg % 256

		r = math.floor(r * ACTIVE_WINDOW_DIM_FACTOR)
		g = math.floor(g * ACTIVE_WINDOW_DIM_FACTOR)
		b = math.floor(b * ACTIVE_WINDOW_DIM_FACTOR)

		local dimmed_bg = r * 65536 + g * 256 + b
		vim.api.nvim_set_hl(0, "ActiveWindow", { bg = dimmed_bg })
	else
		vim.api.nvim_set_hl(0, "ActiveWindow", { bg = "#0d0d0d" })
	end

	vim.api.nvim_set_hl(0, "InactiveWindow", { bg = normal_hl.bg })
end

-- Apply highlights on colorscheme change
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = set_window_highlights,
})

-- Set initial highlight groups
set_window_highlights()

-- Apply window highlighting on focus change
vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
	callback = function()
		vim.wo.winhl = "Normal:ActiveWindow"
	end,
})

vim.api.nvim_create_autocmd("WinLeave", {
	callback = function()
		vim.wo.winhl = "Normal:InactiveWindow"
	end,
})
