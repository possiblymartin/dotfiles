return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "find files" })
    vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "git files" })
    vim.keymap.set("n", "<leader>pws", function()
      builtin.grep_string({ search = vim.fn.expand("<cword>") })
    end, { desc = "grep word under cursor" })
    vim.keymap.set("n", "<leader>ps", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end, { desc = "grep prompt" })
    vim.keymap.set("n", "<leader>vh", builtin.help_tags, { desc = "help tags" })
  end,
}
