return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function(_, opts)
      local TS = require("nvim-treesitter")

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("stellarvim_treesitter", { clear = true }),
        callback = function(ev)
          local ft, lang = ev.match, vim.treesitter.language.get_lang(ev.match)

          pcall(vim.treesitter.start, ev.buf)
        end
      })
    end
  }
}
