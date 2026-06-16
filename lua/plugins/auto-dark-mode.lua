
-- 自动切换深色模式
-- @see: https://github.com/f-person/auto-dark-mode.nvim
-- @see: https://github.com/NvChad/NvChad/issues/2721
return {
  "f-person/auto-dark-mode.nvim",
  event = "VeryLazy",
  config = function()
    require("auto-dark-mode").setup({
      update_interval = 3000,
      set_dark_mode = function()
        require("utils.theme").set_theme("onedark")
      end,
      set_light_mode = function()
        require("utils.theme").set_theme("one_light")
      end,
    })
  end,
}
