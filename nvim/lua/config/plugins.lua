vim.cmd [[packadd packer.nvim]]

local packer = require('packer')

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'folke/tokyonight.nvim'
  use 'folke/lsp-colors.nvim'
end)
