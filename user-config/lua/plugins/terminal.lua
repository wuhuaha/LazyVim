-- 终端体验优化。
--
-- 开源配置里的常见做法是：
-- - 左/右侧放目录树、大纲、诊断
-- - 底部放终端、任务输出、测试输出
--
-- 终端天然更需要“宽度”而不是“高度”，所以这里把终端固定到底部。
-- 同时给 Windows 下的内嵌 shell 使用更干净的 pwsh 启动参数，
-- 避免 profile 提示、花哨 prompt 和图标导致的输出错位。

return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.terminal = opts.terminal or {}
      opts.terminal.win = vim.tbl_deep_extend("force", opts.terminal.win or {}, {
        position = "bottom",
        height = 0.28,
        bo = {
          filetype = "snacks_terminal",
        },
        wo = {
          number = false,
          relativenumber = false,
          signcolumn = "no",
          statuscolumn = "",
          wrap = false,
        },
      })

      if vim.fn.has("win32") == 1 and vim.fn.executable("pwsh") == 1 then
        opts.terminal.shell = { "pwsh", "-NoLogo", "-NoProfile" }
      end
    end,
  },
}
