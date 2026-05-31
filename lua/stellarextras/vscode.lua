if not vim.g.vscode then
  return {}
end

local enabled = {
  "StellarVim",
  "lazy.nvim",
  "snacks.nvim",
  "nvim-treesitter",
}

local Config = require("lazy.core.config")
Config.options.checker.enabled = false
Config.options.change_detection.enabled = false
Config.options.defaults.cond = function (plugin)
  return vim.tbl_contains(enabled, plugin.name) or plugin.vscode
end
vim.g.snacks_animate = false

-- Add some VSCode specific keymaps
vim.api.nvim_create_autocmd("User", {
  pattern = "StellarVimKeymapsDefaults",
  callback = function()
    -- Search and navigation
    vim.keymap.set("n", "<leader><space>", "<cmd>Find<cr>")
    vim.keymap.set("n", "<leader>/", [[<cmd>lua require('vscode').action('workbench.action.findInFiles')<cr>]])
    vim.keymap.set("n", "<leader>ss", [[<cmd>lua require('vscode').action('workbench.action.gotoSymbol')<cr>]])

    -- Keep undo/redo lists in sync with VSCode
    vim.keymap.set("n", "u", "<Cmd>call VSCodeNotify('undo')<CR>")
    vim.keymap.set("n", "<C-r>", "<Cmd>call VSCodeNotify('redo')<CR>")

    -- Navigate VSCode tabs like StellarVim buffers
    vim.keymap.set("n", "<S-h>", "<Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>")
    vim.keymap.set("n", "<S-l>", "<Cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>")
  end,
})

return {
  {
    "snacks.nvim",
    opts = {
      bigfile = { enabled = false },
      dashboard = { enabled = false },
      indent = { enabled = false },
      input = { enabled = false },
      notifier = { enabled = false },
      picker = { enabled = false },
      quickfile = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
    },
  },
  {
    "nova-desktop/StellarVim",
    config = function(_, opts)
      opts = opts or {}
      -- disable the colorscheme
      opts.colorscheme = function() end
      require("stellarvim").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { highlight = { enable = false } },
  },
}