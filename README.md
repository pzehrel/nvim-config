# Neovim 快捷键速查表

这份配置基于 NvChad，入口文件会先加载 `nvchad.mappings`，再加载本仓库的自定义快捷键。

`<leader>` 当前设置为空格键。

模式说明：

- Normal：普通模式
- Insert：插入模式
- Visual：可视模式
- Operator：操作符等待模式
- Command：命令行模式
- Terminal：终端模式

## 基础编辑

- 配置文件：`lua/mappings.lua`、`lua/options.lua`
- 来源：本仓库自定义映射

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal | `;` | 进入命令行模式，相当于按 `:` |
| Insert | `jk` | 退出插入模式，相当于按 `<Esc>` |
| Normal / Visual | `d` | 删除内容但不写入默认寄存器，避免覆盖粘贴内容 |
| Normal / Visual | `c` | 修改内容但不写入默认寄存器，避免覆盖粘贴内容 |
| Normal | `x` | 删除单个字符但不写入默认寄存器，避免覆盖粘贴内容 |

## 窗口

- 配置文件：`lua/mappings.lua`
- 来源：本仓库自定义映射 + NvChad 默认映射

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal | `<C-h>` | 切换到左侧窗口 |
| Normal | `<C-l>` | 切换到右侧窗口 |
| Normal | `<C-j>` | 切换到下方窗口 |
| Normal | `<C-k>` | 切换到上方窗口 |
| Normal | `<C-w>h` | 将当前窗口移动到左侧 |
| Normal | `<C-w>l` | 将当前窗口移动到右侧 |
| Normal | `<C-w>j` | 将当前窗口移动到下方 |
| Normal | `<C-w>k` | 将当前窗口移动到上方 |
| Normal | `<C-w>z` | 最大化当前窗口 |

## Buffer

- 来源：[NvChad/NvChad](https://github.com/NvChad/NvChad)

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal | `<Tab>` | 切换到下一个 buffer |
| Normal | `<S-Tab>` | 切换到上一个 buffer |
| Normal | `<leader>b` | 新建 buffer |
| Normal | `<leader>x` | 关闭当前 buffer |

## 文件树 NvimTree

- 配置文件：`lua/plugins/nvimtree.lua`
- 插件仓库：[nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)

全局键位：

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal | `<C-n>` | 打开或关闭 NvimTree |
| Normal | `<leader>e` | 聚焦 NvimTree 窗口 |

NvimTree 窗口内常用键位：

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal | `g?` | 显示 NvimTree 帮助和完整键位 |
| Normal | `<CR>` / `o` / 双击 | 打开文件或目录 |
| Normal | `<C-v>` | 垂直分屏打开 |
| Normal | `<C-x>` | 水平分屏打开 |
| Normal | `<C-t>` | 新标签页打开 |
| Normal | `<Tab>` | 预览打开 |
| Normal | `a` | 新建文件或目录 |
| Normal | `r` | 重命名 |
| Normal | `e` | 只重命名 basename |
| Normal | `d` / `<Del>` | 删除 |
| Normal | `D` | 移到回收站 |
| Normal / Visual | `c` | 复制节点 |
| Normal | `x` | 剪切节点 |
| Normal | `p` | 粘贴节点 |
| Normal | `y` | 复制文件名 |
| Normal | `Y` | 复制相对路径 |
| Normal | `gy` | 复制绝对路径 |
| Normal | `H` | 显示或隐藏点文件 |
| Normal | `I` | 显示或隐藏 Git ignored 文件 |
| Normal | `f` | 开始实时过滤 |
| Normal | `F` | 清除实时过滤 |
| Normal | `R` | 刷新文件树 |
| Normal | `W` | 折叠全部目录 |
| Normal | `E` | 展开全部目录 |
| Normal | `q` | 关闭 NvimTree |

## Telescope

- 来源：[NvChad/NvChad](https://github.com/NvChad/NvChad)

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal | `<leader>ff` | 查找文件 |
| Normal | `<leader>fa` | 查找所有文件，包含隐藏和 ignored 文件 |
| Normal | `<leader>fw` | 全局文本搜索 |
| Normal | `<leader>fb` | 查找 buffer |
| Normal | `<leader>fo` | 查找最近打开文件 |
| Normal | `<leader>fz` | 当前 buffer 内模糊搜索 |
| Normal | `<leader>fh` | 查找帮助文档 |
| Normal | `<leader>ma` | 查找 marks |
| Normal | `<leader>cm` | 查找 Git commits |
| Normal | `<leader>gt` | 查看 Git status |
| Normal | `<leader>pt` | 选择隐藏终端 |

## LSP

- 配置文件：`lua/plugins/lspconfig.lua`
- 插件仓库：[neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal | `gd` | 跳转到定义 |
| Normal | `gD` | 跳转到声明 |
| Normal | `grr` | 查看引用 |
| Normal | `gri` | 跳转到实现 |
| Normal | `grt` | 跳转到类型定义 |
| Normal | `gra` | Code Action |
| Normal | `grn` | 重命名符号 |
| Normal | `gO` | 文档符号 |
| Normal | `<leader>D` | 跳转到类型定义 |
| Normal | `<leader>ra` | NvChad LSP rename |
| Normal | `<leader>wa` | 添加 workspace folder |
| Normal | `<leader>wr` | 移除 workspace folder |
| Normal | `<leader>wl` | 列出 workspace folders |
| Normal | `<leader>ds` | 将诊断放入 location list |
| Normal | `[d` / `]d` | 上一个 / 下一个诊断 |
| Normal | `[D` / `]D` | 当前 buffer 第一个 / 最后一个诊断 |
| Normal | `<C-w>d` | 显示光标下诊断 |

## 格式化 Conform

- 配置文件：`lua/plugins/conform.lua`
- 插件仓库：[stevearc/conform.nvim](https://github.com/stevearc/conform.nvim)

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal / Visual | `<leader>fm` | 格式化当前文件或选区 |

## Git Gitsigns

- 配置文件：`lua/plugins/gitsigns.lua`
- 插件仓库：[lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal | `]c` | 跳到下一个 Git hunk；diff 模式下保留 Vim 原生行为 |
| Normal | `[c` | 跳到上一个 Git hunk；diff 模式下保留 Vim 原生行为 |
| Normal | `<leader>hs` | 暂存当前 hunk |
| Normal | `<leader>hr` | 重置当前 hunk |
| Visual | `<leader>hs` | 暂存选中范围内的 hunk |
| Visual | `<leader>hr` | 重置选中范围内的 hunk |
| Normal | `<leader>hS` | 暂存整个 buffer |
| Normal | `<leader>hR` | 重置整个 buffer |
| Normal | `<leader>hp` | 弹窗预览当前 hunk |
| Normal | `<leader>hi` | 行内预览当前 hunk |
| Normal | `<leader>hb` | 显示当前行完整 blame 信息 |
| Normal | `<leader>hd` | 对当前文件执行 diff |
| Normal | `<leader>hD` | 与上一次提交版本执行 diff |
| Normal | `<leader>hQ` | 将所有 hunk 放入 quickfix 列表 |
| Normal | `<leader>hq` | 将当前文件 hunk 放入 quickfix 列表 |
| Normal | `<leader>tb` | 切换当前行 blame 显示 |
| Normal | `<leader>tw` | 切换 word diff 显示 |
| Operator / Visual | `ih` | 选择当前 hunk 文本对象 |

## Flash 快速跳转

- 配置文件：`lua/plugins/flash.lua`
- 插件仓库：[folke/flash.nvim](https://github.com/folke/flash.nvim)

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal / Visual / Operator | `s` | 启动 Flash 跳转 |
| Normal / Visual / Operator | `S` | 启动 Treesitter 结构跳转 |
| Operator | `r` | Remote Flash，在操作符等待模式下远程选择目标 |
| Visual / Operator | `R` | Treesitter Search |
| Command | `<C-s>` | 切换 Flash 搜索增强 |

## 多光标 Multicursor

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

多光标存在时额外启用：

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal / Visual | `<Left>` | 切换到上一个光标 |
| Normal / Visual | `<Right>` | 切换到下一个光标 |
| Normal / Visual | `<leader>x` | 删除当前主光标 |
| Normal | `<Esc>` | 如果光标被禁用则重新启用，否则清空所有多光标 |

## Surround 环绕编辑

- 配置文件：`lua/plugins/surround.lua`
- 插件仓库：[kylechui/nvim-surround](https://github.com/kylechui/nvim-surround)

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal | `ys{motion}{char}` | 给 motion 覆盖的文本添加环绕符号 |
| Normal | `yss{char}` | 给整行添加环绕符号 |
| Visual | `S{char}` | 给选区添加环绕符号 |
| Insert | `<C-g>s{char}` | 在光标处添加一对环绕符号 |
| Normal | `ds{char}` | 删除光标附近的环绕符号 |
| Normal | `cs{target}{replacement}` | 修改环绕符号 |

## Dropbar 面包屑

- 配置文件：`lua/plugins/dropbar.lua`
- 插件仓库：[Bekaboo/dropbar.nvim](https://github.com/Bekaboo/dropbar.nvim)

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal | `<leader>;` | 在 winbar 面包屑中选择符号 |
| Normal | `[;` | 跳到当前上下文的起始位置 |
| Normal | `];` | 选择下一个上下文 |

## Aerial 代码大纲

- 配置文件：`lua/plugins/aerial.lua`
- 插件仓库：[stevearc/aerial.nvim](https://github.com/stevearc/aerial.nvim)

全局键位：

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal | `{` | 跳到上一个 Aerial 代码符号 |
| Normal | `}` | 跳到下一个 Aerial 代码符号 |

Aerial 窗口内常用键位：

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal | `?` / `g?` | 显示帮助 |
| Normal | `<CR>` / 双击 | 跳转到符号 |
| Normal | `<C-v>` | 垂直分屏跳转 |
| Normal | `<C-s>` | 水平分屏跳转 |
| Normal | `p` | 滚动预览 |
| Normal | `<C-j>` / `<C-k>` | 下移 / 上移并滚动预览 |
| Normal | `{` / `}` | 上一个 / 下一个符号 |
| Normal | `[[` / `]]` | 上一个 / 下一个上层符号 |
| Normal | `q` | 关闭 Aerial 窗口 |
| Normal | `o` / `za` | 展开或折叠当前节点 |
| Normal | `O` / `zA` | 递归展开或折叠当前节点 |
| Normal | `zR` / `zM` | 展开全部 / 折叠全部 |

## UFO 折叠

- 配置文件：`lua/plugins/ufo.lua`
- 插件仓库：[kevinhwang91/nvim-ufo](https://github.com/kevinhwang91/nvim-ufo)

本配置没有为 UFO 单独设置快捷键；它增强的是 Neovim 原生折叠键。

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal | `za` | 切换当前折叠 |
| Normal | `zo` / `zc` | 打开 / 关闭当前折叠 |
| Normal | `zR` / `zM` | 打开全部 / 关闭全部折叠 |
| Normal | `zr` / `zm` | 增加 / 减少折叠级别 |

## Auto Session

- 配置文件：`lua/plugins/auto-session.lua`
- 插件仓库：[rmagatti/auto-session](https://github.com/rmagatti/auto-session)

本配置没有设置全局快捷键。打开 session picker 后可用：

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Picker | `<CR>` | 加载当前选中的 session |
| Picker | `<C-s>` | 切换到上一个 session |
| Picker | `<C-d>` | 删除当前选中的 session |
| Picker | `<C-y>` | 复制当前选中的 session |

常用命令：

| 命令 | 用途 |
| --- | --- |
| `:AutoSession save` | 保存当前目录 session |
| `:AutoSession restore` | 恢复当前目录 session |
| `:AutoSession search` | 打开 session picker |
| `:AutoSession toggle` | 切换自动保存 |

## Markdown 渲染

- 配置文件：`lua/plugins/render-markdown.lua`
- 插件仓库：[MeanderingProgrammer/render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)

本配置没有设置快捷键，使用命令控制：

| 命令 | 用途 |
| --- | --- |
| `:RenderMarkdown toggle` | 切换全局 Markdown 渲染 |
| `:RenderMarkdown buf_toggle` | 切换当前 buffer 渲染 |
| `:RenderMarkdown expand` | 增加 anti-conceal 范围 |
| `:RenderMarkdown contract` | 减少 anti-conceal 范围 |

## 注释

- 来源：NvChad 默认映射

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal | `<leader>/` | 切换当前行注释 |
| Visual | `<leader>/` | 切换选区注释 |
| Normal | `gcc` | 切换当前行注释 |
| Visual / Operator | `gc` | 切换注释 |

## 终端

- 来源：[NvChad/NvChad](https://github.com/NvChad/NvChad)

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal / Terminal | `<A-i>` | 切换浮动终端 |
| Normal / Terminal | `<A-h>` | 切换水平终端 |
| Normal / Terminal | `<A-v>` | 切换垂直终端 |
| Terminal | `<C-x>` | 退出终端模式 |

已禁用的 NvChad 默认终端键位：

| 模式 | 快捷键 | 原用途 |
| --- | --- | --- |
| Normal | `<leader>h` | 新建水平终端 |
| Normal | `<leader>v` | 新建垂直终端 |

## WhichKey 与 NvChad

- 来源：[NvChad/NvChad](https://github.com/NvChad/NvChad)

| 模式 | 快捷键 | 用途 |
| --- | --- | --- |
| Normal | `<leader>wK` | 显示全部 keymaps |
| Normal | `<leader>wk` | 查询指定前缀的 keymaps |
| Normal | `<leader>ch` | 打开 NvChad cheatsheet |
| Normal | `<leader>n` | 切换行号 |
| Normal | `<leader>rn` | 切换相对行号 |
| Normal | `<Esc>` | 清除搜索高亮 |
| Normal | `<C-s>` | 保存文件 |
| Normal | `<C-c>` | 复制整个文件到系统剪贴板 |

已禁用的 NvChad 默认键位：

| 模式 | 快捷键 | 原用途 |
| --- | --- | --- |
| Normal | `<leader>th` | 打开 NvChad 主题选择器 |

## 没有快捷键的插件

这些插件在本配置中提供能力或数据源，但没有设置可直接按的快捷键：

| 配置文件 | 插件 | 说明 |
| --- | --- | --- |
| `lua/plugins/treesitter.lua` | [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | 提供语法解析、高亮和其他插件的数据源 |
| `lua/plugins/schemastore.lua` | [b0o/SchemaStore.nvim](https://github.com/b0o/SchemaStore.nvim) | 为 JSON LSP 提供 Schema 数据 |
| `lua/plugins/nvim-web-devicons.lua` | [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | 提供文件和目录图标 |
| `lua/plugins/open-in-nvim.lua` | [pzehrel/open-in-nvim](https://github.com/pzehrel/open-in-nvim) | 从外部打开文件到 Neovim，本配置未设置键位 |
| `lua/plugins/init.lua` | 无新增插件 | 当前只保留注释示例 |

## 说明

- 这份 README 以“当前配置可用快捷键”为主，包含本仓库自定义键位、NvChad 默认键位，以及插件窗口内的常用默认键位。
- 如果要查看运行时最终生效的所有键位，可以在 Neovim 中执行 `:map`、`:nmap`、`:imap`，或用 `<leader>wK` 打开 WhichKey。
