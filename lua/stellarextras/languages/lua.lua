return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = function (_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed, {"lua_ls"})
    end
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}