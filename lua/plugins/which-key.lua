return {
  "folke/which-key.nvim",
  -- currently not enabled
  enabled = false,
  event = "VeryLazy",
  dependencies = {
    "echasnovski/mini.icons",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local wk = require("which-key")

    vim.o.timeout = true
    vim.o.timeoutlen = 1000

    wk.setup({})

    -- group names
    wk.register({
      {
        { "<leader>g", group = "git" },
        { "<leader>l", group = "lsp" },
        { "<leader>vt", group = "vim-test" },
        { "<leader>h", group = "harpoon" },
        { "<leader>a", group = "add to harpoon" },
        { "<leader>1", group = "harpoon 1" },
        { "<leader>2", group = "harpoon 2" },
        { "<leader>3", group = "harpoon 3" },
        { "<leader>4", group = "harpoon 4" },
      },
    })

    -- vim.keymap.set("n", "<leader>chwk", "<cmd>:checkhealth which-key<CR>")
  end,
}
