return {
  {
    "ahmedkhalf/project.nvim",
    -- event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-tree.lua",
    },
    opts = {
      manual_mode = true,        -- Only manual projects
      -- edit in ~/.local/share/nvim/project_nvim/project_history
      show_hidden = true,
      silent_chdir = true,
    },
    config = function(_, opts)
      local project = require("project_nvim")
      project.setup(opts)

      -- nvim-tree config
      local ok, nvim_tree = pcall(require, "nvim-tree")
      if ok then
        nvim_tree.setup({
          update_focused_file = {
            enable = true,
            update_root = false,
          },
          view = { width = 30, side = "left" },
          hijack_directories = { enable = false },
        })
      end

      -- Load telescope extension
      require("telescope").load_extension("projects")

      -- Update tree root on project change
      project.on_project_changed = function()
        local ok, api = pcall(require, "nvim-tree.api")
        if ok then api.tree.change_root(project.get_project_root()) end
      end

      -- Telescope picker keymap
      vim.keymap.set("n", "<leader>fp", function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")

        telescope.extensions.projects.projects({
          attach_mappings = function(prompt_bufnr, map)
            local function open_project()
              local entry = action_state.get_selected_entry()
              actions.close(prompt_bufnr)
              if not entry then return end

              local path = entry.cwd or entry.value or entry.path
              if not path then return end

              vim.api.nvim_set_current_dir(path)

              local ok, api = pcall(require, "nvim-tree.api")
              if ok then api.tree.change_root(path) end
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
