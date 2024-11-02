require("telescope").setup({
  defaults = {
    history = false,
    mappings = {
      i = {
        ["<C-c>"] = "send_to_qflist",
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
  },
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<Leader>E", builtin.git_files, {})
vim.keymap.set("n", "<Leader>b", builtin.buffers, {})
vim.keymap.set("n", "<Leader>e", builtin.find_files, {})
vim.keymap.set("n", "<Leader>g", builtin.live_grep, {})
vim.keymap.set("n", "<Leader>h", builtin.help_tags, {})
