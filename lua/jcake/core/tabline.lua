return function()
    local tabline = ""
    for index = 1, vim.fn.tabpagenr('$') do
        -- Select the highlighting for the current tabpage.
        if index == vim.fn.tabpagenr() then
            tabline = tabline .. '%#TabLineSel#'
        else
            tabline = tabline .. '%#TabLine#'
        end

        local project_name = vim.fn.fnamemodify(working_directory, ":t")
        tabline = tabline .. " Tab [" .. index .. "] " .. '%#TabLine#'
    end

    return tabline
end
