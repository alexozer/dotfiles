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

vim.keymap.set('n', ']g', function() require('gitsigns').nav_hunk('next') end)
vim.keymap.set('n', '[g', function() require('gitsigns').nav_hunk('prev') end)
vim.keymap.set('n', 'gu', function() require('gitsigns').reset_hunk() end)
vim.keymap.set('v', 'gu', function()
  local start = math.min(vim.fn.line('.'), vim.fn.line('v'))
  local stop = math.max(vim.fn.line('.'), vim.fn.line('v'))
  require('gitsigns').reset_hunk({ start, stop })
end)

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
    { src = "https://github.com/vague-theme/vague.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

require('vague').setup({
  italic = false,
})
vim.cmd("colorscheme vague")

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
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<Leader>f', telescope.find_files)
vim.keymap.set('n', '<Leader>b', telescope.buffers)
vim.keymap.set('n', '<Leader>/', telescope.live_grep)
vim.keymap.set('n', '<Leader>s', telescope.lsp_document_symbols)
vim.keymap.set('n', "<Leader>'", telescope.resume)
vim.keymap.set('n', '<Leader>d', telescope.diagnostics)
vim.keymap.set('n', '<Leader>?', telescope.help_tags)
vim.keymap.set('n', '<leader>g', telescope.git_status)

require('nvim-autopairs').setup({
  fast_wrap = { map = '<M-e>' },
  ignored_next_char = "%S",
})

function shallow_copy(t)
    local c = {}
    for i,v in ipairs(t) do
        c[i] = v
    end
    return c
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
  'rust',
  'starlark', 
  'toml', 
  'typescript',
  'yaml',
}
local grammars = shallow_copy(langs)
table.insert(grammars, 'bash')
local filetypes = shallow_copy(langs)
table.insert(filetypes, 'sh')

require('nvim-treesitter').install(grammars)
vim.api.nvim_create_autocmd('FileType', {
  pattern = filetypes,
  callback = function() vim.treesitter.start() end,
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
