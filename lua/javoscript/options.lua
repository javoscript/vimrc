vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
-- vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0
vim.opt.fileencoding = "utf-8"
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
-- vim.opt.pumheight = 20
vim.opt.showmode = false
vim.opt.showtabline = 1
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
-- vim.opt.timeoutlen = 100
vim.opt.undofile = true
-- vim.opt.updatetime = 300
vim.opt.writebackup = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 4
vim.opt.guifont = "monospace:h17"
vim.opt.title = false
vim.opt.wildmode = "longest:full,full"
vim.opt.list = true
vim.opt.listchars = {
    tab = ">•",
    trail = "•",
}
-- vim.opt.lazyredraw = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd("set whichwrap+=<,>,[,],h,l")

vim.opt.shortmess:append("c")
-- vim.opt.iskeyword:append("-")
vim.opt.formatoptions:remove({ "c", "r", "o" })
