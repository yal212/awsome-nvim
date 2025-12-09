return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.start({
				name = "pyright",
				cmd = { "pyright-langserver", "--stdio" },
				filetypes = { "python" },
				capabilities = capabilities,
			})
      -- jdtls might not be installed?
			-- vim.lsp.start({
				-- name = "jdtls",
				-- cmd = { "jdtls" },
				-- filetypes = { "java" },
				-- capabilities = capabilities,
			-- })
			vim.lsp.start({
				name = "clangd",
				cmd = { "clangd" },
				filetypes = { "c", "cpp" },
				capabilities = capabilities,
			})

			vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>lc", vim.lsp.buf.code_action, {})
		end,
	},
}
