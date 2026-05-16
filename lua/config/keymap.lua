local map = vim.keymap.set

-- general bindings
map("n", "<leader><Tab>", "<cmd>Explore<CR>",    { desc = "Open files" })
map("n", "<Esc>",         "<cmd>nohlsearch<CR>", { desc = "Clear search" })

-- window movements
map("n", "<leader>ww", "<C-w>w", { desc = "Next window" })
map("n", "<leader>wp", "<C-w>W", { desc = "Previous window" })
map("n", "<leader>wc", "<C-w>c", { desc = "Close window" })
map("n", "<leader>wo", "<C-w>o", { desc = "Close other window" })

map("n", "<leader>wv", "<cmd>vsplit<CR>", { desc = "Split vertical" })
map("n", "<leader>wh", "<cmd>split<CR>",  { desc = "Split horizontal" })

