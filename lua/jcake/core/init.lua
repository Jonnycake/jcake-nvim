local o = vim.opt
local statusbar = require("jcake.core.statusbar")

o.cindent = false
o.smartindent = false
o.wrap = false
o.number = true
o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4
o.shellcmdflag = '-c'
o.confirm = true
o.relativenumber = true
o.winbar = statusbar()
o.fileformats = "unix,dos"

require("jcake.core.keymaps")
require("jcake.core.autocommands")
