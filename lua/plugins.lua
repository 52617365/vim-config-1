local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

return require('packer').startup(function(use)
  -- My plugins here
  use 'wbthomason/packer.nvim'

  -- Easy language server installer etc.
  use { 'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer' } -- Collection of configurations for the built-in LSP client

  -- Telescope fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  -- Telescope extensions
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'sudormrfbin/cheatsheet.nvim'
  -- END Telescope extensions

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines

  -- cmp
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp Gods plugins


  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'

  -- for commenting
  use 'numToStr/Comment.nvim'

  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  -- Multi cursor thingy.
  use { 'mg979/vim-visual-multi', branch = 'master' }

  -- Search from vim because I'm lazy.
  use '52617365/vim-browser-search'
  -- use '52617365/telescope-browser.nvim'
  -- Colorscheme
  -- use 'ajmwagar/vim-deus'

  use 'marko-cerovac/material.nvim'
  use 'ThePrimeagen/harpoon'

  use 'github/copilot.vim'

  -- Nerd tree written in lua
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
  }

  use 'ryanoasis/vim-devicons'

  use { -- Nvim Treesitter configurations and abstraction layer
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }

  -- Debugging inside of Neovim
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'

  -- Auto pairs as the same suggest.
  use 'windwp/nvim-autopairs'

  -- Project management inside neovim with a telescope extension.
  use 'nvim-telescope/telescope-project.nvim'
  use 'asbjornhaland/telescope-send-to-harpoon.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
