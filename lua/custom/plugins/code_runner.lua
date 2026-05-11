vim.pack.add { 'https://github.com/CRAG666/code_runner.nvim' }

vim.keymap.set('n', '<leader>r', '<cmd>update<bar>RunCode<cr>', { desc = 'Save file and run code' })

require('code_runner').setup {
  mode = 'term', -- float, tab, better_term
  focus = true,
  startinsert = true,
  term = {
    position = 'bot',
    size = math.floor(vim.o.lines * 0.7), -- ~70% of editor height
  },
  filetype = {
    cpp = {
      'cd $dir &&',
      'g++ -std=c++17 $fileName -O2 -Wall -o $fileNameWithoutExt &&',
      '$dir/$fileNameWithoutExt',
    },
  },
}
