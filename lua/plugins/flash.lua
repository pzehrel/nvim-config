
-- 快速跳转插件
-- @see: https://github.com/folke/flash.nvim
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  config = function()
    require("flash").setup({
      modes = {
        char = {
          enabled = false,
        },
      },
    })

    -- 自定义 flash 高亮，浅色 pastel 背景区分层级
    local hl = vim.api.nvim_set_hl
    -- 非匹配区域：变暗
    hl(0, "FlashBackdrop", { fg = "#565f89" })
    -- 所有匹配项：浅蓝背景
    hl(0, "FlashMatch", { bg = "#283457", fg = "#a9b1d6" })
    -- 当前光标所在匹配：浅黄背景
    hl(0, "FlashCurrent", { bg = "#4a4228", fg = "#e0af68", bold = true })
    -- 跳转标签：浅红背景，最醒目
    hl(0, "FlashLabel", { bg = "#4a2835", fg = "#f7768e", bold = true })

    local map = vim.keymap.set

    map({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
    map({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
    map("o", "r", function() require("flash").remote() end, { desc = "Remote Flash" })
    map({ "o", "x" }, "R", function() require("flash").treesitter_search() end, { desc = "Treesitter Search" })
    map("c", "<c-s>", function() require("flash").toggle() end, { desc = "Toggle Flash Search" })
  end,
}
