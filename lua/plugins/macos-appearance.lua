-- 自动跟随 macOS 系统外观切换亮/暗主题
-- @see: https://github.com/pzehrel/macos-appearance.nvim
return {
  "pzehrel/macos-appearance.nvim",
  event = "UIEnter",
  config = function()
    require("macos-appearance").setup {
      callback = require("macos-appearance.adapters.nvchad"),
    }
  end,
}
