# Neovim 快捷键说明

这份配置基于 NvChad，入口文件会先加载 `nvchad.mappings`，再加载本仓库的自定义快捷键。因此这里主要记录本配置新增或覆盖的键位；NvChad 默认键位仍然可用。

`<leader>` 当前设置为空格键。

## 基础操作

- 配置文件：`lua/mappings.lua`
- 相关仓库：[NvChad/NvChad](https://github.com/NvChad/NvChad)

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal | `;` | 进入命令行模式，相当于按 `:` |
| Insert | `jk` | 退出插入模式，相当于按 `<Esc>` |

## 快速跳转 Flash

- 配置文件：`lua/plugins/flash.lua`
- 插件仓库：[folke/flash.nvim](https://github.com/folke/flash.nvim)

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal / Visual / Operator-pending | `s` | 启动 Flash 跳转，在当前窗口中按标签快速跳到目标位置 |
| Normal / Visual / Operator-pending | `S` | 启动基于 Treesitter 语法节点的 Flash 跳转 |
| Operator-pending | `r` | Remote Flash，用于操作符等待模式下远程选择目标 |
| Visual / Operator-pending | `R` | Treesitter Search，用 Treesitter 结构做搜索和选择 |
| Command-line | `<C-s>` | 切换 Flash 搜索增强 |

## 多光标编辑

- 配置文件：`lua/plugins/multicursor.lua`
- 插件仓库：[jake-stewart/multicursor.nvim](https://github.com/jake-stewart/multicursor.nvim)

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal / Visual | `<Up>` | 在当前光标上一行添加一个多光标 |
| Normal / Visual | `<Down>` | 在当前光标下一行添加一个多光标 |
| Normal / Visual | `<leader><Up>` | 向上跳过一行并添加光标 |
| Normal / Visual | `<leader><Down>` | 向下跳过一行并添加光标 |
| Normal / Visual | `<leader>n` | 向后为下一个匹配的单词或选区添加光标 |
| Normal / Visual | `<leader>s` | 向后跳过下一个匹配项 |
| Normal / Visual | `<leader>N` | 向前为上一个匹配的单词或选区添加光标 |
| Normal / Visual | `<leader>S` | 向前跳过上一个匹配项 |
| Normal | `<C-LeftMouse>` | 用鼠标添加或移除光标 |
| Normal | `<C-LeftDrag>` | 拖拽处理多光标选择 |
| Normal | `<C-LeftRelease>` | 结束鼠标拖拽处理 |
| Normal / Visual | `<C-q>` | 启用或禁用当前多光标 |

多光标存在时会额外启用一层键位：

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal / Visual | `<Left>` | 切换到上一个光标 |
| Normal / Visual | `<Right>` | 切换到下一个光标 |
| Normal / Visual | `<leader>x` | 删除当前主光标 |
| Normal | `<Esc>` | 如果光标被禁用则重新启用，否则清空所有多光标 |

## Git Gitsigns

- 配置文件：`lua/plugins/gitsigns.lua`
- 插件仓库：[lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal | `]c` | 跳到下一个 Git hunk；在 diff 模式下保留 Vim 原生行为 |
| Normal | `[c` | 跳到上一个 Git hunk；在 diff 模式下保留 Vim 原生行为 |
| Normal | `<leader>hs` | 暂存当前 hunk |
| Normal | `<leader>hr` | 重置当前 hunk |
| Visual | `<leader>hs` | 暂存选中范围内的 hunk |
| Visual | `<leader>hr` | 重置选中范围内的 hunk |
| Normal | `<leader>hS` | 暂存整个缓冲区 |
| Normal | `<leader>hR` | 重置整个缓冲区 |
| Normal | `<leader>hp` | 弹窗预览当前 hunk |
| Normal | `<leader>hi` | 行内预览当前 hunk |
| Normal | `<leader>hb` | 显示当前行完整 blame 信息 |
| Normal | `<leader>hd` | 对当前文件执行 diff |
| Normal | `<leader>hD` | 与上一次提交版本执行 diff |
| Normal | `<leader>hQ` | 将所有 hunk 放入 quickfix 列表 |
| Normal | `<leader>hq` | 将当前文件 hunk 放入 quickfix 列表 |
| Normal | `<leader>tb` | 切换当前行 blame 显示 |
| Normal | `<leader>tw` | 切换 word diff 显示 |
| Operator-pending / Visual | `ih` | 选择当前 hunk 文本对象 |

## 代码结构与面包屑

- 配置文件：`lua/plugins/dropbar.lua`、`lua/plugins/aerial.lua`
- 插件仓库：[Bekaboo/dropbar.nvim](https://github.com/Bekaboo/dropbar.nvim)、[stevearc/aerial.nvim](https://github.com/stevearc/aerial.nvim)

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal | `<leader>;` | 在 winbar 面包屑中选择符号 |
| Normal | `[;` | 跳到当前上下文的起始位置 |
| Normal | `];` | 选择下一个上下文 |
| Normal | `{` | 跳到上一个 Aerial 代码符号 |
| Normal | `}` | 跳到下一个 Aerial 代码符号 |

## 说明

- 这份 README 只整理仓库中显式定义的快捷键。
- 如果要查看运行时最终生效的所有键位，可以在 Neovim 中执行 `:map`、`:nmap`、`:imap`，或使用 which-key 的提示面板查看 NvChad 默认键位。
