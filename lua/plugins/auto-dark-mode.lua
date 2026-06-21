
-- 自动切换深色模式
-- @see: https://github.com/f-person/auto-dark-mode.nvim
-- @see: https://github.com/NvChad/NvChad/issues/2721
return {
  "f-person/auto-dark-mode.nvim",
  enabled = false,
  event = "VeryLazy",
  config = function()
    local function update_toggle_icon(theme_name)
      local themes = require("nvconfig").base46.theme_toggle
      vim.g.icon_toggled = theme_name == themes[2]
      vim.g.toggle_theme_icon = vim.g.icon_toggled and "   " or "   "
    end

    local function set_theme(theme_name)
      local base46 = require("nvconfig").base46

      update_toggle_icon(theme_name)

      if base46.theme == theme_name then
        return
      end

      base46.theme = theme_name
      require("base46").load_all_highlights()
    end

    local function toggle_theme()
      local base46 = require("nvconfig").base46
      local themes = base46.theme_toggle

      if base46.theme ~= themes[1] and base46.theme ~= themes[2] then
        vim.notify "Set your current theme to one of those mentioned in the theme_toggle table (chadrc)"
        return
      end

      local next_theme = base46.theme == themes[1] and themes[2] or themes[1]
      set_theme(next_theme)
    end

    -- 右上角 Switch 只切换当前 Neovim 进程，不修改 chadrc.lua。
    require("base46").toggle_theme = toggle_theme
    update_toggle_icon(require("nvconfig").base46.theme)

    require("auto-dark-mode").setup({
      update_interval = 3000,
      set_dark_mode = function()
        set_theme("tokyodark")
      end,
      set_light_mode = function()
        set_theme("flexoki-light")
      end,
    })
  end,
}
