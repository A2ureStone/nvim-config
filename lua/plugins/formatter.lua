local capabilities = vim.lsp.protocol.make_client_capabilities()

return {
  -- {
  --   "neovim/nvim-lspconfig",
  --   ---@class PluginLspOpts
  --   opts = {
  --     ---@type lspconfig.options
  --     servers = {
  --       -- pyright will be automatically installed with mason and loaded with lspconfig
  --       ruby_lsp = {},
  --     },
  --     setup = {
  --       ruby_lsp = function(server, opts) 
  --         opts = {
  --           capabilities = capabilities,
  --           on_attach = on_attach,
  --           cmd = "ruby-lsp",
  --           filetypes = { "ruby" },
  --           init_options = {
  --             formatter = "auto",
  --           },
  --           -- root_dir = root_pattern("Gemfile", ".git"),
  --           single_file_support = true,
  --         }
  --       end,
  --     }
  --   },
  -- },
  {
    "stevearc/conform.nvim",
    opts = {
      ---@type table<string, conform.FormatterUnit[]>
      formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        ruby = { "rubycop", "rubyfmt" },
        python = { "isort", "black" },
        javascript = { { "prettierd", "prettier" } },
        go = { "goimports", "gofumpt" },
        sh = { "shfmt" },
      },
      -- The options you set here will be merged with the builtin formatters.
      -- You can also define any custom formatters here.
      ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
      formatters = {
        injected = { options = { ignore_errors = true } },
        -- # Example of using dprint only when a dprint.json file is present
        -- dprint = {
        --   condition = function(ctx)
        --     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
        --   end,
        -- },
        --
        -- # Example of using shfmt with extra args
        -- shfmt = {
        --   prepend_args = { "-i", "2", "-ci" },
        -- },
      },
    }
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        c = { "cpplint" },
        cpp = { "cpplint" },
        ruby = { "rubocop" },
        python = { "pylint" },
      }
    }
  }
}
