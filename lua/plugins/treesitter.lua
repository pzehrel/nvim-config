
-- treesitter
-- @see: https://github.com/nvim-treesitter/nvim-treesitter
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "vim",
      "lua",
      "vimdoc",
      "markdown",
      "markdown_inline",
      "json",
      "yaml",
      "toml",
      "html",
      "css",
      "javascript",
      "typescript",
      "tsx",
      "vue",
      "python",
      "rust",
    },
  },
}
