vim.g.mapleader = " "

vim.api.nvim_set_option("clipboard","unnamed")

vim.keymap.set({"n", "v"}, "L", "$")
vim.keymap.set({"n", "v"}, "H", "^")
vim.keymap.set("n", "<leader>E", vim.cmd.Ex, { desc = "File Explorer" })

vim.keymap.set('n', '<leader>gg', "<cmd>LazyGit<cr>", { desc = "Lazy Git" })
vim.keymap.set('n', '<leader>ss', "<cmd>write<cr>", { desc = "Write File" })
vim.keymap.set('n', '<leader>gg', "<cmd>LazyGit<cr>", { desc = "Lazy Git" })


