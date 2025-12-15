return {
	{
		"ThePrimeagen/vim-be-good",
		event = "VeryLazy", -- optional lazy loading
		vim.keymap.set("n", "<leader>vg", function()
			vim.cmd("enew") -- open new empty buffer
			vim.cmd("VimBeGood") -- start the game
		end),
	},
}
