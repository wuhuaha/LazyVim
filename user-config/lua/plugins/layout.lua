-- IDE 面板布局。
--
-- 目标是尽量靠近 VS Code：
-- - 左侧固定目录树
-- - 底部固定问题 / 调用关系 / quickfix 面板
-- - 右侧固定终端和大纲

return {
  {
    "folke/edgy.nvim",
    opts = function(_, opts)
      opts.bottom = opts.bottom or {}
      opts.right = opts.right or {}
      opts.left = opts.left or {}

      table.insert(opts.bottom, {
        ft = "trouble",
        size = { height = 0.24 },
        pinned = false,
      })

      table.insert(opts.right, {
        ft = "snacks_terminal",
        title = "%{b:snacks_terminal.id}: %{b:term_title}",
        size = { width = 0.42 },
        pinned = false,
        filter = function(_buf, win)
          return vim.w[win].snacks_win
            and vim.w[win].snacks_win.position == "right"
            and vim.w[win].snacks_win.relative == "editor"
            and not vim.w[win].trouble_preview
        end,
      })
    end,
  },
}
