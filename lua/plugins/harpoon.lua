-- For ease in file jumping
return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      local harpoon = require("harpoon")

      ---@diagnostic disable-next-line: missing-parameter, missing-fields
      harpoon.setup({})

      -- Telescope Config
      local config = require("telescope.config").values
      local function toggle_telescope(files)
        local paths = {}
        for _, i in ipairs(files.items) do
          table.insert(paths, i.value)
        end

        require("telescope.pickers")
          .new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({ results = paths }),
            previewer = config.file_previewer({}),
            sorter = config.generic_sorter({}),
          })
          :find()
      end

      -- Quick Access Keybinds
      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():add()
      end, { desc = "Add file to harpoon" })

      vim.keymap.set("n", "<leader>1", function()
        harpoon:list():select(1)
      end, { desc = "Harpoon buffer 1" })

      vim.keymap.set("n", "<leader>2", function()
        harpoon:list():select(2)
      end, { desc = "Harpoon buffer 2" })

      vim.keymap.set("n", "<leader>3", function()
        harpoon:list():select(3)
      end, { desc = "Harpoon buffer 3" })

      vim.keymap.set("n", "<leader>4", function()
        harpoon:list():select(4)
      end, { desc = "Harpoon buffer 4" })

      -- Harpoon Keybinds
      vim.keymap.set("n", "<leader>hh", function()
        toggle_telescope(harpoon:list())
      end, { desc = "Show harpoon marks" })

      vim.keymap.set("n", "<leader>ha", function()
        harpoon:list():add()
      end, { desc = "Add file to harpoon" })

      vim.keymap.set("n", "<leader>h1", function()
        harpoon:list():select(1)
      end, { desc = "Harpoon buffer 1" })

      vim.keymap.set("n", "<leader>h2", function()
        harpoon:list():select(2)
      end, { desc = "Harpoon buffer 2" })

      vim.keymap.set("n", "<leader>h3", function()
        harpoon:list():select(3)
      end, { desc = "Harpoon buffer 3" })

      vim.keymap.set("n", "<leader>h4", function()
        harpoon:list():select(4)
      end, { desc = "Harpoon buffer 4" })

      vim.keymap.set("n", "<leader>hd1", function()
        harpoon:list():remove_at(1)
      end, { desc = "Delete harpoon buffer 1" })

      vim.keymap.set("n", "<leader>hd2", function()
        harpoon:list():remove_at(2)
      end, { desc = "Delete harpoon buffer 2" })

      vim.keymap.set("n", "<leader>hd3", function()
        harpoon:list():remove_at(3)
      end, { desc = "Delete harpoon buffer 3" })

      vim.keymap.set("n", "<leader>hd4", function()
        harpoon:list():remove_at(4)
      end, { desc = "Delete harpoon buffer 4" })

      vim.keymap.set("n", "<leader>hdd", function()
        harpoon:list():clear()
      end, { desc = "Delete all harpoon buffers" })
    end,
  },

  -- Add <leader>h descriptions
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>h"] = { name = "+harpoon" },
        ["<leader>hd"] = { name = "+delete" },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
  },
}
