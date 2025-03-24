local o = vim.opt
local go = vim.go
local statusbar = require("jcake.core.statusbar")
Tabline = require("jcake.core.tabline")

go.tabline = "%!v:lua.Tabline()"
o.winbar = statusbar()

o.cindent = false
o.smartindent = true
o.wrap = false
o.number = true
o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4
o.shellcmdflag = '-c'
o.confirm = true
o.relativenumber = true
o.fileformats = "unix,dos"
o.foldmethod = 'indent'
o.foldlevel = 99 -- Don't automatically fold anything
o.mouse = ""

o.scrolloff = 10

-- Don't store any marks in shada file
o.shada = "'0,f0"

vim.g.copilot_enabled = false

require("jcake.core.keymaps")
require("jcake.core.autocommands")
require("jcake.core.user_commands")
