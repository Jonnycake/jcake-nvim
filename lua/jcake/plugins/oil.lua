return {
    {
        'stevearc/oil.nvim',
        opts = {
            columns = {
                "icon",
                -- "permissions",
                -- "size",
                -- "mtime",
            },
            default_file_explorer = false,
        },
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
    }
};
