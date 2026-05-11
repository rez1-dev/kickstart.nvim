-- NOTE: Install this browser extension to receive test cases and problems
-- https://github.com/jmerle/competitive-companion

vim.pack.add { 'https://github.com/FrancescoDerme/tuna.nvim' }

vim.keymap.set('n', '<leader>a', '<cmd>Tuna run<cr>', { desc = 'Tuna.nvim' })
vim.keymap.set('n', '<leader>A', '<cmd>Tuna download persistently<cr>', { desc = 'Tuna.nvim Download Persistently' })

---@diagnostic disable: missing-fields
require("tuna").setup({
    switch_window_keys = { "<M-h>", "<M-j>", "<M-k>", "<M-l>" },
    popup_ui = {
        total_width = 0.9,
        total_height = 0.9,
        layout = {
            { 1, { { 1, "tc" }, { 1, "si" } } },
            { 1, "so" },
            { 1, "eo" },
        },
    },

    compile_command = {
        cpp = {
            exec = 'g++',
            args = {
                '-std=c++17',
                '-O2',
                '$(FNAME)',
                '-o',
                '$(FNOEXT)',
                '-Wall',
            }
        },
    },

    testcases_directory = '.tests',
    testcases_storage = "single_file",
    output_compare_method = "exact",

    scaffold = {
        templates = {
            solution = { vim.fn.stdpath 'config' .. '/algo/tuna.cpp' },
        },
    },

    library = {
        path = vim.fn.stdpath 'config' .. '/algo',
    },

    recent = {
        ignored_directories = { vim.fn.stdpath 'config' .. '/algo' },
    },

    keymaps = { preset = "<leader>t", },
})
