return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    config = function()
      local fl = require("flash")
      fl.setup({
        search = { incremental = true, multi_window = true },
        jump = { autojump = true },
        modes = {
          char = {
            enabled = false,
          },
        },
      })

      vim.keymap.set({ "n", "x", "o" }, "s", fl.jump)
    end,
  },
}