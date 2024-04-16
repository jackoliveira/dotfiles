return {
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")
      local tmux = require("harpoon.tmux")
      vim.keymap.set("n", "<leader>a", mark.add_file)
      vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

      vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
      vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end)
      vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end)
      vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end)
      vim.keymap.set("n", "<leader>ht", function() tmux.gotoTerminal("{down-of}") end)
    end
  },
  {
    "winston0410/commented.nvim",
    config = function()
      require("commented").setup({
        comment_padding = " ",                                                 -- padding between starting and ending comment symbols
        keybindings = { n = "<leader>c", v = "<leader>c", nl = "<leader>cc" }, -- what key to toggle comment, nl is for mapping <leader>c$, just like dd for d
        prefer_block_comment = false,                                          -- Set it to true to automatically use block comment when multiple lines are selected
        set_keybindings = true,                                                -- whether or not keybinding is set on setup
        ex_mode_cmd = "Comment"
      })
    end,
  },
  {
    "mikesmithgh/kitty-scrollback.nvim",
    enabled = true,
    lazy = true,
    cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
    event = { "User KittyScrollbackLaunch" },
    -- version = '*', -- latest stable version, may have breaking changes if major version changed
    -- version = '^4.0.0', -- pin major version, include fixes and features that do not have breaking changes
    config = function()
      require("kitty-scrollback").setup()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function()
      vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", {})
      vim.keymap.set("n", "<leader>md", ":MarkdownPreviewStop<CR>", {})
    end
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<C-h>",  "<cmd><C-q>TmuxNavigateLeft<cr>" },
      { "<C-j>",  "<cmd><C-q>TmuxNavigateDown<cr>" },
      { "<C-k>",  "<cmd><C-q>TmuxNavigateUp<cr>" },
      { "<C-l>",  "<cmd><C-q>TmuxNavigateRight<cr>" },
      { "<C-\\>", "<cmd><C-q>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    config = function()
      require 'window-picker'.setup({
        hint = 'statusline-winbar'
      })
      local window_picker = require('window-picker')
      vim.keymap.set("n", "<leader>w", window_picker.pick_window, {})
    end
  }
}
