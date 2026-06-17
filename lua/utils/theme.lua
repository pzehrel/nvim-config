
-- 主题切换工具：供 auto-dark-mode 等插件调用
local M = {}

---@param theme_name string 目标主题名（如 "onedark" / "one_light"）
M.set_theme = function(theme_name)
  local nvconfig = require("nvconfig")
  local old_theme = nvconfig.base46.theme

  if old_theme == theme_name then
    return
  end

  -- 持久化到 chadrc.lua
  require("nvchad.utils").replace_word('theme = "' .. old_theme, 'theme = "' .. theme_name)

  -- 更新内存中的配置
  nvconfig.base46.theme = theme_name

  -- 重新加载并应用高亮
  require("base46").load_all_highlights()
end

return M
