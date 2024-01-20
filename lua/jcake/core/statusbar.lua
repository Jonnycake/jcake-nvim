-- ---------------------- --
-- set up the status line --
-- ---------------------- --
return function()
    local mode = "%-5{%v:lua.string.upper(v:lua.vim.fn.mode())%}"
    local file_name = "%-.16t"
    local buf_nr = "[%n] "
    local modified = " %-m"
    local right_align = "%="
    local line_no = "%10([%l/%L%)]"
    local pct_thru_file = "%5p%%"

    return string.format(
        "%s%s%s%s%s%s",
        right_align,
        buf_nr,
        file_name,
        modified,
        line_no,
        pct_thru_file
    )
end
