return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = { mason = true, autostart = true },
        ruff_lsp = {},
        rust_analyzer = {},
      },
    },
  },

  {
    "mfussenegger/nvim-dap",
    opts = {},
    config = function() end,
  },

  -- Venv selector
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
    config = function() end,
    setup = function() end,
    opts = {
      name = "venv",
      auto_refresh = true,
    },
    event = "VeryLazy",
    keys = {
      { "<leader>vs", "<cmd>VenvSelect<cr>" },
      { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
    },
  },
}
