local function prompt_args_runner(base_cmd)
  return function()
    vim.ui.input({ prompt = "Arguments (leave empty for none): " }, function(input)
      if not input then return end
      local cmd = base_cmd
      if input ~= "" then
        cmd = cmd .. " " .. input
      end
      require("code_runner.commands").run_from_fn(cmd)
    end)
  end
end

return {
  "CRAG666/code_runner.nvim",
  config = function()
    local project_nvim = require("project_nvim.project")

    require("code_runner").setup({
      mode = "term",
      focus = true,
      startinsert = false,

      -- ⭐ AUTO PROJECT DETECTION ⭐
      project = {
        ["*"] = function()
          local cwd = project_nvim.get_project_root() or vim.loop.cwd()
          local ft = vim.bo.filetype

          local commands = {
            cpp = "cd " .. cwd .. " && g++ *.cpp -std=c++20 -O2 -o project && ./project",
            python = "python3 " .. cwd .. "/main.py",
            java = "cd " .. cwd .. " && javac Main.java && java Main",
          }

          return {
            name = vim.fn.fnamemodify(cwd, ":t"),
            command = commands[ft],
            dir = cwd,
          }
        end,
      },

      float = {
        border = "rounded",
        width = 0.8,
        height = 0.6,
        border_hl = "FloatBorder",
        x = 0.5, y = 0.5,
      },

      filetype = {
        python = prompt_args_runner("python3 -u $file"),
        cpp = prompt_args_runner("cd $dir && g++ $fileName -I/usr/local/include -o /tmp/$fileNameWithoutExt && /tmp/$fileNameWithoutExt"),
        c = prompt_args_runner("cd $dir && gcc $fileName -o /tmp/$fileNameWithoutExt && /tmp/$fileNameWithoutExt"),
        java = prompt_args_runner("cd $dir && javac $fileName && java $fileNameWithoutExt"),
      },

      hot_reload = false,
    })

    -- Keymaps
    local keymap = vim.keymap.set
    keymap('n', '<leader>rr', ':RunCode<CR>')
    keymap('n', '<leader>rf', ':RunFile<CR>')
    keymap('n', '<leader>rft', ':RunFile tab<CR>')
    keymap('n', '<leader>rp', ':RunProject<CR>')
    keymap('n', '<leader>rc', ':RunClose<CR>')
    keymap('n', '<leader>crf', ':CRFiletype<CR>')
    keymap('n', '<leader>crp', ':CRProjects<CR>')
  end
}