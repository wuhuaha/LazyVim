-- 调用图 / 调用树探索。
--
-- 默认只启用 Neovim LSP 的 incoming_calls/outgoing_calls 键位，稳定且无额外依赖。
-- 如果你确实需要接近 Source Insight 的树形调用关系，可以把下面插件的 enabled 改成 true。
-- 注意：这类插件依赖 LSP call hierarchy，Go/Python/C++ 的支持程度取决于 gopls/pyright/clangd。

return {
  {
    "ldelossa/litee.nvim",
    enabled = false,
    event = "VeryLazy",
    opts = {
      notify = { enabled = false },
      panel = {
        orientation = "right",
        panel_size = 40,
      },
    },
    config = function(_, opts)
      require("litee.lib").setup(opts)
    end,
  },
  {
    "ldelossa/litee-calltree.nvim",
    enabled = false,
    dependencies = "ldelossa/litee.nvim",
    event = "VeryLazy",
    opts = {
      on_open = "panel",
      map_resize_keys = false,
    },
    config = function(_, opts)
      require("litee.calltree").setup(opts)
    end,
  },
}
