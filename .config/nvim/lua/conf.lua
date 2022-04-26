-------------------------------------------------------------
---                   __  _             
---   ___ ___  _ __  / _|| |_   _  __ _ 
---  / __/ _ \| '_ \| |_ | | | | |/ _` |
--- | (_| (_) | | | |  _|| | |_| | (_| |
---  \___\___/|_| |_|_|(_)_|\__,_|\__,_|
-------------------------------------------------------------

vim.g.coq_settings = { ['auto_start'] = 'shut-up' }

local lsp = require('lspconfig')
local coq = require('coq')

local on_attach = function(_, bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()                                 <CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()                                 <CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()                                  <CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()                                       <CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()                              <CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()                              <CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()                             <CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()                                      <CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lR', '<cmd>lua vim.lsp.buf.references()                                  <CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>l?', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()                <CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lw', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))  <CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lq', '<cmd>lua vim.lsp.diagnostic.set_loclist()                          <CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>l[', '<cmd>lua vim.lsp.diagnostic.goto_prev()                            <CR>', opts) 
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>l]', '<cmd>lua vim.lsp.diagnostic.goto_next()                            <CR>', opts)
end

lsp.clangd.setup(coq.lsp_ensure_capabilities({ on_attach = on_attach }))
lsp.jedi_language_server.setup(coq.lsp_ensure_capabilities({ on_attach = on_attach }))
lsp.gopls.setup(coq.lsp_ensure_capabilities({ on_attach = on_attach }))
lsp.rust_analyzer.setup(coq.lsp_ensure_capabilities({ on_attach = on_attach }))

local tele = require('telescope')
local action_layout = require('telescope.actions.layout')

tele.setup {
    defaults = {
        mappings = {
            n = {
                ["<M-o>"] = action_layout.toggle_preview
            },
            i = {
                ["<M-o>"] = action_layout.toggle_preview
            }
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                             -- the default case_mode is "smart_case"
        }
    }
}
tele.load_extension('fzf')
tele.load_extension('project')

require('Comment').setup()

local opts = { noremap = true }
mapk = vim.api.nvim_set_keymap

mapk('n', '<leader>tt', "<cmd>Telescope<CR>", opts)
mapk('n', '<leader>tf', "<cmd>Telescope find_files<CR>", opts)
mapk('n', '<leader>th', "<cmd>Telescope find_files hidden=true<CR>", opts)
mapk('n', '<leader>tg', "<cmd>Telescope live_grep<CR>", opts)
mapk('n', '<leader>tb', "<cmd>Telescope buffers<CR>", opts)
mapk('n', '<leader>gb', "<cmd>Telescope git_branches<CR>", opts)
mapk('n', '<leader>gc', "<cmd>Telescope git_commits<CR>", opts)
mapk('n', '<leader>gs', "<cmd>Telescope git_status<CR>", opts)
mapk('n', '<leader>tp', "<cmd>Telescope project<CR>", opts)
mapk('n', '<leader>tr', "<cmd>Telescope resume<CR>", opts)
