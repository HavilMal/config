require('telescope').setup {
    defaults = {
        layout_strategy = 'vertical',
    },
}

local tele_built = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', tele_built.find_files, { desc = "Find Files" })
vim.keymap.set('n', '<leader>fg', tele_built.live_grep, { desc = "Grep" })
vim.keymap.set('n', '<leader>fb', tele_built.buffers, { desc = "Find Buffers" })
vim.keymap.set('n', '<leader>fh', tele_built.help_tags, { desc = "Find Help" })
vim.keymap.set('n', '<leader>fc', tele_built.command_history, { desc = "COMMAND HISTORY" })
-- vim.keymap.set('n', '<leader>e', tele_built.diagnostics, { desc = "Diagnostics" })
vim.keymap.set('n', '<leader>gs', tele_built.git_status, { desc = "Git Status" })
vim.keymap.set('n', '<leader>t', tele_built.builtin, { desc = "Telescope" })

