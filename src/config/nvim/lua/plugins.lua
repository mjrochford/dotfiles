-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'jaredgorski/spacecamp'
  use 'tpope/vim-sensible'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'ido-nvim/ido.nvim'
  use 'sheerun/vim-polyglot'
  use 'editorconfig/editorconfig-vim'
  use 'alvan/vim-closetag'
  use 'tpope/vim-dispatch'
  use 'neovim/nvim-lspconfig'
  use 'rstacruz/vim-closer'
  use 'nvim-lua/completion-nvim'

  use {'andymass/vim-matchup', event = 'VimEnter'}
  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

end)
