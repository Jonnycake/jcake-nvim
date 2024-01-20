return {
    cd_here=function()
        if vim.bo.filetype ~= 'netrw' then
            return
        end

        vim.cmd('cd ' .. vim.fn.getreg('%'))
    end
}
