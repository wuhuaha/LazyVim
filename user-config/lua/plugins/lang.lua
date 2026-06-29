-- 语言工具补充。
--
-- LazyVim 的 Go/Python/C++ extras 已经配置了大部分能力：
-- - Go: gopls、goimports、gofumpt、delve、neotest-golang
-- - Python: pyright、ruff、debugpy、venv-selector、neotest-python
-- - C/C++: clangd、clangd_extensions、codelldb
--
-- 这里仅补充一些个人偏好的工具清单和格式化策略。

return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "gopls",
        "goimports",
        "gofumpt",
        "delve",
        "pyright",
        "ruff",
        "debugpy",
        "clangd",
        "clang-format",
        "codelldb",
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofumpt" },
        python = { "ruff_format" },
        c = { "clang_format" },
        cpp = { "clang_format" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
              },
            },
          },
        },
      },
    },
  },
}
