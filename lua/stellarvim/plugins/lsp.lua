return {
  "neovim/nvim-lspconfig",
  opts = function()
    local icons = require("stellarvim.config").icons
    local ret = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
        -- signs = {
        --   text = {
        --     [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
        --     [vim.diagnostic.severity.WARN] = icons.diagnostics.Warn,
        --     [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
        --     [vim.diagnostic.severity.INFO] = icons.diagnostics.Info,
        --   },
        -- },
      },
      inlay_hints = {
        enabled = true
      },
      capabilities = {
        workspace = {
          fileOperations = {
            didRename = true,
            willRename = true,
          },
        },
      },
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false
              },
              completion = {
                callSnippet = "Replace"
              },
              doc = {
                privateName = { "^_" }
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable"
              }
            }
          }
        }
      }
    }
    return ret
  end,
  config = vim.schedule_wrap(function(_, opts)
    vim.diagnostic.config(vim.deepcopy(opts.diagnostics))
    if opts.capabilities then
      vim.lsp.config("*", { capabilities = opts.capabilities })
    end

    for server, serv_opts in pairs(opts.servers) do
      vim.lsp.config(server, serv_opts)
    end

    require("mason-lspconfig").setup({
      ensure_installed = vim.tbl_keys(opts.servers)
    })
  end),
  dependencies = {
    { "mason-org/mason.nvim",           opts = {} },
    { "mason-org/mason-lspconfig.nvim", config = function() end }
  },
}
