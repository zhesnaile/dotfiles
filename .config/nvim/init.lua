-- personal functions/shortcuts {{{
local function merge_tables(t1, t2)
	t2 = t2 or {}
	for k, v in pairs(t2) do
		if type(v) == "table" then
			if type(t1[k] or false) == "table" then
				merge_tables(t1[k] or {}, t2[k] or {})
			else
				t1[k] = v
			end
		else
			t1[k] = v
		end
	end
	return t1
end

local function map(mode, shortcut, command, opts)
	vim.api.nvim_set_keymap(mode, shortcut, command, merge_tables({noremap=false, silent=true}, opts))
end

local function noremap(mode, shortcut, command, opts)
	vim.api.nvim_set_keymap(mode, shortcut, command, merge_tables({noremap=true, silent=true}, opts) )
end

local function nmap(shortcut, command, opts)
	map('n', shortcut, command, opts)
end

local function nnoremap(shortcut, command, opts)
	noremap('n', shortcut, command, opts)
end

local function inoremap(shortcut, command, opts)
	noremap('i', shortcut, command, opts)
end
-- }}}
-- Plugin Config {{{

-- Bootstrap packer and install plugins.
-- Requires you to run ":PackerSync" to actually install them.
require('plugins')

-- Self explanatory, LSP Config using nvim-lsp-installer
require('lsp_settings')

-- LUALINE
require('lualine').setup()

-- FZF BINDINGS {{{
	-- Show fzf Files when ; is pressed
	nnoremap(';', ':Files<cr>')
	-- show all open windows/buffers with fzf
	nnoremap('<space>w', ':W<cr>')

	-- use '¡' to open :GFiles if in a git project, otherwise fallback to :Files
	local function not_a_bang()
		vim.cmd([[silent! !git rev-parse --is-inside-work-tree]])
		local result = (vim.v.shell_error == 0 and ':GFiles --cached --others --exclude-standard<cr>') or ':Files<cr>'
		return result
	end
	nnoremap('¡', not_a_bang() )

	-- Double space to get a list of Buffers.
	nnoremap('<space><space>', ':Buffers<cr>')

-- }}}

-- -- AIRLINE THEME {{{
-- 	vim.g['airline_powerlinefonts']=1
-- 	vim.g['airline#extensions#tabline#enabled']=1
-- 	vim.g['airline_theme']='alduin'
-- --}}}

--}}} END OF PLUGIN RELATED SETTINGS
-- "vanilla" vim bindings {{{
	-- Windows {{{
	-- TODO: Find a workaround to avoid a global function.
	function win_move(key)
	  local curr_win = vim.api.nvim_get_current_win()
	  vim.api.nvim_command("wincmd " .. key)
	  if curr_win == vim.api.nvim_get_current_win() then
	    if key == 'j' or key == 'k' then
	      vim.api.nvim_command("wincmd s")
	    else
	      vim.api.nvim_command("wincmd v")
	    end
	  vim.api.nvim_command("wincmd "..key)
	  end
	end

	nnoremap('<C-h>', ':lua win_move(\'h\')<cr>')
	nnoremap('<C-j>', ':lua win_move(\'j\')<cr>')
	nnoremap('<C-k>', ':lua win_move(\'k\')<cr>')
	nnoremap('<C-l>', ':lua win_move(\'l\')<cr>')
	-- }}}

	-- Tabs and Bindings {{{
	nnoremap('<space>t', ':tabnew<cr>')
	nnoremap('H', ':tabprevious<cr>')
	nnoremap('L', ':tabnext<cr>')
	-- }}}

	-- Remap ç to act like a colon (for that single keytap goodness)
	nnoremap('ç', ':')

	-- Remap ´ to save
	nnoremap('´', ':w<cr>')

	-- Center the cursor vertically when moving between search results:
	nnoremap('n', 'nzz')
	nnoremap('N', 'Nzz')

	-- double tap ñ to exit insert mode
	inoremap('ññ', '<esc>')

--}}}

-- Vars {{{
	-- Theme {{{
	vim.o.termguicolors = true
	vim.g.syntax = true
	vim.cmd('colorscheme dracula')
	vim.g.colorcolumn=81
	-- }}}
	vim.o.expandtab = true
	vim.o.shiftround = true
	--vim.o.smartindent = true
	--vim.o.autoindent = true

	--vim.o.softtabstop = 8
	vim.o.tabstop = 4
	vim.o.shiftwidth = 4

	vim.o.foldmethod = 'syntax'
	vim.o.fdm = 'marker'
	vim.o.modelines = 0
-- }}}
