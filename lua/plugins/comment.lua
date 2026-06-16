-- 行注释切换
-- @see: https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-comment.md
return {
  "nvim-mini/mini.nvim",
  event = "VeryLazy",
  config = function()
    require("mini.comment").setup({
      mappings = {
        comment = "gc",
        comment_line = "gcc",
        comment_visual = "gc",
        textobject = "gc",
      },
    })

    local map = vim.keymap.set

    map("n", "<leader>/", "gcc", { remap = true, desc = "Toggle comment line" })
    map("x", "<leader>/", "gc", { remap = true, desc = "Toggle comment selection" })
  end,
}
