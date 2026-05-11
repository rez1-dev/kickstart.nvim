-- NOTE: Install this browser extension to receive test cases and problems
-- https://github.com/jmerle/competitive-companion

vim.pack.add { 'https://github.com/FrancescoDerme/tuna.nvim' }

vim.keymap.set('n', '<leader>a', '<cmd>Tuna run<cr>', { desc = 'Tuna.nvim' })
vim.keymap.set('n', '<leader>A', '<cmd>Tuna download persistently<cr>', { desc = 'Tuna.nvim Download Persistently' })

---@diagnostic disable: missing-fields
require("tuna").setup({
    switch_window_keys = { "<M-h>", "<M-j>", "<M-k>", "<M-l>" },
    editor_ui = {
        normal_mode_mappings = { switch_window = { "<M-h>", "<M-j>", "<M-k>", "<M-l>" } },
        insert_mode_mappings = { switch_window = { "<M-h>", "<M-j>", "<M-k>", "<M-l>" } },
    },
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
                '-Wall',
                '$(FNAME)',
                '-o',
                '$(FNOEXT)',
            }
        },
    },

    testcases_directory = '.tests',
    testcases_storage = "single_file",
    output_compare_method = "exact",

    template_file = {
        cpp = vim.fn.stdpath 'config' .. '/algo/tuna.cpp',
    },

    -- evaluate_template_modifiers = true,

    template_cursor = {
        pattern = "^void solve",
        offset = 1
    },

    library = {
        path = vim.fn.stdpath 'config' .. '/algo',
    },

    keymaps = {
        preset = "<leader>t",
    },
})
