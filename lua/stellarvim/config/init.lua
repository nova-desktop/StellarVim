if vim.fn.has("nvim-0.10") ~= 1 then
  vim.api.nvim_echo({ { "Your neovim is too old. StellarVim only supports 0.10 and newer.", "ErrorMsg" } }, true, {})
  vim.fn.getchar()
  os.exit(1)
end

local M = {}

function M.setup(opts)
  local LazyUtil = require("lazy.core.util")

  LazyUtil.try(function()
    if type(opts.colorscheme) == "function" then
      opts.colorscheme()
    else
      vim.cmd.colorscheme(opts.colorscheme)
    end
  end, {
    msg = "Couldn't load the specified colorscheme",
    on_error = function(msg)
      LazyUtil.error(msg)
      vim.cmd.colorscheme("habamax")
    end
  })
end

function M.init()
  -- First laod StellarVim default options
  require("stellarvim.config.options")
  -- Then load the user's custom option overrides
  require("config.options")
end

return M
