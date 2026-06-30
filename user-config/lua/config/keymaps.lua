-- 个人快捷键。
--
-- 约定：
-- - <leader> 是空格。
-- - 尽量保留 LazyVim 默认键位，只添加更符合 vimplus 习惯的别名。
-- - 不确定某个键位时，先按 <leader> 等 which-key 弹出提示。

local map = vim.keymap.set
local function open_trouble_calls(mode, title)
  require("trouble").open({
    mode = mode,
    focus = false,
    pinned = true,
    follow = true,
    win = {
      type = "split",
      position = "bottom",
      size = 12,
    },
  })
  vim.notify(title, vim.log.levels.INFO, { title = "调用关系" })
end

-- 保存、退出、重载。
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "保存文件" })
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "退出全部窗口" })
map("n", "<leader>rr", "<cmd>source %<cr>", { desc = "重新加载当前 Lua/Vim 配置" })

-- 目录树。LazyVim 默认已有 <leader>e / <leader>E，这里补充更直观的别名。
map("n", "<leader>nt", "<leader>e", { remap = true, desc = "打开/关闭项目目录树" })
map("n", "<leader>nT", "<leader>E", { remap = true, desc = "打开/关闭当前目录树" })

-- 分屏和窗口移动。LazyVim 默认也支持 <C-h/j/k/l>。
map("n", "<leader>sv", "<C-w>v", { remap = true, desc = "垂直分屏" })
map("n", "<leader>sh", "<C-w>s", { remap = true, desc = "水平分屏" })
map("n", "<leader>sc", "<C-w>c", { remap = true, desc = "关闭当前分屏" })
map("n", "<leader>so", "<C-w>o", { remap = true, desc = "只保留当前分屏" })

-- Buffer 切换。
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "下一个 buffer" })
map("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "上一个 buffer" })

-- 代码跳转和调用层级。
-- gd/gr/gI/gy 是 LazyVim 默认键位；下面补充更容易记的 <leader>c*。
map("n", "<leader>ci", function()
  open_trouble_calls("lsp_incoming_calls", "底部打开 Incoming Calls")
end, { desc = "底部面板：谁在调用我" })
map("n", "<leader>co", function()
  open_trouble_calls("lsp_outgoing_calls", "底部打开 Outgoing Calls")
end, { desc = "底部面板：我调用了谁" })
map("n", "<leader>cr", vim.lsp.buf.references, { desc = "查找引用" })
map("n", "<leader>cd", vim.lsp.buf.definition, { desc = "跳到定义" })
map("n", "<leader>cp", "<cmd>Trouble diagnostics toggle focus=false win.position=bottom win.size=10<cr>", { desc = "底部面板：问题列表" })
map("n", "<leader>cq", "<cmd>Trouble qflist toggle focus=false win.position=bottom win.size=10<cr>", { desc = "底部面板：Quickfix" })

-- 大纲和符号。
map("n", "<leader>cs", "<cmd>AerialToggle<cr>", { desc = "打开/关闭代码大纲" })
map("n", "<leader>ss", function()
  Snacks.picker.lsp_symbols({ filter = LazyVim.config.kind_filter })
end, { desc = "当前文件符号" })
map("n", "<leader>sS", function()
  Snacks.picker.lsp_workspace_symbols({ filter = LazyVim.config.kind_filter })
end, { desc = "工作区符号" })

-- 终端 / Codex CLI。
map({ "n", "t" }, "<leader>tt", function()
  Snacks.terminal(nil, {
    cwd = LazyVim.root(),
    win = {
      position = "bottom",
      height = 0.28,
    },
  })
end, { desc = "底部终端：项目根目录" })
map({ "n", "t" }, "<leader>tT", function()
  Snacks.terminal(nil, {
    cwd = vim.uv.cwd(),
    win = {
      position = "bottom",
      height = 0.28,
    },
  })
end, { desc = "底部终端：当前目录" })

map("n", "<leader>ac", function()
  Snacks.terminal("codex", {
    cwd = LazyVim.root(),
    win = {
      position = "bottom",
      height = 0.30,
    },
  })
end, { desc = "底部终端：Codex CLI（项目根目录）" })
map("n", "<leader>aC", function()
  Snacks.terminal("codex", {
    cwd = vim.uv.cwd(),
    win = {
      position = "bottom",
      height = 0.30,
    },
  })
end, { desc = "底部终端：Codex CLI（当前目录）" })
