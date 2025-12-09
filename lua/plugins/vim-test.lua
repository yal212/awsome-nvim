return {
	"vim-test/vim-test",
	dependencies = {
		"preservim/vimux",
    "akinsho/toggleterm.nvim",
	},
	config = function()
		vim.g["test#python#runner"] = "pytest"
		vim.g["test#python#pytest#executable"] = "pytest"
    vim.g["test#lua#runner"] = "busted"

    -- c++ and java not working yet
		vim.g["test#java#runner"] = "gradle" -- or "maven"
		vim.g["test#cpp#runner"] = "gtest" -- or "catch2"

		vim.g["test#strategy"] = "toggleterm"

		vim.keymap.set("n", "<leader>vtt", ":TestNearest<CR>", {})
		vim.keymap.set("n", "<leader>vtf", ":TestFile<CR>", {})
		vim.keymap.set("n", "<leader>vta", ":TestSuite<CR>", {})
		vim.keymap.set("n", "<leader>vtl", ":TestLast<CR>", {})
		vim.keymap.set("n", "<leader>vtg", ":TestVisit<CR>", {})
	end,
}
