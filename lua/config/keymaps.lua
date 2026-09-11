-- ============================================================================
--  KEYMAPS | Saare keymaps ek hi jagah, category ke hisaab se organised
-- ============================================================================
--  Ye file `init.lua` me `require("options")` ke baad load hoti hai.
--  Har keymap ke saath comment hai ki wo kya karta hai.

local keymap = vim.keymap.set

-- ============================================================================
--  ARROW KEYS BAND (disable)
-- ============================================================================

-- Up/Down/Left/Right ko normal, insert aur visual mode me band karta hai,
-- taaki movement ke liye h/j/k/l hi use karein.
for _, mode in ipairs({ "n", "i", "v" }) do
	keymap(mode, "<Up>", "<Nop>")
	keymap(mode, "<Down>", "<Nop>")
	keymap(mode, "<Left>", "<Nop>")
	keymap(mode, "<Right>", "<Nop>")
end

-- ============================================================================
--  GENERAL / EDITOR
-- ============================================================================

-- Poore file ko source/execute karta hai (vimscript ya config file refresh)
keymap("n", "<Space><Space>x", "<cmd>% source <CR>")
-- Current line ko Lua code ki tarah execute karta hai
keymap("n", "<Space>x", "<cmd>.lua<CR>")
-- Search ke baad ka highlight hata deta hai
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- Current buffer (file) ko delete/band kar deta hai
keymap("n", "<A-w>", "<cmd>bdelete<CR>")
-- Zen mode (focus mode) ko toggle karta hai
keymap("n", "<leader>z", "<cmd>ZenMode<CR>")

-- ============================================================================
--  LINE / SELECTION MOVE (up / down)
-- ============================================================================

-- Normal mode: current line ko ek line upar shift kar deta hai
keymap("n", "<A-k>", ":m .-2<CR>==")
-- Normal mode: current line ko ek line neeche shift kar deta hai
keymap("n", "<A-j>", ":m .+1<CR>==")
-- Visual mode: selected lines ko upar shift kar deta hai
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv")
-- Visual mode: selected lines ko neeche shift kar deta hai
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv")

-- ============================================================================
--  WINDOW NAVIGATION (Splits)
-- ============================================================================

-- Ctrl + h/j/k/l: cursor ko left/down/up/right window me move karta hai
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Alt + Arrow keys: active window ka size resize karta hai
keymap("n", "<A-Up>", "<cmd>resize +2<CR>") -- height badhata hai
keymap("n", "<A-Down>", "<cmd>resize -2<CR>") -- height ghatata hai
keymap("n", "<A-Left>", "<cmd>vertical resize -2<CR>") -- width ghatata hai
keymap("n", "<A-Right>", "<cmd>vertical resize +2<CR>") -- width badhata hai

-- Space + sv: vertical split (left/right) kholta hai
keymap("n", "<leader>sv", "<C-w>v")
-- Space + sh: horizontal split (upar/neeche) kholta hai
keymap("n", "<leader>sh", "<C-w>s")
-- Space + sx: current window ko band kar deta hai
keymap("n", "<leader>sx", "<cmd>close<CR>")
-- Space + se: saare windows ko equal size me set kar deta hai
keymap("n", "<leader>se", "<C-w>=")
-- Space + so: baaki saari windows band karke current window ko bada deta hai
keymap("n", "<leader>so", "<C-w>o")

-- Space + w{h,j,k,l}: current window ko left/down/up/right position pe swap karta hai
keymap("n", "<leader>wh", "<C-w>H")
keymap("n", "<leader>wj", "<C-w>J")
keymap("n", "<leader>wk", "<C-w>K")
keymap("n", "<leader>wl", "<C-w>L")

-- ============================================================================
--  TERMINAL
-- ============================================================================

-- Alt + c: terminal mode se nikal kar normal mode me aana (exit)
keymap("t", "<A-c>", "<C-\\><C-n>")
-- Space + tt (normal mode): floating terminal ko open/close (toggle)
keymap("n", "<Space>tt", "<cmd>Floaterminal<CR>")
-- Space + tt (terminal mode): terminal se bahar aake floating terminal toggle
keymap("t", "<Space>tt", "<C-\\><C-n><cmd>Floaterminal<CR>")

-- ============================================================================
--  TELESCOPE / SEARCH (Find)
-- ============================================================================

-- Space + fh: vim ke help tags search karta hai
keymap("n", "<space>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help Tags" })
-- Space + ff: files find karta hai
keymap("n", "<space>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
-- Space + fd: directory/file browser kholta hai
keymap("n", "<space>fd", "<cmd>Telescope file_browser select_buffer=true<CR>", { desc = "Find Directory / Browse" })
-- Space + fc: nvim ki config files find karta hai
keymap("n", "<space>fc", "<cmd>Telescope find_files cwd=" .. vim.fn.stdpath("config") .. "<CR>", { desc = "Find Nvim Config Files" })
-- Space + fp: installed plugins ke source files find karta hai
keymap("n", "<space>fp", "<cmd>Telescope find_files cwd=" .. vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") .. "<CR>", { desc = "Find Plugin Source" })
-- Space + fb: currently open buffers (files) list karta hai
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
-- Space + fg: multi line grep search (format: `pattern  glob`)
keymap("n", "<space>fg", "<cmd>Multigrep<CR>", { desc = "Multi Grep" })

-- ============================================================================
--  LSP (Language Server) | buffer-local keymaps
-- ============================================================================
--  Ye keymaps tabhi set hote hain jab kisi buffer me LSP attach hota hai.

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("keymaps-lsp", { clear = true }),
	callback = function(event)
		local opts = { buffer = event.buf }

		-- gd: variable/function ki definition par jump karta hai
		keymap("n", "gd", vim.lsp.buf.definition, opts)
		-- gD: declaration par jump karta hai
		keymap("n", "gD", vim.lsp.buf.declaration, opts)
		-- gr: symbol ke saare references dikhata hai
		keymap("n", "gr", vim.lsp.buf.references, opts)
		-- gi: symbol ke implementation par jump karta hai
		keymap("n", "gi", vim.lsp.buf.implementation, opts)
		-- K: hover karke documentation dikhata hai
		keymap("n", "K", vim.lsp.buf.hover, opts)

		-- Space + rn: symbol ka naam (variable/function) rename karta hai
		keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
		-- Space + ca: code actions (fix/refactor) offer karta hai
		keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		-- Space + d: current line ke diagnostics float window me dikhata hai
		keymap("n", "<leader>d", vim.diagnostic.open_float, opts)
		-- ]d: agle diagnostic (error/warning) par le jaata hai
		keymap("n", "]d", vim.diagnostic.goto_next, opts)
		-- [d: pichle diagnostic (error/warning) par le jaata hai
		keymap("n", "[d", vim.diagnostic.goto_prev, opts)
	end,
})

-- ============================================================================
--  NEOVIDE ZOOM (sirf Neovide GUI me)
-- ============================================================================
if vim.g.neovide then
	local function neovideScale(amount)
		local temp = vim.g.neovide_scale_factor + amount
		vim.g.neovide_scale_factor = math.max(0.5, math.min(3.0, temp))
	end

	-- Ctrl + = : zoom in (font bada karta hai)
	keymap("n", "<C-=>", function()
		neovideScale(0.1)
	end)
	-- Ctrl + - : zoom out (font chhota karta hai)
	keymap("n", "<C-->", function()
		neovideScale(-0.1)
	end)
	-- Ctrl + 0 : zoom reset (default scale par wapas)
	keymap("n", "<C-0>", function()
		vim.g.neovide_scale_factor = 1.0
	end)
end