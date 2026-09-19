return {
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "undotree" })
    end,
  },
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "git status" })
    end,
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      vim.keymap.set("n", "<leader>zz", function() require("zen-mode").toggle() end, { desc = "zen mode" })
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      { "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", desc = "diagnostics" },
    },
  },
  { "laytan/cloak.nvim", opts = {} },
  { "ThePrimeagen/vim-be-good", cmd = "VimBeGood" },
}
