local M = {}

M.defaults = function()
  -- Настройка для lua_ls
  require("lspconfig").lua_ls.setup {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  }

  -- Настройка для pyright
  require("lspconfig").pyright.setup {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          typeCheckingMode = "basic",
        },
      },
    },
  }
end

return M

-- return {
--   pyright = {
--     settings = {
--       python = {
--         analysis = {
--           autoSearchPaths = true,
--           typeCheckingMode = "basic",
--         },
--       },
--     },
--   },
--   lua_ls = {
--     settings = {
--       Lua = {
--         diagnostics = {
--           globals = { "vim" },
--         },
--       },
--     },
--   },
-- }
