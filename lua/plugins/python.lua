-- Auto Enable venv selector
vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Auto Select venv on NvimEnter",
  pattern = "*",
  callback = function()
    require("venv-selector").retrieve_from_cache()
  end,
  once = true,
})

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

  -- Venv selector
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
    event = "VeryLazy",
    opts = function(_, opts)
      if require("lazyvim.util").has("nvim-dap-python") then
        opts.dap_enabled = true
      end
      return vim.tbl_deep_extend("force", opts, {
        name = {
          "venv",
          ".venv",
          "env",
          ".env",
        },
      })
    end,
  },
}
