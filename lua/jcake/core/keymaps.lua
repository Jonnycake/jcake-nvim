local jcake = require("jcake.core.lib")
local telescope = require('telescope.builtin')
-- --------------------- --
-- basic keymap settings --
-- --------------------- --
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
        { key='qq', command=':q<CR>' },

        -- leader commands
        { key='<leader>t', command='<C-W>s<C-W><Down>:terminal<CR>:res 15<CR>i', desc='Open a small terminal in insert mode' },
        { key='<leader>.v', command='<ESC>:Vexplore<CR>', desc='Open netrw in current directory (vertical split)' },
        { key='<leader>.h', command='<ESC>:Hexplore<CR>', desc='Open netrw in current directory (horizontal split)' },
        { key='<leader>..', command='<ESC>:Explore<CR>', desc='Open netrw in current directory (this pane)' },
        { key='<leader>q', command='<ESC>:bd<CR>', desc='Close buffer' },
        { key='<leader>h', command='<ESC>:noh<CR>', desc='Remove highlights' },
        { key='<leader>p', command='<ESC>"0p', desc='Paste last yank (below)' },
        { key='<leader>P', command='<ESC>"0P', desc='Paste last yank (above)' },
        { key='<leader>b', command='<ESC>:bnext<CR>', desc='Next buffer' },
        { key='<leader>B', command='<ESC>:bprev<CR>', desc='Next buffer' },

        -- CTRL commands
        { key='<C-L><C-L>', command=':set invrelativenumber<CR>', desc='Toggle relative line numbers' },
        { key='<C-p>', command='<ESC>:set paste<CR>"*P:set nopaste<CR>', desc='Paste from clipboard' },
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
        { key='<leader>fk', command='<ESC>:Telescope keymaps<CR>', desc='List keymaps' },
        { key='<leader>gs', command=telescope.git_status, desc='Git status' },
        { key='<leader>gl', command=telescope.git_commits, desc='Git log' },

        -- Specialty comamnds (buffer specific)
        { key='<leader>c', command=jcake.cd_here, desc='CD to the current directory in netrw' },
    },
    t={
        { key='<C-n>', command='<C-\\><C-n>', desc='Switch back to normal mode' },
    },
}

-- ------------------------------------------------- --
-- run the keymaps and commands we configured up top --
-- ------------------------------------------------- --
for mode, binds in pairs(keymaps) do
	for key, bind in pairs(binds) do
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
