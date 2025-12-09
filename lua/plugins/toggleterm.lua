return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 5,
			open_mapping = [[<leader>t]],
			shading_factor = 2,
			direction = "horizontal",
			close_on_exit = true,
			shell = vim.o.shell,
		})
	end,
}
