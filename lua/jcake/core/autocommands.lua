local commands = {
    'colorscheme habamax',
    'filetype indent off',
}

vim.api.nvim_create_autocmd('BufLeave', {
    command="mark e"
})

for _, command in pairs(commands) do
    vim.cmd(command)
end

