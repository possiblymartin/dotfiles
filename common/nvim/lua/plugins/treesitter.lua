return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",          -- `main` is the incompatible rewrite
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua", "python", "bash", "c_sharp", "vim", "vimdoc",
        "query", "markdown", "markdown_inline", "json", "yaml", "toml",
      },
      auto_install = true,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
