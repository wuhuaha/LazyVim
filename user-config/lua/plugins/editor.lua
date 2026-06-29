-- 编辑增强。

return {
  -- 对齐工具。比老 Vim 里的 Tabular / easy-align 更轻，且和 LazyVim 现有 mini.nvim 生态一致。
  {
    "nvim-mini/mini.align",
    event = "VeryLazy",
    keys = {
      {
        "ga",
        function()
          require("mini.align").align()
        end,
        mode = { "x" },
        desc = "按分隔符对齐",
      },
      {
        "gA",
        function()
          require("mini.align").align()
        end,
        mode = { "n" },
        desc = "交互式对齐",
      },
    },
    opts = {},
  },

  -- Aerial 是代码大纲，不是完整调用图；适合日常替代 Source Insight 的符号列表。
  {
    "stevearc/aerial.nvim",
    opts = {
      layout = {
        default_direction = "right",
        width = 36,
      },
    },
  },
}
