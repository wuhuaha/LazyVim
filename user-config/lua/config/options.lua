-- 个人编辑习惯。
--
-- LazyVim 已经设置了大量合理默认值，这里只放你明确会关心、后续常改的项。

local opt = vim.opt

-- 中文显示和剪贴板。
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.clipboard = "unnamedplus"

-- 缩进：Go 文件由 gofmt 接管，Python/C++ 仍然遵循项目格式化器。
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2

-- 搜索：默认忽略大小写，输入大写时自动转为大小写敏感。
opt.ignorecase = true
opt.smartcase = true

-- 视图：适合长时间读代码。
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.wrap = false
opt.scrolloff = 5
opt.sidescrolloff = 8

-- 文件：离开 buffer 或执行外部命令前自动保存，减少 Codex/终端工具读到旧内容。
opt.autowrite = true
opt.confirm = true
opt.undofile = true

-- Windows 下建议优先使用 pwsh，并显式设置 UTF-8 输出。
-- 如果你主要用 Git Bash/WSL，可以删掉这段。
if vim.fn.has("win32") == 1 then
  if vim.fn.executable("pwsh") == 1 then
    opt.shell = "pwsh"
  elseif vim.fn.executable("powershell") == 1 then
    opt.shell = "powershell"
  end
  opt.shellcmdflag =
    "-NoProfile -NoLogo -NonInteractive -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';$PSStyle.OutputRendering='plaintext';"
  opt.shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
  opt.shellpipe = '2>&1 | %%{ "$_" } | Tee-Object %s; exit $LastExitCode'
  opt.shellquote = ""
  opt.shellxquote = ""
end
