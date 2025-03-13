local M = {}

local border = {
  { "🭽", "FloatBorder" },
  { "▔", "FloatBorder" },
  { "🭾", "FloatBorder" },
  { "▕", "FloatBorder" },
  { "🭿", "FloatBorder" },
  { "▁", "FloatBorder" },
  { "🭼", "FloatBorder" },
  { "▏", "FloatBorder" },
}

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local capabilities = require("blink.cmp").get_lsp_capabilities()

M.defaults = function()
  require("lspconfig").lua_ls.setup {
    handlers = handlers,
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  }

  require("lspconfig").pyright.setup {
    handlers = handlers,
    capabilities = capabilities,
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          typeCheckingMode = "basic",
          useLibraryCodeForTypes = true,
        },
      },
    },
  }

  require("lspconfig").yamlls.setup {
    handlers = handlers,
    capabilities = capabilities,
    settings = {
      yaml = {
        format = {
          enable = true,
          singleQuote = false,
          bracketSpacing = true,
        },
      },
      yml = {
        format = {
          enable = true,
          singleQuote = false,
          bracketSpacing = true,
        },
        validate = true,
        completion = true,
        hover = true,
      },
    },
  }
end

return M
