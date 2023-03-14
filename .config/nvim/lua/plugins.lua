local fn = vim.fn

local packer_install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(packer_install_path)) > 0 then
  vim.api.nvim_echo({{'Installing packer.nvim', 'Type'}}, true, {})
  fn.system({'git', 'clone', '--depth', '1',
  		'https://github.com/wbthomason/packer.nvim',
		packer_install_path})
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- VimSleuth: Detect and follow a file's already existing indentation.
    use 'tpope/vim-sleuth'
    -- EditorConfig: Consistent config across various IDE
    -- (https://editorconfig.org).
    use 'editorconfig/editorconfig-vim'
    -- Fzf: fuzzy search
    use {'junegunn/fzf', run = function() vim.fn["fzf#install"]() end}
    use 'junegunn/fzf.vim'
    -- Auto Pairs: Insert or delete brackets, parens, quotes in pair.
    use 'jiangmiao/auto-pairs'
    -- Lualine
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' } }
    -- LSPConfig presets
    use 'neovim/nvim-lspconfig'
    -- easy installer for LSPs
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }
    --nvim-cmp: autocompletion
    use {'hrsh7th/nvim-cmp', requires = {
	    'hrsh7th/cmp-nvim-lsp',
	    'hrsh7th/cmp-buffer',
	    'hrsh7th/cmp-path',
	    'hrsh7th/cmp-cmdline',
	    'L3MON4D3/LuaSnip',
	    'saadparwaiz1/cmp_luasnip'
	},
    }
    -- Vim_Go: Golang goodies.
    -- Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    -- Dracula_Theme: sweet smexy colours
    use {'dracula/vim', as ='dracula' }
    use {'wbthomason/packer.nvim', opt=true}
end)
