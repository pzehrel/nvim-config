
-- 多光标编辑插件
-- @see: https://github.com/jake-stewart/multicursor.nvim
return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  event = "VeryLazy",
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    local set = vim.keymap.set

    -- 在光标上方/下方添加光标
    set({ "n", "x" }, "<up>", function()
      mc.lineAddCursor(-1)
    end)
    set({ "n", "x" }, "<down>", function()
      mc.lineAddCursor(1)
    end)
    set({ "n", "x" }, "<leader><up>", function()
      mc.lineSkipCursor(-1)
    end)
    set({ "n", "x" }, "<leader><down>", function()
      mc.lineSkipCursor(1)
    end)

    -- 通过匹配单词/选区添加或跳过光标
    set({ "n", "x" }, "<leader>n", function()
      mc.matchAddCursor(1)
    end)
    set({ "n", "x" }, "<leader>s", function()
      mc.matchSkipCursor(1)
    end)
    set({ "n", "x" }, "<leader>N", function()
      mc.matchAddCursor(-1)
    end)
    set({ "n", "x" }, "<leader>S", function()
      mc.matchSkipCursor(-1)
    end)

    -- Ctrl + 左键点击添加/移除光标
    set("n", "<c-leftmouse>", mc.handleMouse)
    set("n", "<c-leftdrag>", mc.handleMouseDrag)
    set("n", "<c-leftrelease>", mc.handleMouseRelease)

    -- 禁用/启用光标
    set({ "n", "x" }, "<c-q>", mc.toggleCursor)

    -- 仅在有多个光标时生效的按键映射层
    mc.addKeymapLayer(function(layerSet)
      -- 切换主光标
      layerSet({ "n", "x" }, "<left>", mc.prevCursor)
      layerSet({ "n", "x" }, "<right>", mc.nextCursor)

      -- 删除主光标
      layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

      -- ESC 启用或清除光标
      layerSet("n", "<esc>", function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        else
          mc.clearCursors()
        end
      end)
    end)

    -- 自定义光标外观
    local hl = vim.api.nvim_set_hl
    hl(0, "MultiCursorCursor", { reverse = true })
    hl(0, "MultiCursorVisual", { link = "Visual" })
    hl(0, "MultiCursorSign", { link = "SignColumn" })
    hl(0, "MultiCursorMatchPreview", { link = "Search" })
    hl(0, "MultiCursorDisabledCursor", { reverse = true })
    hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
    hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
  end,
}
