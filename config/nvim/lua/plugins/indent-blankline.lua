-- Indent guides for Neovim

local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}
local hooks = require("ibl.hooks")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed", { bg = "#F5D3C7" })
  vim.api.nvim_set_hl(0, "RainbowYellow", { bg = "#F7E8C9" })
  vim.api.nvim_set_hl(0, "RainbowBlue", { bg = "#D6E4E6" })
  vim.api.nvim_set_hl(0, "RainbowOrange", { bg = "#F2DFC3" })
  vim.api.nvim_set_hl(0, "RainbowGreen", { bg = "#E3E9C8" })
  vim.api.nvim_set_hl(0, "RainbowViolet", { bg = "#EFD6E1" })
  vim.api.nvim_set_hl(0, "RainbowCyan", { bg = "#D3E6DA" })
end)

return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",

  opts = {
    indent = { highlight = highlight, char = "" },
    whitespace = {
      highlight = highlight,
      remove_blankline_trail = false,
    },
    scope = { enabled = false },
  },
}
