return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
      auto_install = true,
			ensure_installed = {
				"python",
				"lua",
				"vim",
				"bash",
				"json",
				"html",
				"css",
				"javascript",
				"typescript",
				"c",
				"cpp",
				"go",
				"php",
				"java",
				"c_sharp",
				"markdown",
				"markdown_inline",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
