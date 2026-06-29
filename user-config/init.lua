-- Neovim 启动入口。
--
-- 这个文件保持很薄，只负责加载 lua/config/lazy.lua。
-- 这样真正的插件、快捷键、选项都能分散在清晰的小文件里，后续排查问题更容易。
require("config.lazy")
