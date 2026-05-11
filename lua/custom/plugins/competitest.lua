-- Install this browser extension to receive test cases, problems, and contests
-- https://github.com/jmerle/competitive-companion

vim.pack.add { 'https://github.com/xeluxee/competitest.nvim' }

vim.keymap.set('n', '<leader>a', '<cmd>CompetiTest run<cr>', { desc = 'CompetiTest.nvim' })
vim.keymap.set('n', '<leader>A', '<cmd>CompetiTest receive persistently<cr>', { desc = 'CompetiTest.nvim Receive Persistently' })

---@diagnostic disable: missing-fields
require('competitest').setup {
  editor_ui = {
    show_nu = false,
  },
  runner_ui = {
    show_nu = false,
    mappings = {
      run_again = 'r',
      run_all_again = 'R',
    },
    viewer = {
      show_nu = false,
    },
  },
  popup_ui = {
    total_width = 0.9,
    total_height = 0.9,
    layout = {
      { 1, { { 1, 'tc' }, { 1, 'si' }, } },
      { 1, 'so' },
      { 1, { { 9, 'eo' }, { 1, 'se' }, } },
    },
  },
  compile_command = {
    cpp = { exec = 'g++', args = { '-std=c++17', '-O2', '$(FNAME)', '-o', '$(FNOEXT)', '-Wall' } },
  },
  run_command = {
    cpp = { exec = './$(FNOEXT)' },
  },
  template_file = {
    cpp = vim.fn.stdpath 'config' .. '/template/template.cpp',
  },
  -- start_receiving_persistently_on_setup = true,
  -- receive_print_message = false,
  received_problems_prompt_path = false,
  testcases_directory = '.tests',
  testcases_use_single_file = true,
}
