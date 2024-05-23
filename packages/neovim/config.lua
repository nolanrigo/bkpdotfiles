vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.termguicolors = true -- NOTE: You should make sure your terminal supports this
vim.o.number = true                                     -- show line number
vim.o.relativenumber = true                             -- relative line numbers
vim.o.colorcolumn = 80                                  -- show a colorcolumn at 80 character
vim.o.paste = false                                     -- simplify paste from clipboarrd
vim.o.clipboard = "unnamedplus"                         -- sync OS & vim clipboards
vim.o.shiftwidth = 2                                    -- 2 spaces
vim.o.list = true                                       -- show hiddenchars
vim.o.listchars = "tab:▸▸,trail:·"                      -- select hiddenchars to show and how to show them
vim.o.mouse = "a"                                       -- activate mouse
vim.o.encoding = "utf-8"                                -- default encode file to utf-8
vim.o.backspace = "indent,eol,start"                    -- how backspacing works
vim.o.hlsearch = true                                   -- activate search highlight
  vim.keymap.set("n", "<leader>sx", vim.cmd.nohlsearch) -- clear search highlight
vim.o.errorbells = false                                -- disable error bells
vim.o.splitbelow = true                                 -- the new split window will be below
vim.o.splitright = true                                 -- the new split window will be right
vim.o.autoread = true                                   -- automatically read file that has been edited outside of vim
vim.o.showmode = false                                  -- disable "-- VISUAL" "--INSERT" <-- as we will use lualine
vim.o.laststatus = 2                                    -- influence when the last window will have a status line (2 = always)
vim.o.fileformats = "unix,dos"                          -- use unix end of lines
vim.o.incsearch = true                                  -- show pattern on search command
vim.o.ignorecase = true                                 -- ignore case on search
vim.o.smartcase = true                                  -- when the search contains a caps, the search become case sensitive
vim.o.autoindent = true                                 -- new line indentation follow the previous
vim.o.breakindent = true
-- DEPRECATED: vim.o.gdefault = true
vim.o.magic = true                                      -- change special characters that can be use in search
vim.o.wrap = false                                      -- don't wrap the text
vim.o.hidden = true
vim.o.cmdheight = 1
vim.o.scrolloff = 8                                     -- keep 8 character space when I scroll
vim.o.signcolumn = "yes"                                -- always show signcolumn
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.opt.shortmess:append { c = true }
vim.o.completeopt = "menuone,noselect"                  -- Set completeopt to have a better completion experience

-- Tabs -> 2 spaces
vim.o.expandtab = true                                  -- tab => spaces
vim.o.smarttab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

-- Swap
vim.o.swapfile = false                                  -- disable swapfile 🤮
vim.o.backup = false                                    -- don't backup the file when it got overwritten
vim.o.writebackup = true                                -- but do a temporary backup that will be delete after
vim.o.undofile = true                                   -- save undotree into a file
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"    -- files are save in home directory

-- Buffer navigation
vim.keymap.set("n", "<C-K>", vim.cmd.bprevious, {})
vim.keymap.set("n", "<C-J>", vim.cmd.bnext, {})
vim.keymap.set("n", "<C-L>", vim.cmd.tabnext, {})
vim.keymap.set("n", "<C-H>", vim.cmd.tabprevious, {})
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>df', vim.cmd.EslintFixAll, { desc = "[D]iagnostic auto[F]ix" })

vim.keymap.set("n", "(", ")", { noremap = true })
vim.keymap.set("n", ")", "(", { noremap = true })
vim.keymap.set("v", "(", ")", { noremap = true })
vim.keymap.set("v", ")", "(", { noremap = true })

-- [[ Basic Keymaps ]]

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Move code
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "p", "\"_dP")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
