return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      -- completion capabilities for every server (nvim 0.11+ API)
      local caps = vim.tbl_deep_extend(
        "force",
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities()
      )
      vim.lsp.config("*", { capabilities = caps })

      require("mason").setup()
      require("mason-lspconfig").setup({
        -- Unity C# (omnisharp) deliberately omitted: use Rider for that
        ensure_installed = { "lua_ls", "pyright", "ruff", "bashls" },
        automatic_enable = true,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("gray-lsp-attach", {}),
        callback = function(e)
          local o = { buffer = e.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, o)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, o)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, o)
          vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, o)
          vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, o)
          vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, o)
          vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = 1 }) end, o)
          vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = -1 }) end, o)
          vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, o)
        end,
      })

      vim.diagnostic.config({ virtual_text = true, float = { border = "rounded" } })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()
      cmp.setup({
        snippet = { expand = function(a) require("luasnip").lsp_expand(a.body) end },
        mapping = cmp.mapping.preset.insert({
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
        }),
        formatting = {
          format = function(entry, item)
            item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip  = "[Snip]",
              buffer   = "[Buf]",
              path     = "[Path]",
            })[entry.source.name]
            return item
          end,
        },
        sources = cmp.config.sources(
          { { name = "nvim_lsp" }, { name = "luasnip" } },
          { { name = "buffer" }, { name = "path" } }
        ),
      })
    end,
  },
}
