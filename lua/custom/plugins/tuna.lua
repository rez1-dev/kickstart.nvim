-- Install this browser extension to receive test cases, problems, and contests
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
    runner_ui = {
        mappings = { close = { "<esc>", "<C-c>", "q", "Q" } },
        viewer = { width = 0.8, height = 0.8 },
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
        cpp = { exec = 'g++', args = { '-std=c++17', '-O2', '$(FNAME)', '-o', '$(FNOEXT)', '-Wall' } },
    },

    testcases_directory = '.tests',
    testcases_storage = "single_file",
    output_compare_method = "exact",

    template_file = {
        cpp = vim.fn.stdpath 'config' .. '/template/template.cpp',
    },

    keymaps = {
        preset = "<leader>t",
    },
})
