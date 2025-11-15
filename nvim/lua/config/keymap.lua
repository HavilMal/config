vim.g.mapleader = " "

vim.api.nvim_set_option("clipboard","unnamed")

vim.keymap.set({"n", "v"}, "L", "$")
vim.keymap.set({"n", "v"}, "H", "^")

if vim.g.vscode then
	vim.keymap.set("n", "<C-L>", function()
		require("vscode").call("workbench.action.nextEditor")
	end, {silent = true})
	vim.keymap.set("n", "<C-H>", function()
		require("vscode").call("workbench.action.previousEditor")
	end, {silent = true})
end

-- using oil
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "File Explorer" })

vim.keymap.set('n', '<leader>gg', "<cmd>LazyGit<cr>", { desc = "Lazy Git" })
vim.keymap.set('n', '<leader>ss', "<cmd>write<cr>", { desc = "Write File" })
vim.keymap.set('n', '<leader>gg', "<cmd>LazyGit<cr>", { desc = "Lazy Git" })


