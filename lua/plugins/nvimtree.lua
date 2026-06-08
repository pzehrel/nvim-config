-- NvimTree 配置：启用基于 nvim-web-devicons 的文件夹图标
-- 让 src、components 等常见文件夹显示类似 VSCode 的特定图标
-- @see: https://github.com/nvim-tree/nvim-tree.lua
return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    renderer = {
      add_trailing = true,
      icons = {
        web_devicons = {
          folder = {
            enable = true,
          },
        },
      },
    },
  },
}

