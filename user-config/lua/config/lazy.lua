-- lazy.nvim / LazyVim 启动配置。
--
-- 这个文件基本沿用 LazyVim starter 的结构，只做两类改动：
-- 1. 使用你自己的 fork 作为 LazyVim 来源，便于以后把中文文档和个人配置一起维护。
-- 2. 显式导入 Go / Python / C++ 等 extras，启动后由 lazy.nvim 和 Mason 按需安装依赖。

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- 这些全局变量要在 LazyVim 加载前设置。
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Python 默认用 pyright + ruff。后续如果想更严格，可以把 pyright 改成 basedpyright。
vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff"

require("lazy").setup({
  spec = {
    -- 使用你的 fork。正常使用时也可以改回 "LazyVim/LazyVim"。
    { "wuhuaha/LazyVim", import = "lazyvim.plugins" },

    -- 常用语言：只写配置，不把二进制依赖提交进仓库。
    -- 第一次打开对应项目时，Mason 会安装 gopls、pyright、ruff、clangd 等工具。
    { import = "lazyvim.plugins.extras.lang.go" },
    { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.lang.clangd" },

    -- 调试、测试和大纲。语言 extras 会补充各自的 adapter。
    { import = "lazyvim.plugins.extras.dap.core" },
    { import = "lazyvim.plugins.extras.test.core" },
    { import = "lazyvim.plugins.extras.editor.aerial" },

    -- 保留在最后：这里放你自己的覆盖配置。
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true,
    notify = false,
  },
  git = {
    -- 当前机器 GitHub HTTPS 不稳定，而 SSH 已验证可用。
    -- 如果你在其他机器没有配 SSH key，可以删掉这一段，lazy.nvim 会回到 HTTPS。
    url_format = "git@github.com:%s.git",
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
