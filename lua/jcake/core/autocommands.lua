local commands = {
    'colorscheme habamax',
    'filetype indent off',
}

for _, command in pairs(commands) do
    vim.cmd(command)
end

