local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- ----------------------------------------- --
-- configurations for lazy (package manager) --
-- ----------------------------------------- --
local lazy_opts = {}
local lazy_plugins = {
    { import = "jcake.plugins" },
}

-- ------------ --
-- plugin calls --
-- ------------ --
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(lazy_plugins, lazy_opts)
