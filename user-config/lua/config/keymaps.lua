-- 个人快捷键。
--
-- 约定：
-- - <leader> 是空格。
-- - 尽量保留 LazyVim 默认键位，只添加更符合 vimplus 习惯的别名。
-- - 不确定某个键位时，先按 <leader> 等 which-key 弹出提示。

local map = vim.keymap.set

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
map("n", "<leader>ci", vim.lsp.buf.incoming_calls, { desc = "调用我：Incoming calls" })
map("n", "<leader>co", vim.lsp.buf.outgoing_calls, { desc = "我调用：Outgoing calls" })
map("n", "<leader>cr", vim.lsp.buf.references, { desc = "查找引用" })
map("n", "<leader>cd", vim.lsp.buf.definition, { desc = "跳到定义" })

-- 大纲和符号。
map("n", "<leader>cs", "<cmd>AerialToggle<cr>", { desc = "打开/关闭代码大纲" })
map("n", "<leader>ss", function()
  Snacks.picker.lsp_symbols({ filter = LazyVim.config.kind_filter })
end, { desc = "当前文件符号" })
map("n", "<leader>sS", function()
  Snacks.picker.lsp_workspace_symbols({ filter = LazyVim.config.kind_filter })
end, { desc = "工作区符号" })

-- Codex CLI：在项目根目录打开浮动终端并运行 codex。
-- 如果你的 codex 不在 PATH 中，先在系统终端确认 `codex --version` 可用。
map("n", "<leader>ac", function()
  Snacks.terminal("codex", { cwd = LazyVim.root() })
end, { desc = "Codex CLI：项目根目录" })
map("n", "<leader>aC", function()
  Snacks.terminal("codex", { cwd = vim.uv.cwd() })
end, { desc = "Codex CLI：当前目录" })
