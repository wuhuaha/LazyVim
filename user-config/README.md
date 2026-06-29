# wuhuaha LazyVim 用户配置模板

这个目录不是 LazyVim 核心代码，而是可复制到 Neovim 配置目录的个人配置模板。

Windows 默认目标目录：

```powershell
$env:LOCALAPPDATA\nvim
```

macOS/Linux 默认目标目录：

```sh
~/.config/nvim
```

建议先备份旧配置，再复制本目录内容：

```powershell
Rename-Item $env:LOCALAPPDATA\nvim nvim.bak -ErrorAction SilentlyContinue
Copy-Item -Recurse .\user-config\* $env:LOCALAPPDATA\nvim\
nvim
```

第一次启动时，`lazy.nvim` 会下载插件，Mason 会安装 Go、Python、C/C++ 相关工具。网络不稳定时可以先进入 Neovim 后执行：

```vim
:Lazy sync
:Mason
:checkhealth
```
