vim.lsp.enable("lua_ls")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("clangd")
vim.lsp.enable("arduino_language_server")

vim.diagnostic.config({
  virtual_text = {
    prefix = '●',  -- Could be '●', '▎', 'x'
    spacing = 2,
    severity = { min = vim.diagnostic.severity.WARN }, -- only warnings+
  },
})

-- ardunino
vim.lsp.config("arduino_language_server", {
  capabilities = {
      textDocument = {
          semanticTokens = vim.NIL,
      },
      workspace = {
          semanticTokens = vim.NIL,
      },
  },

  cmd = {
      "arduino-language-server",
      "-cli-config",
      "$HOME/.arduino15/arduino-cli.yaml",
      "-fqbn",
      "arduino:avr:uno",
      "-cli",
      "arduino-cli",
      "-clangd",
      "clangd",
  },

  filetypes = { "arduino", "ino" },

  root_dir = function(bufnr, on_dir)
      on_dir(vim.fn.expand "%:p:h")
  end,
})

-- c++
vim.lsp["clangd"] = {
  cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose'},
  init_options = {
    fallbackFlags = { '-std=c++17' },
  },
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.lsp.config('*', {
    capabilities = capabilities,
})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = 'Lsp: ' .. desc })
        end

        local tele = require("telescope.builtin")
        map('gd', tele.lsp_definitions, 'Goto Definition')
        map('<leader>fs', tele.lsp_document_symbols, 'Doc Symbols')
        map('<leader>fS', tele.lsp_dynamic_workspace_symbols, 'Dynamic Symbols')
        map('<leader>ft', tele.lsp_type_definitions, 'Goto Type')
        map('<leader>fr', tele.lsp_references, 'Goto References')
        map('<leader>fi', tele.lsp_implementations, 'Goto Impl')

        map('K', vim.lsp.buf.hover, 'hover')
        map('<leader>E', vim.diagnostic.open_float, 'diagnostic')
        map('<leader>k', vim.lsp.buf.signature_help, 'sig help')
        map('<leader>rn', vim.lsp.buf.rename, 'rename')
        map('<leader>ca', vim.lsp.buf.code_action, 'code action')
        map('<leader>wf', vim.lsp.buf.format, 'format')

        vim.keymap.set('v',
            '<leader>ca',
            vim.lsp.buf.code_action, { buffer = ev.buf, desc = 'Lsp: code_action' })

    end,
})
