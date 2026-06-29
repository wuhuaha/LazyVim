# wuhuaha LazyVim fork

这个 fork 保留 LazyVim 本体，同时增加了一层中文说明和个人配置模板。

重点文件：

- `user-config/`：可复制到 Neovim 配置目录的实际配置模板。
- `docs/中文使用指引.md`：常用命令、目录树、分屏、跳转、对齐、语言工具。
- `docs/codex-cli-建议.md`：Codex CLI 与 Neovim 配合使用的建议。
- `docs/调用图方案.md`：Source Insight 风格调用图/调用树的可选方案。

注意：仓库根目录的 `init.lua` 属于 LazyVim 本体，它会提示不要直接使用本仓库作为 Neovim 配置。真正要复制的是 `user-config/`。
