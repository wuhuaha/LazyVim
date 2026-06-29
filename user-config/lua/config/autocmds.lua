-- 自动命令。
--
-- 这里只放少量跨语言习惯。语言专属格式化优先交给 LazyVim extras。

local group = vim.api.nvim_create_augroup("UserConfig", { clear = true })

-- 进入终端自动切到插入模式，方便在 LazyVim 里直接用 codex/lazygit/shell。
vim.api.nvim_create_autocmd("TermOpen", {
  group = group,
  callback = function()
    vim.cmd.startinsert()
  end,
})

-- Markdown/文档类文件可以换行，代码文件不自动折行。
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "markdown", "text", "gitcommit" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = false
  end,
})
