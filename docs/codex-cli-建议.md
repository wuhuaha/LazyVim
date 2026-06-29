# Codex CLI 使用建议

这份建议面向“重度使用 Codex 命令行编程”的 Neovim 工作流。

## Neovim 里怎么打开 Codex

配置里加了两个快捷键：

| 操作 | 快捷键 |
| --- | --- |
| 在项目根目录打开 Codex | `<leader>ac` |
| 在当前目录打开 Codex | `<leader>aC` |

它们只是打开浮动终端并执行 `codex`。如果失败，先在系统终端确认：

```sh
codex --version
```

## Codex 规则应该放在哪里

根据 Codex 官方手册，长期规则建议分层管理：

| 场景 | 推荐位置 |
| --- | --- |
| 个人默认习惯 | `~/.codex/AGENTS.md` 或 `~/.codex/config.toml` |
| 某个仓库的构建、测试、代码风格 | 仓库根目录 `AGENTS.md` |
| 子目录特殊规则 | 子目录里的 `AGENTS.md` |
| 仓库级 Codex 配置 | `.codex/config.toml` |
| 一次性要求 | 当前 prompt |

官方手册也建议 `AGENTS.md` 保持短而准：目录结构、运行命令、代码风格、测试方式、什么算完成。不要把大量泛泛而谈的原则塞进去。

## 建议的仓库 AGENTS.md 模板

可以在项目根目录放：

```markdown
# AGENTS.md

## 项目结构

- `cmd/`：命令入口
- `pkg/`：可复用库
- `internal/`：项目内部包
- `tests/`：测试和 fixtures

## 常用命令

- 格式化：`go fmt ./...` / `ruff format .` / `clang-format`
- 测试：写清楚本仓库实际命令
- 静态检查：写清楚本仓库实际命令

## 工作要求

- 改代码前先读相关文件，不做无关重构。
- 修改后运行最小相关测试。
- 如果测试无法运行，说明原因和剩余风险。
- 不要改动用户未要求的配置、锁文件或生成文件。
```

## 使用习惯

在 CLI 里给 Codex 任务时，尽量包含：

| 信息 | 示例 |
| --- | --- |
| 目标 | “修复登录后跳转错误” |
| 上下文 | “相关文件是 `src/auth/*` 和 `tests/auth_test.py`” |
| 约束 | “不要改 API 返回结构” |
| 验证 | “运行 `pytest tests/auth_test.py`” |

CLI 下不像 IDE 会自动带入打开文件，通常要明确提到路径，或者用 `@` / `/mention` 附加文件。

## 不建议做的事

- 不建议在 Neovim 配置里硬编码 Codex 的模型、权限、MCP 等长期设置。
- 不建议让 Codex 默认拥有过宽权限；先用默认 sandbox/approval，熟悉后再对可信仓库放宽。
- 不建议把“每次都要做”的规则写在 prompt 里重复粘贴，应该沉淀到 `AGENTS.md`。

参考官方入口：

- https://developers.openai.com/codex/codex-manual.md
- https://developers.openai.com/codex/config-basic
- https://developers.openai.com/codex/guides/agents-md
