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

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Leader keymaps
vim.keymap.set("n", "<Leader>an", "<cmd>tabnew<CR>", opts)
vim.keymap.set("n", "<Leader>ac", "<cmd>tabclose<CR>", opts)
vim.keymap.set("n", "<Leader>ao", "<cmd>tabonly<CR>", opts)

vim.keymap.set(
    "n",
    "<Leader>b",
    "<cmd>lua require('telescope.builtin').buffers({ sort_mru = true, ignore_current_buffer = true })<cr>",
    opts
)
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<CR>")
vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>")

vim.keymap.set("n", "<Leader>c", "<cmd>bd<CR>", opts)
vim.keymap.set("n", "<Leader>C", "<cmd>:w <bar> %bd <bar> e# <bar> bd# <CR><CR>", opts) -- close all buffers except current one
vim.keymap.set("n", "<Leader>w", "<cmd>w!<CR>", opts)

-- vim.keymap.set("n", "<Leader>e", "<cmd>NvimTreeToggle<CR>", opts)
vim.keymap.set("n", "<Leader>e", "<cmd>lua require('lir.float').toggle()<CR>", opts)
vim.keymap.set("n", "<Leader>-", "<cmd>:e %:p:h<CR>", opts)
vim.keymap.set("n", "<Leader>E", "<cmd>:e.<CR>", opts)

vim.keymap.set("n", "<Leader>h", "<cmd>nohlsearch<CR>", opts) -- remove search highlight

vim.keymap.set("n", "<Leader>Hx", "<plug>RestNvim", opts)
vim.keymap.set("n", "<Leader>Hp", "<plug>RestNvimPreview", opts)
vim.keymap.set("n", "<Leader>Hl", "<plug>RestNvimLast", opts)

vim.keymap.set("n", "<Leader> ", "<cmd>Telescope find_files<CR>", opts)
vim.keymap.set("n", "<Leader>f", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opts)
vim.keymap.set("n", "<Leader>F", "<cmd>Telescope live_grep theme=ivy<CR>", opts)

vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
vim.keymap.set("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

vim.keymap.set("n", "<Leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
vim.keymap.set("n", "<Leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", opts)
vim.keymap.set("n", "<Leader>le", "<cmd>lua vim.diagnostic.open_float(0, {scope='line'})<cr>", opts)
vim.keymap.set("n", "<Leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", opts)
vim.keymap.set("n", "<Leader>li", "<cmd>LspInfo<cr>", opts)
vim.keymap.set("n", "<Leader>lm", "<cmd>Mason<cr>", opts)
vim.keymap.set("n", "<Leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
vim.keymap.set("n", "<Leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", opts)
vim.keymap.set("n", "<Leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", opts)
vim.keymap.set("n", "<Leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
vim.keymap.set("n", "<Leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", opts)
vim.keymap.set("n", "<Leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", opts)
vim.keymap.set("n", "<Leader>lT", "<cmd>LspStop<cr>", opts)
vim.keymap.set("n", "<Leader>lw", "<cmd>Telescope diagnostics<cr>", opts)

vim.keymap.set("n", "<Leader>on", "<cmd>ObsidianNew<cr>", opts)
vim.keymap.set("n", "<Leader>oo", "<cmd>ObsidianToday<cr>", opts)
vim.keymap.set("n", "<Leader>os", "<cmd>ObsidianSearch<cr>", opts)
vim.keymap.set("n", "<Leader>ot", ":lua require('obsidian').util.toggle_checkbox()<cr>", opts)

vim.keymap.set("n", "<Leader>sc", "<cmd>Telescope colorscheme<CR>", opts)
vim.keymap.set("n", "<Leader>sh", "<cmd>Telescope help_tags<CR>", opts)
vim.keymap.set("n", "<Leader>sk", "<cmd>Telescope keymaps<CR>", opts)
vim.keymap.set("n", "<Leader>sm", "<cmd>Telescope man_pages<CR>", opts)
vim.keymap.set("n", "<Leader>sq", "<cmd>Telescope quickfix<CR>", opts)
vim.keymap.set("n", "<Leader>sC", "<cmd>Telescope commands<CR>", opts)

vim.keymap.set("n", "<Leader>ql", "<cmd>TodoQuickFix<CR>", opts)
vim.keymap.set("n", "<Leader>qq", "<cmd>cn<CR>", opts)
vim.keymap.set("n", "<Leader>qp", "<cmd>cp<CR>", opts)

vim.keymap.set("n", "<Leader>ta", "<cmd>TestSuite<CR>", opts)
vim.keymap.set("n", "<Leader>tf", "<cmd>TestFile<CR>", opts)
vim.keymap.set("n", "<Leader>tn", "<cmd>TestNearest<CR>", opts)
vim.keymap.set("n", "<Leader>tl", "<cmd>TestLast<CR>", opts)

vim.keymap.set("n", "<Leader>dt", "<cmd>DBUIToggle<CR>", opts)

vim.keymap.set("n", "<Leader>z", "<cmd>ZenMode<CR>", opts)

-- Stay in visual mode when indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Replace without yanking
vim.keymap.set("v", "p", '"_dP', opts)

vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

vim.keymap.set("c", "<C-j>", "<C-n>")
vim.keymap.set("c", "<C-k>", "<C-p>")
