return {
	"stevearc/oil.nvim",
	config = function()
		local oil = require("oil")
		oil.setup({})
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "oil",
			callback = function()
				vim.opt_local.relativenumber = false
				vim.opt_local.number = false
			end,
		})
		vim.keymap.set("n", "<leader>o", oil.toggle_float, {})
	end,
}
