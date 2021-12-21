local opts = {
    autochdir = true,
    backup = false,
    clipboard = "unnamedplus",
    cmdheight = 1,
    completeopt = { "menuone", "noselect" },
    conceallevel = 0,
    expandtab = true,
    fileencoding = "utf-8",
    guicursor = "i:block",
    hlsearch = true,
    ignorecase = true,
    mouse = "a",
    number = true,
    numberwidth = 4,
    pumheight = 10,
    relativenumber = false,
    scrolloff = 8,
    shiftwidth = 4,
    showmode = false,
    showtabline = 2,
    sidescrolloff = 8,
    signcolumn = "yes",
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    tabstop = 4,
    timeoutlen = 1000,
    undofile = true,
    updatetime = 300,
    wrap = false
}

for key, value in pairs(opts) do
    vim.opt[key] = value
end

vim.opt.shortmess:append "c"

vim.cmd "set formatoptions-=jql"
vim.cmd "set iskeyword+=-"
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd "syntax enable"
