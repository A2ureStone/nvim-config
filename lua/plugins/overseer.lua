return {
  {
    "stevearc/overseer.nvim",
    cmd = {
      "OverseerOpen",
      "OverseerClose",
      "OverseerToggle",
      "OverseerSaveBundle",
      "OverseerLoadBundle",
      "OverseerDeleteBundle",
      "OverseerRunCmd",
      "OverseerRun",
      "OverseerInfo",
      "OverseerBuild",
      "OverseerQuickAction",
      "OverseerTaskAction",
      "OverseerRestartLast",
      "OverseerClearCache",
    },
    opts = function()
      vim.api.nvim_create_user_command("OverseerRestartLast", function()
        local overseer = require("overseer")
        local tasks = overseer.list_tasks({ recent_first = true })
        if vim.tbl_isempty(tasks) then
          vim.notify("No tasks found", vim.log.levels.WARN)
        else
          overseer.run_action(tasks[1], "restart")
        end
      end, {})
      return {
        dap = false,
        task_list = {
          bindings = {
            ["<C-h>"] = false,
            ["<C-j>"] = false,
            ["<C-k>"] = false,
            ["<C-l>"] = false,
          },
        },
        form = {
          win_opts = {
            winblend = 0,
          },
        },
        confirm = {
          win_opts = {
            winblend = 0,
          },
        },
        task_win = {
          win_opts = {
            winblend = 0,
          },
        },
        templates = { "builtin", "user.cpp_build", "gen.cwd_sh" },
      }
    end,
  -- stylua: ignore
    keys = function()
      return {
        { "<leader>ol", "<cmd>OverseerToggle<cr>",      desc = "Task list" },
        { "<leader>ot", "<cmd>OverseerRun<cr>",         desc = "Run task" },
        { "<leader>or", "<cmd>OverseerRestartLast<cr>", desc = "Restart last task" },
        { "<leader>oq", "<cmd>OverseerQuickAction<cr>", desc = "Action recent task" },
        { "<leader>oi", "<cmd>OverseerInfo<cr>",        desc = "Overseer Info" },
        { "<leader>ob", "<cmd>OverseerBuild<cr>",       desc = "Task builder" },
        { "<leader>oa", "<cmd>OverseerTaskAction<cr>",  desc = "Task action" },
        { "<leader>oc", "<cmd>OverseerClearCache<cr>",  desc = "Clear cache" },
      }
    end,
  },
}
