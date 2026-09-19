return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true,              -- let kitty's blur show through
        styles = { sidebars = "transparent", floats = "transparent" },
      })
      vim.cmd.colorscheme("tokyonight")
    end,
  },
  { "rose-pine/neovim", name = "rose-pine", lazy = true },
}
