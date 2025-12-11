return {
	"folke/which-key.nvim",
	lazy = false,
	dependencies = {
		"echasnovski/mini.icons",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local wk = require("which-key")

		wk.setup({

			delay = 1000,
			notify = false, -- disables warning popups

			plugins = {
				presets = {
					operators = false,
					motions = false,
					text_objects = false,
					windows = false,
					nav = false,
					z = false,
					g = false,
				},
			},

			triggers = {
				{ "<leader>" },
			},
			-- filter = function(mapping)
			-- 	return mapping.desc ~= nil
			-- end,
		})

		-- group names
		wk.register({
      -- harpoon
			h = { desc = "harpoon" },
			a = { desc = "add to harpoon" },
			["1"] = { desc = "harpoon 1" },
			["2"] = { desc = "harpoon 2" },
			["3"] = { desc = "harpoon 3" },
			["4"] = { desc = "harpoon 4" },
      -- telescope
			f = { desc = "telescope" },
			ff = { desc = "find file" },
			fg = { desc = "live grep" },
      fp = { desc = "find project" },
      -- git
			g = { desc = "git" },
			gs = { desc = "git status" },
      -- lsp
			l = { desc = "lsp" },
			lc = { desc = "code action" },
			ld = { desc = "definition" },
			lf = { desc = "format" },
			lh = { desc = "hover" },
			lr = { desc = "references" },
      -- undotree
			u = { desc = "undotree" },
      -- vim-test
			v = { desc = "vim" },
			vt = { desc = "vim-Test" },
      -- code_runner
      r = { desc = "code_runner" },
      cr = { desc = "code_runner" },
      c = { desc = "code_runner" },
      -- oil
      o = { desc = "oil" },
      -- trouble
      x = { desc = "trouble" },
      -- hiddens
			y = { hidden = true },
			Y = { hidden = true },
			w = { hidden = true },
		}, { prefix = "<leader>" })

		-- :checkhealth which-key
	end,
}
