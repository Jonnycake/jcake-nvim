
return {
    cd_here=function()
        if vim.bo.filetype ~= 'netrw' then
            return
        end

        vim.cmd('tcd ' .. vim.fn.getreg('%'))
    end,
    grep_cword=function()
        local telescope = require('telescope.builtin')
        return telescope.live_grep({ default_text=vim.fn.expand("<cword>") })
    end,
    find_cword=function()
        local telescope = require('telescope.builtin')
        return telescope.find_files({ default_text=vim.fn.expand("<cword>") })
    end,
}
