
-- Squirrel (鼠须管) 输入法 CLI 封装
-- 提供 Nvim 模式切换时的输入法自动切换支持

local M = {}

-- 可配置：Squirrel CLI 路径，通过 vim.g.squirrel_cli 覆盖
local SQUIRREL_CLI = vim.g.squirrel_cli or "/Library/Input Methods/Squirrel.app/Contents/MacOS/Squirrel"

-- 可配置：是否在切换 ascii/nascii 前自动激活鼠须管输入源
local AUTO_ACTIVATE = vim.g.squirrel_auto_activate
if AUTO_ACTIVATE == nil then
  AUTO_ACTIVATE = true
end

-- 可配置：鼠须管输入源 ID（多方案用户可能需要覆盖）
local SQUIRREL_INPUT_SOURCE = vim.g.squirrel_input_source or "im.rime.inputmethod.Squirrel.Hans"

-- 缓存当前输入法状态: "ascii" | "nascii" | nil
local cached_state = nil

-- Squirrel CLI 是否可用，nil 表示尚未检测
local is_available = nil

-- 错误通知节流：避免 CLI 持续失败时刷屏
local last_error_at = 0
local ERROR_THROTTLE_MS = 30 * 1000

---检测 Squirrel CLI 是否可用
---@return boolean
local function check_available()
  if is_available ~= nil then
    return is_available
  end

  is_available = vim.fn.executable(SQUIRREL_CLI) == 1
  return is_available
end

---发送一次错误通知（带节流）
---@param msg string
local function notify_error(msg)
  local now = vim.loop.now()
  if now - last_error_at < ERROR_THROTTLE_MS then
    return
  end
  last_error_at = now
  vim.notify("[Squirrel] " .. msg, vim.log.levels.ERROR)
end

---执行 Squirrel CLI 命令
---@param args string[]
---@return boolean ok
---@return string|nil output 命令输出（已 trim）
local function exec(args)
  if not check_available() then
    return false, nil
  end

  local cmd = vim.list_extend({ SQUIRREL_CLI }, args)
  local ok, result = pcall(vim.fn.system, cmd)

  if not ok then
    notify_error("调用失败: " .. tostring(result))
    return false, nil
  end

  if vim.v.shell_error ~= 0 then
    notify_error("命令退出码非零: " .. tostring(result))
    return false, nil
  end

  local output = result:gsub("%s+$", "")
  return true, output
end

---查询并刷新当前输入法状态
---@return "ascii"|"nascii"|nil
function M.get_state()
  local ok, output = exec({ "--getascii" })

  if not ok then
    return nil
  end

  if output == "ascii" or output == "nascii" then
    cached_state = output
    return output
  end

  notify_error("未知状态返回值: " .. tostring(output))
  return nil
end

---激活鼠须管输入源（在切换 ascii/nascii 前调用，避免当前不是鼠须管时命令无效）
---@param source_id? string
---@return boolean ok
function M.activate(source_id)
  if not AUTO_ACTIVATE then
    return true
  end

  source_id = source_id or SQUIRREL_INPUT_SOURCE
  local ok, output = exec({ "--select-input-source", source_id })

  -- 失败时尝试先启用再选择
  if not ok then
    exec({ "--enable-input-source", source_id })
    ok, output = exec({ "--select-input-source", source_id })
  end

  if not ok then
    notify_error("无法激活鼠须管输入源: " .. tostring(output))
  end

  return ok
end

---切换到中文输入法（nascii）
---@param force? boolean 为 true 时跳过缓存检查，强制调用 CLI
---@return boolean ok
function M.to_chinese(force)
  if not force and cached_state == "nascii" then
    return true
  end

  M.activate()
  local ok, _ = exec({ "--nascii" })
  if ok then
    cached_state = "nascii"
  end
  return ok
end

---切换到英文输入法（ascii）
---@param force? boolean 为 true 时跳过缓存检查，强制调用 CLI
---@return boolean ok
function M.to_english(force)
  if not force and cached_state == "ascii" then
    return true
  end

  M.activate()
  local ok, _ = exec({ "--ascii" })
  if ok then
    cached_state = "ascii"
  end
  return ok
end

---获取缓存状态
---@return "ascii"|"nascii"|nil
function M.get_cached_state()
  return cached_state
end

---使缓存失效，下次强制重新查询
function M.invalidate_cache()
  cached_state = nil
end

return M
