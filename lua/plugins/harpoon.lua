return {
  {
    "ThePrimeagen/harpoon",
    event = "BufRead",
    branch = "harpoon2",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      local status_ok, harpoon = pcall(require, "harpoon")
      if not status_ok then
        return
      end

      harpoon.setup()

      vim.keymap.set("n", "<leader>fm", "<cmd>Telescope harpoon marks<cr>", { desc = "Telescope Harpoon Marks" })
      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():append()
      end)
      vim.keymap.set("n", "<C-e>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      vim.keymap.set("n", "<leader>hh", function()
        harpoon:list():select(1)
      end)
      vim.keymap.set("n", "<leader>ht", function()
        harpoon:list():select(2)
      end)
      vim.keymap.set("n", "<leader>hn", function()
        harpoon:list():select(3)
      end)
      vim.keymap.set("n", "<leader>hs", function()
        harpoon:list():select(4)
      end)

      local tele_status_ok, telescope = pcall(require, "telescope")
      if not tele_status_ok then
        return
      end

      telescope.load_extension("harpoon")
    end,
  },
}
