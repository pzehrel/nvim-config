
-- 自动输入法切换：进入 Insert 模式恢复上次 Insert 中的输入法，离开 Insert 模式切英文
-- 启动或重新获得焦点时，根据当前模式恢复输入法状态
-- 依赖 Squirrel (鼠须管) CLI，详见 docs/auto-input-methods.md

local squirrel = require "utils.squirrel"

local group = vim.api.nvim_create_augroup("SquirrelInputMethod", { clear = true })

-- 配置项 ---------------------------------------------------------------
-- 默认输入法，可选 "chinese" | "english"
local default_input_method = vim.g.squirrel_default_input_method
if default_input_method ~= "chinese" and default_input_method ~= "english" then
  default_input_method = "english"
end

-- 是否在进入 Insert 模式时强制调用 CLI（会触发 Squirrel 状态提醒音效/浮窗）
local insert_enter_force = vim.g.squirrel_insert_enter_force
if insert_enter_force == nil then
  insert_enter_force = false
end

-- 重新获得焦点时是否同步输入法（false 则完全交给 InsertEnter/InsertLeave 处理）
local sync_on_focus = vim.g.squirrel_sync_on_focus
if sync_on_focus == nil then
  sync_on_focus = true
end
-- ----------------------------------------------------------------------

-- 记录上一次离开 Insert 模式时的输入法状态："ascii" | "nascii" | nil
-- nil 表示尚未记录，此时按 default_input_method 处理
local last_insert_state = nil

-- 将用户配置转换为内部状态字符串
local function default_state()
  return default_input_method == "english" and "ascii" or "nascii"
end

-- 恢复到上一次 Insert 模式的输入法状态；未知时按 default_input_method
local function restore_insert_input_method()
  local target = last_insert_state or default_state()
  if target == "ascii" then
    squirrel.to_english(insert_enter_force)
  else
    squirrel.to_chinese(insert_enter_force)
  end
end

-- 判断指定模式是否需要中文/英文输入法
local function is_insert_like(mode)
  -- Insert 系列：i, ic, ix
  -- Replace 系列：R, Rc, Rx, Rv
  return mode:sub(1, 1) == "i" or mode:sub(1, 1) == "R"
end

-- 进入 Insert/Replace 模式时恢复上次的输入法状态
vim.api.nvim_create_autocmd("InsertEnter", {
  group = group,
  callback = restore_insert_input_method,
})

-- 离开 Insert 模式时切到英文，并记录离开前的输入法状态
vim.api.nvim_create_autocmd("InsertLeave", {
  group = group,
  callback = function()
    -- 优先使用缓存，避免多余的 CLI 调用；缓存不可靠时再查询
    local state = squirrel.get_cached_state()
    if not state then
      state = squirrel.get_state()
    end
    last_insert_state = state or default_state()

    squirrel.to_english()
  end,
})

-- 启动时切到英文（默认 Normal 模式）
vim.api.nvim_create_autocmd("VimEnter", {
  group = group,
  callback = function()
    squirrel.to_english()
  end,
})

-- 重新获得焦点时根据当前模式同步输入法
if sync_on_focus then
  vim.api.nvim_create_autocmd("FocusGained", {
    group = group,
    callback = function()
      local mode = vim.api.nvim_get_mode().mode

      -- 非 Insert-like 模式：直接切英文
      if not is_insert_like(mode) then
        squirrel.to_english()
        return
      end

      -- Insert-like 模式：查询真实状态并更新记录，但不主动切换，
      -- 避免覆盖用户在当前 Insert 会话中手动切换的输入法。
      -- 下次 InsertEnter 会基于最新的 last_insert_state 恢复。
      local real_state = squirrel.get_state()
      if real_state then
        last_insert_state = real_state
      end
    end,
  })
end
