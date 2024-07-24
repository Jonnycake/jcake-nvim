local commands = {
    'colorscheme habamax',
    'filetype indent off',
    'clearjumps',
}

vim.api.nvim_create_autocmd('BufLeave', {
    command="mark e"
})

vim.api.nvim_create_autocmd('VimEnter', {
    command="clearjumps"
})

for _, command in pairs(commands) do
    vim.cmd(command)
end

