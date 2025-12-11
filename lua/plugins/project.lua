return {
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-tree/nvim-tree.lua" },
    opts = {
      manual_mode = false,
      detection_methods = { "lsp", "pattern" },
      patterns = {
        ".git",
        ".gitignore",
        "README.md",
        "LICENSE.md",
        "pyproject.toml",
        "Makefile",
        "build.gradle",
        "requirements.txt",
        "package.json",
      },
      show_hidden = true,
    },
    config = function(_, opts)
      local project = require("project_nvim")
      project.setup(opts)

      -- Setup nvim-tree before using API
      local ok, nvim_tree = pcall(require, "nvim-tree")
      if ok then
        nvim_tree.setup({
          update_focused_file = { enable = true },
          view = { width = 30, side = "left" },
        })
      end

      -- Load telescope project extension
      require("telescope").load_extension("projects")

      -- Update nvim-tree root when switching projects
      project.on_project_changed = function()
        local ok, api = pcall(require, "nvim-tree.api")
        if ok then
          api.tree.change_root(project.get_project_root())
        end
      end

      -- Keymap to open Telescope project picker
      vim.keymap.set("n", "<leader>fp", function()
        require("telescope").extensions.projects.projects({
          attach_mappings = function(prompt_bufnr, map)
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")

            local function open_project()
              local selection = action_state.get_selected_entry()
              actions.close(prompt_bufnr)
              if selection then
                local path = selection.path or selection.value or selection.cwd
                if path then
                  vim.cmd("cd " .. path)
                  local ok, api = pcall(require, "nvim-tree.api")
                  if ok then
                    api.tree.change_root(path)
                  end
                end
              end
            end

            map("i", "<CR>", open_project)
            map("n", "<CR>", open_project)
            return true
          end,
        })
      end, { desc = "Find Project" })
    end,
  },
}
