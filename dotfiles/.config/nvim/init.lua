-- Theme
vim.cmd("colorscheme retrobox")

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
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = '↪ '
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.confirm = true
vim.opt.autowriteall = true
vim.opt.autoread = true
vim.cmd.filetype("plugin indent on")

vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold' }, {
  command = 'silent! checktime',
})

vim.api.nvim_create_autocmd('FocusLost', {
  command = 'silent! wall',
})

vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, mark)
      vim.cmd('normal! zz')
    end
  end,
})

--
-- Mappings
--

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- My classic mappings
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', ':', ';')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')
vim.keymap.set('i', '<c-bs>', '<c-w>')

-- Window commands
vim.keymap.set('n', '<Leader>wh', '<C-w><C-h>')
vim.keymap.set('n', '<Leader>wl', '<C-w><C-l>')
vim.keymap.set('n', '<Leader>wj', '<C-w><C-j>')
vim.keymap.set('n', '<Leader>wk', '<C-w><C-k>')

vim.keymap.set('n', '<Leader>q', '<Cmd>bdelete<CR>')

vim.keymap.set('n', ']g', function() require('gitsigns').nav_hunk('next') end)
vim.keymap.set('n', '[g', function() require('gitsigns').nav_hunk('prev') end)
vim.keymap.set('n', 'gu', function() require('gitsigns').reset_hunk() end)
vim.keymap.set('v', 'gu', function() require('gitsigns').reset_hunk(
    { vim.fn.line('.'), vim.fn.line('v') }
) end)

vim.keymap.set('n', '<C-/>', 'gcc', { remap = true })
vim.keymap.set('v', '<C-/>', 'gc', { remap = true })
vim.keymap.set('i', '<C-/>', '<C-o>gcc', { remap = true })

vim.keymap.set({'n', 'v'}, '<Leader>r', function() 
    vim.cmd(":source $MYVIMRC") 
    vim.cmd("doautocmd FileType")
    print("Neovim config reloaded")
end)


--
-- Plugins
--

vim.pack.add({
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/windwp/nvim-autopairs" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})
require('gitsigns').setup({
  signs = {
    add          = { text = '▎' },
    change       = { text = '▎' },
    delete       = { text = '▁' },
    topdelete    = { text = '▔' },
    changedelete = { text = '▎' },
  },
})

require('telescope').setup({
  defaults = {
    layout_config = { prompt_position = 'top' },
    sorting_strategy = 'ascending',
    mappings = {
      i = { ['<Esc>'] = require('telescope.actions').close },
    },
  },
})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader>f', builtin.find_files)
vim.keymap.set('n', '<Leader>b', builtin.buffers)
vim.keymap.set('n', '<Leader>/', builtin.live_grep)
vim.keymap.set('n', '<Leader>s', builtin.lsp_document_symbols)
vim.keymap.set('n', "<Leader>'", builtin.resume)
vim.keymap.set('n', '<Leader>d', builtin.diagnostics)
vim.keymap.set('n', '<Leader>?', builtin.help_tags)
vim.keymap.set('n', '<leader>g', builtin.git_status)

require('nvim-autopairs').setup({
  check_ts = true,
  fast_wrap = { map = '<M-e>' },
})

-- Treesitter: use built-in highlighting, nvim-treesitter only for parser auto-install
require('nvim-treesitter').setup({ auto_install = true })

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'rst' },
  callback = function()
    vim.opt_local.wrap = true
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

-- Gruvbox-matching gitsigns colors
vim.api.nvim_set_hl(0, 'GitSignsAdd',    { fg = '#b8bb26' })  -- gruvbox green
vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = '#83a598' })  -- gruvbox blue
vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = '#fb4934' })  -- gruvbox red
