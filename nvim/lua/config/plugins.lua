vim.cmd('packadd packer.nvim')

local packer = require('packer')

return packer.startup(function(use)
  -- Packer
  use 'wbthomason/packer.nvim'
   
  -- Colorscheme
  use 'folke/tokyonight.nvim'
  use 'folke/lsp-colors.nvim'
  
  -- Completions
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'williamboman/nvim-lsp-installer'

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
end)
