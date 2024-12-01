return {
  "nvim-neo-tree/neo-tree.nvim",
  requires = {
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<leader>bE",
      function()
        require("neo-tree.command").execute({ source = "modified-buffers", toggle = true })
      end,
      desc = "Modified Buffer Explorer",
    },
  },
  config = {
    sources = {
      "filesystem",
      "buffers",
      "git_status",
      "ntree.modified-buffers",
    },
  },
}
