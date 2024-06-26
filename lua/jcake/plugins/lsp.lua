-- No LSP for twig, but we can tell it to use the html one
vim.api.nvim_create_autocmd(
    {'BufRead', 'BufNewFile',},
    {
        pattern="*.twig",
        command="set syntax=html filetype=html",
    }
);

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "intelephense",
                    "tsserver",
                    "html",
                    "cssls",
                    "pyright",
                    "volar",
                    "marksman",
                    "powershell_es",
                    "groovyls",
                    "gopls",
                    "clangd",
                },
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config=function()
            local lspconfig = require('lspconfig')

            -- Lua
            lspconfig.lua_ls.setup({
                settings={
                    Lua={
                        diagnostics={
                            globals={
                                'vim',
                                'require',
                            },
                        },
                    },
                },
            })

            -- PHP
            lspconfig.intelephense.setup({
                settings={
                    intelephense={
                        stubs={
                            "apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "ctype", "curl", "date",
                            "dba", "dom", "enchant", "exif", "FFI", "fileinfo", "filter", "fpm", "ftp", "gd", "gettext",
                            "gmp", "hash", "iconv", "imap", "intl", "json", "ldap", "libxml", "mbstring", "meta", "mysqli",
                            "oci8", "odbc", "openssl", "pcntl", "pcre", "PDO", "pdo_ibm", "pdo_mysql", "pdo_pgsql", "pdo_sqlite", "pgsql",
                            "Phar", "posix", "pspell", "readline", "Reflection", "session", "shmop", "SimpleXML", "snmp", "soap",
                            "sockets", "sodium", "SPL", "sqlite3", "standard", "superglobals", "sysvmsg", "sysvsem", "sysvshm", "tidy",
                            "tokenizer", "xml", "xmlreader", "xmlrpc", "xmlwriter", "xsl", "Zend OPcache", "zip", "zlib",
                            "wordpress", "phpunit", "wordpress",
                        },
                        environment = {
                            includePaths = {
                                os.getenv('HOME') .. '/.lsp/stubs/intelephense/',
                            },
                        },
                    },
                },
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true;
            -- JS / TS
            lspconfig.tsserver.setup({})

            -- VueJS
            lspconfig.volar.setup({})

            -- HTML
            lspconfig.html.setup({
                capabilities = capabilities,
            })

            -- CSS
            lspconfig.cssls.setup({
                capabilities = capabilities,
            })

            -- Python
            lspconfig.pyright.setup({})

            -- Marksman
            lspconfig.marksman.setup({})

            -- Powershell
            lspconfig.powershell_es.setup({})

            -- Groovy (e.g. build.gradle)
            lspconfig.groovyls.setup({
                cmd = {
                    "java", "-jar",
                    -- NOTE: This path might need to be updated (particularly if running on windows)
                    os.getenv('HOME') .. "/.local/share/nvim/mason/packages/groovy-language-server/build/libs/groovy-language-server-all.jar"
                }
            })

            -- Golang
            lspconfig.gopls.setup({})

            -- C / C++
            lspconfig.clangd.setup({})

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
              group = vim.api.nvim_create_augroup('UserLspConfig', {}),
              callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                -- vim.keymap.set('n', '<space>wl', function()
                --  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                -- end, opts)
                -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                -- vim.keymap.set('n', '<space>f', function()
                --  vim.lsp.buf.format { async = true }
                -- end, opts)
              end,
            })

            vim.diagnostic.config({
                virtual_text = {
                    severity= { min = vim.diagnostic.severity.WARN },
                },
            })
        end
    }
}
