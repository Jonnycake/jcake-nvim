local jcake = require("jcake.core.lib")
local telescope = require('telescope.builtin')
local keymaps = {
    i = {
        { key='<C-L><C-L>', command='<ESC>:set invrelativenumber<CR>a', desc='Toggle relative line numbers' },
        { key='<C-p>', command='<ESC>:set paste<CR>"*P:set nopaste<CR>a', desc='Paste from clipboard' },
        { key='<C-s>', command='<ESC>:up<CR>a', desc='Save file and back to insert mode' },
        { key='<S-Tab>', command='<C-D>', desc='Unindent' },
    },
    n = {
        -- shortcuts
        { key='<leader>w', command='<C-W>', desc='Start window command' },
        { key='qq', command='<ESC>:q<CR>' },
        { key='gb', command=':bnext<CR>', desc='Next buffer' },
        { key='gB', command=':bprev<CR>', desc='Previous buffer' },
        { key='<leader>y', command='<ESC>"*y', desc='Yank to clipboard' },
        { key='<leader>p', command='<ESC>"*p', desc='Paste from clipboard (below)' },
        { key='<leader>P', command='<ESC>"*P', desc='Paste from clipboard (above)' },
        { key='<leader>d', command='<ESC>"_d', desc='Delete into blackhole register' },

        -- Location List
        { key='[]l', command='<ESC>:lopen<CR>', desc='Open location list' },
        { key='][l', command='<ESC>:lclose<CR>', desc='Close location list' },
        { key='[l', command='<ESC>:lprev<CR>', desc='Previous location in location list' },
        { key=']l', command='<ESC>:lnext<CR>', desc='Next location in location list' },
        { key='[d]l', command=vim.diagnostic.setloclist, desc='Set location list from diagnostics' },

        -- Quickfix List
        { key='[]c', command='<ESC>:copen<CR>', desc='Open quickfix list' },
        { key='][c', command='<ESC>:cclose<CR>', desc='Close quickfix list' },
        { key='[c', command='<ESC>:cprev<CR>', desc='Previous location in quickfix list' },
        { key=']c', command='<ESC>:cnext<CR>', desc='Next location in quickfix list' },
        { key='[d]c', command=vim.diagnostic.setqflist, desc='Set quickfix list from diagnoistics' },

        -- leader commands
        { key='<leader>t', command='<C-W>s<C-W><Down>:terminal<CR>:res 15<CR>i', desc='Open a small terminal in insert mode' },
        { key='<leader>__', command='<ESC>:Oil .<CR>', desc='Open oil in project directory' },
        { key='<leader>--', command='<ESC>:Oil<CR>', desc='Open oil in current directory' },
        { key='<leader>h', command='<ESC>:noh<CR>', desc='Remove highlights' },
        { key='<C-P>', command='<ESC>"0P', desc='Paste last yank (above)' },

        -- CTRL commands
        { key='<C-L><C-L>', command=':set invrelativenumber<CR>', desc='Toggle relative line numbers' },
        { key='<C-b>', command='<C-b>zz', desc='Move up a full page and center screen' },
        { key='<C-f>', command='<C-f>zz', desc='Move down a full page and center screen' },
        { key='<C-d>', command='<C-d>zz', desc='Move down a half page and center screen' },
        { key='<C-u>', command='<C-u>zz', desc='Move up a half page and center screen' },

        -- Single button shortcuts
        { key='<Up>', command='<ESC><C-W><Up>', desc='Move cursor to pane above' },
        { key='<Down>', command='<ESC><C-W><Down>', desc='Move cursor to pane below' },
        { key='<Left>', command='<ESC><C-W><Left>', desc='Move cursor to pane to left' },
        { key='<Right>', command='<ESC><C-W><Right>', desc='Move cursor to pane to right' },

        -- Telescope Commands
        { key='<leader>ff', command=telescope.find_files, desc='Telescope find files' },
        { key='<leader>fg', command=telescope.live_grep, desc='Telescope live grep' },
        { key='<leader>fb', command=telescope.buffers, desc='Telescope buffers' },
        { key='<leader>fc', command=telescope.grep_string, desc='Telescope grep for string under cursor' },
        { key='<leader>fh', command=telescope.help_tags, desc='Telescope tags' },
        { key='<leader>fm', command=telescope.marks, desc='Telescope marks' },
        { key='<leader>fk', command=telescope.keymaps, desc='Telescope keymaps' },
        { key='<leader>gs', command=telescope.git_status, desc='Git status' },
        { key='<leader>gl', command=telescope.git_commits, desc='Git log' },

        -- Specialty commands (buffer specific)
        { key='<leader>c', command=jcake.cd_here, desc='CD to the current directory in netrw' },

        -- File Jump Shortcuts
        { key='mq', command='mQ' }, { key="'q", command="'Q|'e|zz" },
        { key='mw', command='mW' }, { key="'w", command="'W|'e|zz" },
        { key='me', command='mE' }, { key="'e", command="'E|'e|zz" },
        { key='mr', command='mR' }, { key="'r", command="'R|'e|zz" },
        { key='mt', command='mT' }, { key="'t", command="'T|'e|zz" },
        { key="'<Tab>", command=':b#<CR>', 'Switch to altnerate buffer' },

        -- Code folding shortcuts
        { key='<space>', command='za', desc='Fold at indent level' },

        -- vsnip shortcuts
        { key='<leader>snip', command=':VsnipYank<CR>:VsnipOpen<CR>' },
        { key='<leader>vso', command=':VsnipOpen<CR>' },
    },
    v = {
        { key='<S-Tab>', command='<vgv', desc='Un-indent block of code' },
        { key='<Tab>', command='>vgv', desc='Indent block of code' },
        { key='<leader>y', command='"*y', desc='Yank to clipboard' },

        -- vsnip shortcuts
        { key='<leader>snip', command=':VsnipYank<CR>:VsnipOpen<CR>' },
    },
    t = {
        { key='<C-n>', command='<C-\\><C-n>', desc='Switch back to normal mode' },
    },
}

-- ------------------------------------------------- --
-- run the keymaps and commands we configured up top --
-- ------------------------------------------------- --
for mode, binds in pairs(keymaps) do
	for _, bind in pairs(binds) do
        local noremap = true
        local silent = true
        local desc = ''

        if bind['noremap'] ~= nil then
            noremap = bind['noremap']
        end
        if bind['silent'] ~= nil then
            silent = bind['silent']
        end
        if bind['desc'] ~= nil then
            desc = bind['desc']
        end

		vim.keymap.set(mode, bind.key, bind.command, {noremap=noremap, silent=silent, desc=desc})
	end
end
