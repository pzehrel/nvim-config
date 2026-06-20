require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!


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

-- 续行开头显示箭头指示符
vim.o.showbreak = "↳ "


