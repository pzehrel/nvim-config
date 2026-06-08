
return {
  "stevearc/conform.nvim",
  -- event = 'BufWritePre', -- uncomment for format on save
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },

      -- 前端
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      vue = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
    },

    -- format_on_save = {
    --   -- These options will be passed to conform.format()
    --   timeout_ms = 500,
    --   lsp_fallback = true,
    -- },
  },
}
