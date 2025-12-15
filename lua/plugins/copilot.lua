return {
	{
		"github/copilot.vim",
		event = "InsertEnter",
		config = function()
			vim.g.copilot_enabled = false
		end,
		-- Enable Copilot
		vim.keymap.set("n", "<leader>ie", ":Copilot enable<CR>", { desc = "Copilot Enable" }),
		-- Disable Copilot
		vim.keymap.set("n", "<leader>id", ":Copilot disable<CR>", { desc = "Copilot Disable" }),
	},
}
