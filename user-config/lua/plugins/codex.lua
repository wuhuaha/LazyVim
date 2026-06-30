-- Codex CLI 集成。
--
-- 这里只做“从 Neovim 里打开 Codex”的轻量集成，不把 Codex 的配置写进 Neovim。
-- Codex 的长期规则应放在仓库 AGENTS.md 或 ~/.codex/config.toml 中。

return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>ac",
        function()
          Snacks.terminal("codex", {
            cwd = LazyVim.root(),
            win = {
              position = "bottom",
              height = 0.30,
            },
          })
        end,
        desc = "底部终端：Codex CLI（项目根目录）",
      },
      {
        "<leader>aC",
        function()
          Snacks.terminal("codex", {
            cwd = vim.uv.cwd(),
            win = {
              position = "bottom",
              height = 0.30,
            },
          })
        end,
        desc = "底部终端：Codex CLI（当前目录）",
      },
    },
  },
}
