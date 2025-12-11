return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 30,
			open_mapping = [[<C-t>]],
			shading_factor = 2,
			direction = "vertical",
			close_on_exit = true,
			shell = vim.o.shell,
		})
	end,
}
