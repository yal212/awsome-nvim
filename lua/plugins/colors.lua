return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
      require("catppuccin").setup({
      })
			-- vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				styles = {
					italic = false,
				},
			})
			vim.cmd.colorscheme("rose-pine")
		end,
	},
	{
		"xiyaowong/transparent.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("transparent").setup({
				extra_groups = {
					-- core
					"Normal",
					"NormalFloat",

					-- separators
					"WinSeparator",
					"VertSplit",

					-- Neo-tree
					"NeoTreeNormal",
					"NeoTreeNormalNC",
					"NeoTreeEndOfBuffer",
					"NeoTreeFloatNormal",
					"NeoTreeFloatBorder",

					-- Telescope (already known)
					"TelescopeNormal",
					"TelescopeBorder",
				},
			})
			-- :TransparentEnable
			-- :TransparentDisable
			-- :TransparentToggle
			-- vim.cmd("TransparentEnable")
			vim.keymap.set("n", "<leader>tt", "<cmd>TransparentToggle<CR>", {
				desc = "Toggle transparency",
				silent = true,
			})
		end,
	},
}
