return {
	-- Mason: manage LSP servers
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},

	-- Mason bridge for LSP
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
			ensure_installed = { "pyright", "lua_ls", "jdtls", "clangd" },
		},
	},

	-- LSP configuration
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			------------------------------------------------------------
			-- PYTHON (pyright)
			------------------------------------------------------------
			vim.lsp.start({
				name = "pyright",
				cmd = { "pyright-langserver", "--stdio" },
				filetypes = { "python" },
				capabilities = capabilities,
			})

			------------------------------------------------------------
			-- LUA (lua_ls)
			------------------------------------------------------------
			vim.lsp.start({
				name = "lua_ls",
				cmd = { "lua-language-server" },
				filetypes = { "lua" },
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
					},
				},
			})

			------------------------------------------------------------
			-- C++ (clangd with g++)
			------------------------------------------------------------
			vim.lsp.start({
				name = "clangd",
				cmd = { "clangd", "--query-driver=g++" },
				filetypes = { "c", "cpp" },
				capabilities = capabilities,
			})

			------------------------------------------------------------
			-- JAVA (jdtls)
			-- Must start per project
			------------------------------------------------------------
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "java",
				callback = function()
					local jdtls = require("jdtls")
					local root_markers = { ".git", "mvnw", "gradlew", "pom.xml" }
					local root = jdtls.find_root(root_markers)
					if root then
						jdtls.start_or_attach({
							cmd = { "jdtls" },
							root_dir = root,
							capabilities = capabilities,
						})
					end
				end,
			})

			------------------------------------------------------------
			-- LSP Keymaps
			------------------------------------------------------------
			local map = vim.keymap.set
			map("n", "<leader>lh", vim.lsp.buf.hover, {})
			map("n", "<leader>ld", vim.lsp.buf.definition, {})
			map("n", "<leader>lr", vim.lsp.buf.references, {})
			map("n", "<leader>lc", vim.lsp.buf.code_action, {})
			map("n", "<leader>lf", function()
				vim.lsp.buf.format({ async = true })
			end, {})
		end,
	},
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
	},
}
