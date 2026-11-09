vim.pack.add { 'https://github.com/wr9dg17/essential-term.nvim' }

vim.keymap.set({ 'n', 't' }, '<C-`>', '<cmd>EssentialTermToggle<cr>', { desc = 'Toggle terminal' })
vim.keymap.set({ 'n', 't' }, '<C-\\>', '<cmd>EssentialTermToggle<cr>', { desc = 'Toggle terminal' })
vim.keymap.set({ 'n', 't' }, '<C-t>', '<cmd>EssentialTermNew<cr>', { desc = 'New terminal session' })
vim.keymap.set({ 'n', 't' }, '<C-x>', '<cmd>EssentialTermClose<cr>', { desc = 'Close terminal session' })
vim.keymap.set({ 'n', 't' }, '<C-r>', '<cmd>EssentialTermRename<cr>', { desc = 'Rename terminal session' })
vim.keymap.set('t', '<C-p>', '<cmd>EssentialTermPrev<cr>', { desc = 'Previous terminal' })
vim.keymap.set('t', '<C-n>', '<cmd>EssentialTermNext<cr>', { desc = 'Next terminal' })

require('essential-term').setup {
  sidebar_width = 22, -- width of the session-picker sidebar (horizontal mode)
}
