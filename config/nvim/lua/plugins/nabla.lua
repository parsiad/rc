-- take your scientific notes ✏️ in Neovim

return {
  "jbyuki/nabla.nvim",
  event = "VeryLazy",
  config = function()
    if vim.bo.filetype == "markdown" then
      require("nabla").enable_virt({ autogen = true })
    end
  end,
}
