vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true, nowait = true }
local term_opts = { silent = true }

-- One line only when text is wrapped
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

vim.keymap.set("n", "n", "nzz", opts)
vim.keymap.set("n", "N", "Nzz", opts)
vim.keymap.set("n", "*", "*zz", opts)
vim.keymap.set("n", "#", "#zz", opts)

-- Keep the cursor position when yanking a visual selection
vim.keymap.set("v", "y", "myy`y", opts)

vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

vim.keymap.set("n", "<M-1>", "1gt", opts)
vim.keymap.set("n", "<M-2>", "2gt", opts)
vim.keymap.set("n", "<M-3>", "3gt", opts)
vim.keymap.set("n", "<M-4>", "4gt", opts)
vim.keymap.set("n", "<M-5>", "5gt", opts)

vim.keymap.set("n", "<C-p>", "<C-^>", opts) -- alternative file (usually prev)

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<cr>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<cr>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<cr>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<cr>", opts)

-- Leader keymaps
vim.keymap.set("n", "<Leader>an", "<cmd>tabnew<cr>", opts)
vim.keymap.set("n", "<Leader>ac", "<cmd>tabclose<cr>", opts)
vim.keymap.set("n", "<Leader>ah", "<cmd>tabm -1<cr>", opts)
vim.keymap.set("n", "<Leader>al", "<cmd>tabm +1<cr>", opts)
vim.keymap.set("n", "<Leader>ao", "<cmd>tabonly<cr>", opts)

vim.keymap.set("n", "<Leader>aC", "<cmd>AvanteClear<cr>", opts)

vim.keymap.set(
    "n",
    "<Leader>b",
    "<cmd>lua require('telescope.builtin').buffers({ sort_mru = true, ignore_current_buffer = true })<cr>",
    opts
)

-- vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>")
-- vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>")

-- vim.keymap.set("n", "<Leader>c", "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>", opts)
vim.keymap.set("n", "<Leader>c", "<cmd>bd<CR>", opts)
vim.keymap.set("n", "<Leader>C", "<cmd>:w <bar> %bd <bar> e# <bar> bd# <cr><cr>", opts) -- close all buffers except current one
vim.keymap.set("n", "<Leader>w", "<cmd>w!<cr>", opts)

vim.keymap.set("n", "<Leader>e", "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0), false)<cr>", opts)
vim.keymap.set("n", "<Leader>E", "<cmd>lua MiniFiles.open(vim.uv.cwd(), false)<cr>", opts)

vim.keymap.set("n", "<Leader>gb", "<cmd>Gitsigns blame_line<cr>", opts)
vim.keymap.set("n", "<Leader>gB", "<cmd>Gitsigns blame<cr>", opts)
vim.keymap.set("n", "<Leader>gw", "<cmd>Gitsigns preview_hunk<cr>", opts)
vim.keymap.set("n", "<Leader>gn", "<cmd>Gitsigns next_hunk<cr>", opts)
vim.keymap.set("n", "<Leader>gp", "<cmd>Gitsigns prev_hunk<cr>", opts)
vim.keymap.set("n", "<Leader>gu", "<cmd>Gitsigns reset_hunk<cr>", opts)
vim.keymap.set("n", "<Leader>gC", "<cmd>DiffviewClose<cr>", opts)
vim.keymap.set("n", "<Leader>gd", "<cmd>DiffviewOpen --selected-file<cr>", opts)
vim.keymap.set("n", "<Leader>gg", "<cmd>Neogit<cr>", opts)
vim.keymap.set("n", "<Leader>gh", "<cmd>DiffviewFileHistory %<cr>", opts)

vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)")

vim.keymap.set("n", "<leader>hh", function()
    local harpoon = require("harpoon")
    harpoon.ui:toggle_quick_menu(harpoon:list())
end)
vim.keymap.set("n", "<leader>ha", function()
    require("harpoon"):list():add()
end)
vim.keymap.set("n", "<leader>hn", function()
    require("harpoon"):list():next()
end)
vim.keymap.set("n", "<leader>hp", function()
    require("harpoon"):list():prev()
end)
vim.keymap.set("n", "<leader>hc", function()
    require("harpoon"):list():clear()
end)

-- utils
vim.keymap.set("n", "<Leader>ybp", '<cmd>let @+ = expand("%")<cr>', opts)
vim.keymap.set("n", "<Leader>jq", "<cmd>tab terminal pbpaste | ijq<cr>", opts)
vim.keymap.set(
    "v",
    "<Leader>jq",
    -- yank to the "j" register
    -- write to tmp file
    -- and open a terminal in a new tab with the ijq process
    '"jy <cmd>call writefile(getreg("j", 1, 1), "/tmp/nvim-ijq.txt")<cr> <bar> <cmd>tab terminal ijq /tmp/nvim-ijq.txt<cr>',
    opts
)
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<Leader>dt", "<cmd>DBUIToggle<cr>", opts)
vim.keymap.set("n", "<Leader>z", "<cmd>ZenMode<cr>", opts)
vim.keymap.set("n", "<c-w>z", "<cmd>lua require('zen-mode').toggle({window={width=1.0}})<cr>", opts)

-- telescope
vim.keymap.set("n", "<Leader> ", "<cmd>Telescope find_files<cr>", opts)
vim.keymap.set("n", "<Leader>f", "<cmd>Telescope grep_string<cr>", opts)
vim.keymap.set("n", "<Leader>F", "<cmd>Telescope live_grep<cr>", opts)

-- lsp
-- vim.keymap.set("n", "gD", ":vsplit | lua vim.lsp.buf.definition()<CR>", opts)
vim.keymap.set("n", "gD", "<cmd>lua require('telescope.builtin').lsp_definitions({ jump_type = 'vsplit' })<cr>", opts)
-- vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
vim.keymap.set("n", "gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", opts)
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
vim.keymap.set("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
vim.keymap.set("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", opts)
-- vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)

vim.keymap.set("n", "<Leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
vim.keymap.set("n", "<Leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", opts)
vim.keymap.set("n", "<Leader>le", "<cmd>lua vim.diagnostic.open_float(0, {scope='line'})<cr>", opts)
vim.keymap.set("n", "<Leader>lf", "<cmd>lua require('conform').format({ async = true, lsp_fallback = true})<cr>", opts)
vim.keymap.set("n", "<Leader>li", "<cmd>LspInfo<cr>", opts)
vim.keymap.set("n", "<Leader>lm", "<cmd>Mason<cr>", opts)
vim.keymap.set("n", "<Leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", opts)
vim.keymap.set("n", "<Leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", opts)
vim.keymap.set("n", "<Leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", opts)
vim.keymap.set("n", "<Leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
vim.keymap.set("n", "<Leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", opts)
vim.keymap.set("n", "<Leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", opts)
vim.keymap.set("n", "<Leader>lT", "<cmd>LspStop<cr>", opts)
vim.keymap.set("n", "<Leader>lR", "<cmd>LspRestart<cr>", opts)
vim.keymap.set("n", "<Leader>lw", "<cmd>Telescope diagnostics<cr>", opts)

-- opts
vim.keymap.set("n", "<Leader>ob", "<cmd>Gitsigns toggle_current_line_blame<cr>", opts)
vim.keymap.set("n", "<Leader>oc", "<cmd>TSContextToggle<cr>", opts)
vim.keymap.set("n", "<Leader>oh", "<cmd>nohlsearch<cr>", opts)
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>", opts)
vim.keymap.set("n", "<Leader>oi", "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>", opts)
vim.keymap.set("n", "<Leader>ol", "<cmd>IBLToggle<cr>", opts)
vim.keymap.set("n", "<Leader>on", "<cmd>set number! relativenumber!<cr>", opts)

-- lazy
vim.keymap.set("n", "<Leader>pp", "<cmd>Lazy<cr>", opts)
vim.keymap.set("n", "<Leader>ps", "<cmd>Lazy sync<cr>", opts)

-- telescope
vim.keymap.set("n", "<Leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opts)
vim.keymap.set("n", "<Leader>sC", "<cmd>Telescope colorscheme<cr>", opts)
vim.keymap.set("n", "<Leader>sc", "<cmd>Telescope commands<cr>", opts)
vim.keymap.set("n", "<Leader>sg", "<cmd>Telescope git_status<cr>", opts)
vim.keymap.set("n", "<Leader>sGb", "<cmd>Telescope git_branches<cr>", opts)
vim.keymap.set("n", "<Leader>sGc", "<cmd>Telescope git_commits<cr>", opts)
vim.keymap.set("n", "<Leader>sGs", "<cmd>Telescope git_stash<cr>", opts)
vim.keymap.set("n", "<Leader>sh", "<cmd>Telescope help_tags<cr>", opts)
vim.keymap.set("n", "<Leader>sk", "<cmd>Telescope keymaps<cr>", opts)
vim.keymap.set("n", "<Leader>sm", "<cmd>Telescope man_pages<cr>", opts)
vim.keymap.set("n", "<Leader>so", "<cmd>Telescope vim_options<cr>", opts)
vim.keymap.set("n", "<Leader>sq", "<cmd>Telescope quickfix<cr>", opts)
vim.keymap.set("n", "<Leader>sl", "<cmd>Telescope quickfixhistory<cr>", opts)
vim.keymap.set("n", "<Leader>sr", "<cmd>Telescope resume<cr>", opts)
vim.keymap.set("n", "<Leader>sR", "<cmd>Telescope registers<cr>", opts)

-- quickfix list
vim.keymap.set("n", "<Leader>qc", "<cmd>cclose<cr>", opts)
vim.keymap.set("n", "<Leader>ql", "<cmd>TodoQuickFix<cr>", opts)
vim.keymap.set("n", "<Leader>qn", "<cmd>cn<cr>", opts) -- next item in quickfix list
vim.keymap.set("n", "<Leader>qo", "<cmd>copen<cr>", opts)
vim.keymap.set("n", "<Leader>qp", "<cmd>cp<cr>", opts) -- prev item in quickfix list

-- tests
vim.keymap.set("n", "<Leader>ta", "<cmd>TestSuite<cr>", opts)
vim.keymap.set("n", "<Leader>tf", "<cmd>TestFile<cr>", opts)
vim.keymap.set("n", "<Leader>tn", "<cmd>TestNearest<cr>", opts)
vim.keymap.set("n", "<Leader>tl", "<cmd>TestLast<cr>", opts)

-- "artisan tinker"
vim.keymap.set("n", "<Leader>Li", "<cmd>vsplit term://php artisan tinker<cr>i", opts)

-- terminal
vim.keymap.set("n", "<Leader>tT", "<cmd>tab term<cr>", vim.tbl_extend("keep", opts, { desc = "Open Terminal" }))

-- Stay in visual mode when indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv")

-- Replace without yanking
vim.keymap.set("v", "p", '"_dP', opts)

-- better split navigation in term mode
vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
vim.keymap.set("t", "<C-q>", "<C-\\><C-n>", term_opts)

-- better option selection in option lists
vim.keymap.set("c", "<C-j>", "<C-n>")
vim.keymap.set("c", "<C-k>", "<C-p>")

vim.keymap.set("n", "<Leader>gr", "<cmd>CellularAutomaton make_it_rain<cr>")
vim.keymap.set("n", "<Leader>gl", "<cmd>CellularAutomaton game_of_life<cr>")
