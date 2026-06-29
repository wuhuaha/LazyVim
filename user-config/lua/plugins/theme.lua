-- VS Code 风格主题。
--
-- 默认使用 Dark+，尽量贴近 VS Code 的常见观感，
-- 这样从 VS Code 切到 Neovim 时不会有明显的视觉落差。

return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "dark",
      transparent = false,
      italic_comments = false,
      disable_nvimtree_bg = true,
    },
    config = function(_, opts)
      require("vscode").setup(opts)
      vim.cmd.colorscheme("vscode")
    end,
  },
}
