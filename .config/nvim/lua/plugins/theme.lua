return {
  {
    'ryanoasis/vim-devicons'
  },
  {
    "hachy/eva01.vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "eva01"
      --  vim.cmd.colorscheme "eva01-LCL"
    end,
  },
  --  {
  --  "catppuccin/nvim",
  --  lazy = false,
  --  name = "catppuccin",
  --  priority = 1000,
  --  config = function()
  --  vim.cmd.colorscheme "catppuccin"
  --  end,
  --  },
  --  {
  --  "ronwoch/hotline-vim",
  --  lazy = false,
  --  priority = 1000,
  --  config = function()
  --  vim.cmd.colorscheme "hotline"
  --  end,
  --  },
  --  {
  --  "evilwaveforms/silenthill.vim",
  --  lazy = false,
  --  priority = 1000,
  --  config = function()
  --  vim.cmd.colorscheme "silenthill"
  --  end

  --  "folke/tokyonight.nvim",
  --  lazy = false,
  --  priority = 1000,
  --  opts = function()
  --  return {
  --  style = "night",
  --  transparent = true,
  --  }
  --  end,
  --  }
}
