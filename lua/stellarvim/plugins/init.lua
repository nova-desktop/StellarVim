require("stellarvim.config").init()

return {
  { "folke/lazy.nvim",         version = "*" },
  { "nova-desktop/StellarVim", priority = 10000, lazy = false, opts = {}, cond = true, version = "*" },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {},
  }
}
