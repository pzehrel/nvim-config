require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- vim.g.squirrel_default_input_method = "chinese"

-- 显示行号
vim.wo.number = true
-- 相对行号
vim.wo.relativenumber = true

-- 在单词边界处断行,不会在单词中间劈开
vim.wo.linebreak = true
-- 断行后的续行保持缩进
vim.wo.breakindent = true
-- 额外缩进1格
vim.o.breakindentopt = "shift:1"

-- Squirrel (鼠须管) 自动输入法切换配置
-- 详见 lua/utils/input_method.lua
-- vim.g.squirrel_cli = "/Library/Input Methods/Squirrel.app/Contents/MacOS/Squirrel"
-- vim.g.squirrel_default_input_method = "english" -- "chinese" | "english"
-- vim.g.squirrel_insert_enter_force = false       -- 是否强制触发切换提醒
-- vim.g.squirrel_sync_on_focus = true             -- 切回窗口时是否同步输入法
-- 续行开头显示箭头指示符
vim.o.showbreak = "↳ "

-- c\d\x 指令删除的内容都不会进粘贴板
vim.keymap.set({ "n", "v" }, "d", '"_d')
-- vim.keymap.set({ "n", "v" }, "c", '"_c')
-- vim.keymap.set("n", "x", '"_x')

