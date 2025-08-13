vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
keymap.set("n", "<leader>so", "<cmd>only<CR>", { desc = "Shows only current split" }) -- shows only currnt split

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
keymap.set("n", "<leader>a", "ggVG", { desc = "Select whole Document" })
keymap.set("i", "<C-y>", "<Plug>(emmet-expand-abbr)", { desc = "emmet" })

local opts = { noremap = true, silent = true }
-- Quit and close all buffers
keymap.set("n", "<C-q>", ":qa!<CR>", opts)

-- Resize windows
keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Indent text in visual and normal mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)
keymap.set("n", "<", "<gv", opts)
keymap.set("n", ">", ">gv", opts)

-- Move lines in normal mode
keymap.set("n", "<A-j>", ":m .+1<CR>==", opts)
keymap.set("n", "<A-k>", ":m .-2<CR>==", opts)
keymap.set("n", "p", '"_dP', opts)
keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)
keymap.set("v", "p", '"_dP', opts)

-- Move selected lines in visual mode
keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Command-line navigation to beginning and end of line
keymap.set("c", "<C-a>", "<Home>", opts)
keymap.set("c", "<C-e>", "<End>", opts)

keymap.set("n", "<leader>w", "<cmd>w!<CR>", opts)
keymap.set("n", "<leader>q", "<cmd>q!<CR>", opts)
keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)
keymap.set("n", "<leader>R", "<cmd>RunCode<CR>", opts)
keymap.set("n", "<leader>C", "<cmd>RunClose<CR>", opts)
keymap.set("n", "<leader>R", "<cmd>RunCode<CR>", opts)
keymap.set("n", "<leader>C", "<cmd>RunClose<CR>", opts)

keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)
