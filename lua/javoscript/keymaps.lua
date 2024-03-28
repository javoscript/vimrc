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

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<cr>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<cr>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<cr>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<cr>", opts)

-- Leader keymaps
vim.keymap.set("n", "<Leader>an", "<cmd>tabnew<cr>", opts)
vim.keymap.set("n", "<Leader>ac", "<cmd>tabclose<cr>", opts)
vim.keymap.set("n", "<Leader>ao", "<cmd>tabonly<cr>", opts)

vim.keymap.set(
    "n",
    "<Leader>b",
    "<cmd>lua require('telescope.builtin').buffers({ sort_mru = true, ignore_current_buffer = true })<cr>",
    opts
)
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>")
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>")

vim.keymap.set("n", "<Leader>c", "<cmd>bd<cr>", opts)
vim.keymap.set("n", "<Leader>C", "<cmd>:w <bar> %bd <bar> e# <bar> bd# <cr><cr>", opts) -- close all buffers except current one
vim.keymap.set("n", "<Leader>w", "<cmd>w!<cr>", opts)

-- vim.keymap.set("n", "<Leader>e", "<cmd>NvimTreeToggle<cr>", opts)
vim.keymap.set("n", "<Leader>e", "<cmd>lua require('lir.float').toggle()<cr>", opts)
-- vim.keymap.set("n", "<Leader>-", "<cmd>:e %:p:h<cr>", opts)
-- vim.keymap.set("n", "<Leader>E", "<cmd>:e.<cr>", opts)
vim.keymap.set("n", "<Leader>-", "<cmd>lua require('lir.float').toggle(vim.fn.expand('%:p:h'))<cr>", opts)
vim.keymap.set("n", "<Leader>E", "<cmd>lua require('lir.float').init('.')<cr>", opts)

vim.keymap.set("n", "<Leader>gg", "<cmd>Neogit<cr>", opts)
vim.keymap.set("n", "<Leader>gc", "<cmd>Neogit commit<cr>", opts)
vim.keymap.set("n", "<Leader>gh", "<cmd>DiffviewFileHistory %<cr>", opts)

vim.keymap.set("n", "<Leader>h", "<cmd>nohlsearch<cr>", opts) -- remove search highlight

vim.keymap.set("n", "<Leader>Hx", "<plug>RestNvim", opts)
vim.keymap.set("n", "<Leader>Hp", "<plug>RestNvimPreview", opts)
vim.keymap.set("n", "<Leader>Hl", "<plug>RestNvimLast", opts)

vim.keymap.set("n", "<Leader> ", "<cmd>Telescope find_files<cr>", opts)
vim.keymap.set("n", "<Leader>f", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opts)
vim.keymap.set("n", "<Leader>F", "<cmd>Telescope live_grep theme=ivy<cr>", opts)

vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
vim.keymap.set("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
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
vim.keymap.set("n", "<Leader>lw", "<cmd>Telescope diagnostics<cr>", opts)

vim.keymap.set("n", "<Leader>sc", "<cmd>Telescope colorscheme<cr>", opts)
vim.keymap.set("n", "<Leader>sg", "<cmd>Telescope git_status<cr>", opts)
vim.keymap.set("n", "<Leader>sh", "<cmd>Telescope help_tags<cr>", opts)
vim.keymap.set("n", "<Leader>sk", "<cmd>Telescope keymaps<cr>", opts)
vim.keymap.set("n", "<Leader>sm", "<cmd>Telescope man_pages<cr>", opts)
vim.keymap.set("n", "<Leader>sq", "<cmd>Telescope quickfix<cr>", opts)
vim.keymap.set("n", "<Leader>sC", "<cmd>Telescope commands<cr>", opts)

vim.keymap.set("n", "<Leader>ql", "<cmd>TodoQuickFix<cr>", opts)
vim.keymap.set("n", "<Leader>qq", "<cmd>cn<cr>", opts)
vim.keymap.set("n", "<Leader>qp", "<cmd>cp<cr>", opts)

vim.keymap.set("n", "<Leader>ta", "<cmd>TestSuite<cr>", opts)
vim.keymap.set("n", "<Leader>tf", "<cmd>TestFile<cr>", opts)
vim.keymap.set("n", "<Leader>tn", "<cmd>TestNearest<cr>", opts)
vim.keymap.set("n", "<Leader>tl", "<cmd>TestLast<cr>", opts)

vim.keymap.set("n", "<Leader>dt", "<cmd>DBUIToggle<cr>", opts)

vim.keymap.set("n", "<Leader>z", "<cmd>ZenMode<cr>", opts)
vim.keymap.set("n", "<c-w>z", "<cmd>lua require('zen-mode').toggle({window={width=1.0}})<cr>", opts)

-- Stay in visual mode when indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv")

-- Replace without yanking
vim.keymap.set("v", "p", '"_dP', opts)

vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

vim.keymap.set("c", "<C-j>", "<C-n>")
vim.keymap.set("c", "<C-k>", "<C-p>")
