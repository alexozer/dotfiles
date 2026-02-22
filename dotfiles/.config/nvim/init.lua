-- Appearance
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.signcolumn = 'yes'
vim.opt.showmode = false
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = 'split'
vim.opt.hlsearch = false

-- Indent
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Behavior
vim.opt.wrap = false
vim.opt.mouse = 'a'
vim.opt.mousescroll = 'ver:3,hor:0'
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.confirm = true
vim.opt.autowriteall = true
vim.opt.autoread = true

--
-- Mappings
--

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- My classic mappings
vim.keymap.set({'n', 'v'}, ';', ':')
vim.keymap.set({'n', 'v'}, ':', ';')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set({'n', 'v'}, 'H', '^')
vim.keymap.set({'n', 'v'}, 'L', '$')
vim.keymap.set('i', '<c-bs>', '<c-w>')
vim.keymap.set('i', '<a-bs>', '<c-w>')

-- Window commands
vim.keymap.set('n', '<Leader>wh', '<C-w><C-h>')
vim.keymap.set('n', '<Leader>wl', '<C-w><C-l>')
vim.keymap.set('n', '<Leader>wj', '<C-w><C-j>')
vim.keymap.set('n', '<Leader>wk', '<C-w><C-k>')

vim.keymap.set('n', '<Leader>q', '<Cmd>bdelete<CR>')

vim.keymap.set('n', '<C-/>', 'gcc', { remap = true })
vim.keymap.set('v', '<C-/>', 'gc', { remap = true })
vim.keymap.set('i', '<C-/>', '<C-o>gcc', { remap = true })

vim.keymap.set({'n', 'v'}, '<Leader>r', function()
  vim.cmd(":source $MYVIMRC")
  vim.cmd("doautocmd FileType")
  print("Neovim config reloaded")
end)

--
-- Autocmds
--

vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold' }, {
  command = 'silent! checktime',
})

vim.api.nvim_create_autocmd('FocusLost', {
  command = 'silent! wall',
})

-- Jump to last file position upon opening
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, mark)
      vim.cmd('normal! zz')
    end
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'rst' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
    vim.opt_local.showbreak = '↪ '
  end,
})

--
-- Plugins
--

vim.pack.add({
  -- Lua utility library that several other plugins need
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/vague-theme/vague.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
  { src = "https://github.com/ibhagwan/fzf-lua" },
  { src = "https://github.com/windwp/nvim-autopairs" },
  { src = "https://github.com/stevearc/oil.nvim" },
})

local oil = require('oil')
oil.setup()
vim.keymap.set('n', '<leader>e', function() oil.open("") end) -- cwd
vim.keymap.set('n', '<leader>E', function() oil.open(nil) end) -- buf dir

require("nvim-autopairs").setup({})

require("vague").setup({
  italic = false,
})
vim.cmd("colorscheme vague")

local gitsigns = require('gitsigns')
gitsigns.setup({
  signs = {
    add          = { text = '▎' },
    change       = { text = '▎' },
    delete       = { text = '▁' },
    topdelete    = { text = '▔' },
    changedelete = { text = '▎' },
  },
})
vim.keymap.set('n', ']g', function() gitsigns.nav_hunk('next') end)
vim.keymap.set('n', '[g', function() gitsigns.nav_hunk('prev') end)
vim.keymap.set('n', 'gu', gitsigns.reset_hunk)
vim.keymap.set('v', 'gu', function()
  local start = math.min(vim.fn.line('.'), vim.fn.line('v'))
  local stop = math.max(vim.fn.line('.'), vim.fn.line('v'))
  gitsigns.reset_hunk({ start, stop })
end)

require('fzf-lua').setup({
  keymap = {
    builtin = { ['<Esc>'] = 'hide' },
    fzf = { ['esc'] = 'abort' },
  },
})
vim.keymap.set("n", "<Leader>f", FzfLua.files)
vim.keymap.set("n", "<Leader>b", FzfLua.buffers)
vim.keymap.set("n", "<Leader>/", FzfLua.live_grep_native)
vim.keymap.set("v", "<Leader>/", FzfLua.grep_visual)
vim.keymap.set({"n", "v"}, "<Leader>*", FzfLua.grep_cword)
vim.keymap.set("n", "<Leader>gs", FzfLua.git_status)
vim.keymap.set("n", "<Leader>gb", FzfLua.git_branches)
vim.keymap.set("n", "<Leader>'", FzfLua.resume)
vim.keymap.set("n", "<Leader>?", FzfLua.commands)
vim.keymap.set('n', '<Leader>o', function()
  FzfLua.files({ cwd = vim.fn.expand('%:p:h') })
end)

function table_append(orig, t)
  for i,v in ipairs(t) do
    table.insert(orig, v)
  end
end

local langs = {
  'c',
  'cpp',
  'fish',
  'go',
  'javascript',
  'json',
  'markdown',
  'python',
  'rst',
  'rust',
  'starlark',
  'toml',
  'typescript',
  'yaml',
}
local grammars = {}
table_append(grammars, langs)
table_append(grammars, { 'bash', 'starlark' })
local filetypes = {}
table_append(filetypes, langs)
table_append(filetypes, { 'sh', 'bzl' })

require('nvim-treesitter').install(grammars)
vim.api.nvim_create_autocmd('FileType', {
  pattern = filetypes,
  callback = function() vim.treesitter.start() end,
})

local harpoon = require('harpoon')
harpoon:setup()
vim.keymap.set("n", "<leader>p", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "gp", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-;>", function() harpoon:list():select(4) end)
-- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
