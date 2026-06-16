require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local del = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")


-- 窗口移动
map("n", "<C-w>j", "<C-w><S-j>", { desc = "Move to window below" })
map("n", "<C-w>k", "<C-w><S-k>", { desc = "Move to window above" })
map("n", "<C-w>h", "<C-w><S-h>", { desc = "Move to left window" })
map("n", "<C-w>l", "<C-w><S-l>", { desc = "Move to right window" })


-- 最大化窗口
map("n", "<C-w>z", "<cmd>wincmd _ | wincmd |<CR>", { desc = "Maximize window" })

-- 删除 NvChad 默认终端映射
del("n", "<leader>h")
del("n", "<leader>v")
-- 删除 NvChad 默认的 <leader>th（themes）
--
-- del("n", "<leader>th")
