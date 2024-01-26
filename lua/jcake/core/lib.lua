return {
    cd_here=function()
        if vim.bo.filetype ~= 'netrw' then
            return
        end

        vim.cmd('tcd ' .. vim.fn.getreg('%'))
    end
}
