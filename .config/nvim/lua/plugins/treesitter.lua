return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
          "javascript",
          "typescript",
          "svelte",
          "html",
          "css",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "rust"
        },
        auto_install = true,
        highlight = { enable = true },
        ident = { enable = true },
      })
      require("nvim-treesitter.configs").setup({
        context_commentstring = {
          enable = true,
          enable_autocmd = true,
        },
      })
    end,
  },
}
