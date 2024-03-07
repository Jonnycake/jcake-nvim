vim.api.nvim_create_user_command(
    'TabsToSpaces', function(args)
        local range_spec = '';

        if args.range == 2 then
            range_spec = args.line1 .. ',' .. args.line2;
        end

        vim.cmd('set tabstop=2 softtabstop=2 noexpandtab')
        vim.cmd(range_spec .. 'retab!')
        vim.cmd('set tabstop=4 softtabstop=4 expandtab')
        vim.cmd(range_spec .. 'retab')
    end,
    { desc = 'Change 2 space to 4 space tabs', range=true }
)
