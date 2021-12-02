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
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()                                 <CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()                                 <CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()                                  <CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>K',  '<cmd>lua vim.lsp.buf.hover()                                       <CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()                              <CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()                              <CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()                             <CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gr', '<cmd>lua vim.lsp.buf.rename()                                      <CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gR', '<cmd>lua vim.lsp.buf.references()                                  <CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>g?', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()                <CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gw', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))  <CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gq', '<cmd>lua vim.lsp.diagnostic.set_loclist()                          <CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>[', '<cmd>lua vim.lsp.diagnostic.goto_prev()                            <CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>]', '<cmd>lua vim.lsp.diagnostic.goto_next()                            <CR>', opts)
end

lsp.clangd.setup(coq.lsp_ensure_capabilities({ on_attach = on_attach }))

--- vim.lsp.diagnostic_virtual_text_prefix = ''
--- vim.lsp.diagnostic_enable_virtual_text = 1
--- vim.g.completion_confirm_key = '<C-y>'
--- vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
--- vim.g.completion_matching_smart_case = 1
--- vim.g.completion_trigger_on_delete = 1

require('telescope').setup {
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
require('telescope').load_extension('fzf')

