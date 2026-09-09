-- Alex Ozer

--
-- Basics
--

-- Appearance
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.g.have_nerd_font = true
vim.opt.number = true
-- vim.opt.relativenumber = true
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
vim.opt.cinoptions:append(":0s,l1") -- Dont' indent switch case statements

-- Behavior
vim.opt.wrap = false
vim.opt.mouse = 'a'
vim.opt.mousescroll = 'ver:3,hor:0'
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.confirm = true
vim.opt.autowriteall = true
vim.opt.autoread = true
-- Don't change scroll position when jumping between buffers with Harpoon
vim.opt.jumpoptions:append('view')

--
-- Mappings
--

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- My classic mappings
vim.keymap.set({'n', 'v'}, ';', ':')
vim.keymap.set({'n', 'v'}, ':', ';')
vim.keymap.set({'n', 'v'}, 'H', '^')
vim.keymap.set({'n', 'v'}, 'L', '$')
vim.keymap.set('i', '<c-bs>', '<c-w>')
vim.keymap.set('i', '<a-bs>', '<c-w>')

-- Window commands
vim.keymap.set('n', '<Leader>h', '<C-w><C-h>')
vim.keymap.set('n', '<Leader>l', '<C-w><C-l>')
vim.keymap.set('n', '<Leader>j', '<C-w><C-j>')
vim.keymap.set('n', '<Leader>k', '<C-w><C-k>')
vim.keymap.set('n', '<Leader>H', '<C-w><S-h>')
vim.keymap.set('n', '<Leader>L', '<C-w><S-l>')
vim.keymap.set('n', '<Leader>J', '<C-w><S-j>')
vim.keymap.set('n', '<Leader>K', '<C-w><S-k>')
vim.keymap.set('n', '<Leader>q', '<Cmd>bdelete<CR>')

-- Comments
vim.keymap.set('n', '<C-/>', 'gcc', { remap = true })
vim.keymap.set('v', '<C-/>', 'gc', { remap = true })
vim.keymap.set('i', '<C-/>', '<C-o>gcc', { remap = true })

--
-- Autocmds
--

-- Auto reload
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold' }, {
  command = 'silent! checktime',
})

-- Auto save
vim.api.nvim_create_autocmd({ 'FocusLost', 'WinLeave', 'BufLeave', 'BufWritePre' }, {
  callback = function()
    if vim.bo.buftype ~= '' then return end -- Ignore popups
    if not vim.bo.modified then return end  -- Skip if buffer is unmodified
    -- TODO fix error message on first Harpoon file load
    vim.lsp.buf.format({ async = false })
    vim.cmd('silent! wall')
  end
})

-- Don't automatically continue comment lines
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt_local.textwidth = 100
    vim.opt_local.formatoptions:append('c')
    vim.opt_local.formatoptions:remove({ 'r', 'o' })
  end,
})

-- Soft wrap
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'rst' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
    vim.opt_local.showbreak = '↪ '

    vim.keymap.set({'n', 'v'}, 'j', 'gj')
    vim.keymap.set({'n', 'v'}, 'k', 'gk')
    vim.keymap.set({'n', 'v'}, 'H', 'g^', { buffer = true })
    vim.keymap.set({'n', 'v'}, 'L', 'g$', { buffer = true })

    end,
})

--
-- Plugins
--

vim.pack.add({
  -- Themes
  { src = 'https://github.com/EdenEast/nightfox.nvim' },
  { src = 'https://github.com/embark-theme/vim' },
  { src = 'https://github.com/tanvirtin/monokai.nvim' },
  { src = 'https://github.com/ribru17/bamboo.nvim' },

  -- Lua utility library that several other plugins need
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
  { src = "https://github.com/ibhagwan/fzf-lua" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },
  { src = 'https://github.com/Saghen/blink.cmp', version = vim.version.range('1.*') },
  { src = 'https://github.com/MagicDuck/grug-far.nvim' },
  -- markdown-toggle works very well, will re-enable when I have a use-case
  -- { src = 'https://github.com/roodolv/markdown-toggle.nvim' },
  -- { src = 'https://github.com/nvim-tree/nvim-web-devicons' }
})

--
-- Colorscheme config
--

-- vim.cmd.colorscheme('carbonfox')
-- vim.cmd.colorscheme('embark')
-- vim.cmd.colorscheme('monokai')
-- require('monokai').setup({ italics = false })
-- vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#606060' })
-- vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = '#606060' })
-- vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = '#606060' })
-- vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#333842' })
require('bamboo').load()
require('bamboo').setup({
  -- style = 'multiplex',
})
vim.cmd.colorscheme('bamboo')

--
-- Misc
--

local oil = require('oil')
oil.setup()
vim.keymap.set('n', '<leader>e', function() oil.open(nil) end) -- buf dir
vim.keymap.set('n', '-', function() oil.open(nil) end) -- buf dir (matches oil "parent dir" keybind)
vim.keymap.set('n', '<leader>E', function() oil.open("") end) -- cwd

require('grug-far').setup({})
vim.keymap.set({'n', 'v'}, '<leader>i', ':GrugFar<CR>')

-- require("markdown-toggle").setup({
--   keymaps = {
--     toggle = {
--       -- ["<C-q>"] = "quote",
--       -- ["<D-l>"] = "list",
--       ["<D-l>"] = "checkbox",
--       -- ["<C-n>"] = "olist",
--       -- ["<M-x>"] = "checkbox",
--       -- ["<Leader><M-x>"] = "checkbox_cycle",
--       -- ["<C-h>"] = "heading",
--       -- ["<Leader><C-h>"] = "heading_toggle",
--     },
--   },
-- })

--
-- LSP
--

vim.lsp.enable('rust_analyzer')
vim.lsp.enable('clangd')
vim.lsp.enable('ts_ls')
vim.lsp.enable('gopls')
vim.lsp.enable('zls')
vim.lsp.enable('java_language_server')
vim.lsp.enable('basedpyright')
-- vim.lsp.enable('ruff')

vim.keymap.set({'n', 'v'}, 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', "<leader>r", vim.lsp.buf.rename)
vim.keymap.set('n', "<F2>", vim.lsp.buf.rename)
vim.keymap.set('n', "<leader>a", vim.lsp.buf.code_action)

require('tiny-inline-diagnostic').setup({})
vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
vim.diagnostic.enable(false)

-- Toggle inline diagnostics
vim.keymap.set({'n', 'v'}, '|', function()
  vim.diagnostic.enable(true)
  print("Diagnostics: enabled")
end)
vim.keymap.set({'n', 'v'}, '\\', function()
  vim.diagnostic.enable(false)
  print("Diagnostics: disabled")
end)

local cmp = require('blink.cmp')
cmp.setup({
  keymap = {
    preset = 'super-tab',
  },
  enabled = function()
    local disabled_filetypes = { 'markdown', 'txt' }
    if vim.tbl_contains(disabled_filetypes, vim.bo.filetype) then
      return false
    end
    -- Keep default behaviors (like disabling in prompt buffers)
    return vim.bo.buftype ~= "prompt"
  end,
})

--
-- Git
--

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
vim.keymap.set('n', '<leader>gb', gitsigns.blame)
vim.keymap.set('n', '<leader>gd', gitsigns.diffthis)

--
-- Pickers
--

require('fzf-lua').setup({
  keymap = {
    builtin = { ['<Esc>'] = 'hide' },
    fzf = { ['esc'] = 'abort' },
  },
})

function presave(f)
  return function()
    vim.cmd.wall()
    f()
  end
end

-- Helix/spacemacs style keybinds
vim.keymap.set("n", "<Leader>f", presave(FzfLua.files))
vim.keymap.set("n", "<Leader>b", presave(FzfLua.buffers))
vim.keymap.set("n", "<Leader>gs", presave(FzfLua.git_diff))
vim.keymap.set("n", "<Leader>gc", presave(FzfLua.git_branches))
vim.keymap.set("n", "<Leader>'", presave(FzfLua.resume))
vim.keymap.set("n", "<Leader>?", presave(FzfLua.commands))
vim.keymap.set('n', '<Leader>o', presave(function()
  FzfLua.files({ cwd = vim.fn.expand('%:p:h') })
end))
vim.keymap.set({"n", "v"}, "<leader>d", presave(FzfLua.diagnostics_document))
vim.keymap.set({"n", "v"}, "<leader>D", presave(FzfLua.diagnostics_workspace))
vim.keymap.set({"n", "v"}, "<leader>s", presave(FzfLua.lsp_document_symbols))
vim.keymap.set({"n", "v"}, "<leader>S", presave(FzfLua.lsp_workspace_symbols))
-- Searching
vim.keymap.set("n", "<Leader>/", presave(FzfLua.live_grep_native))
vim.keymap.set("v", "<Leader>/", presave(FzfLua.grep_visual))
vim.keymap.set({"n", "v"}, "<Leader>*", presave(FzfLua.grep_cword))
vim.keymap.set({"n", "v"}, "g/", presave(FzfLua.lgrep_curbuf))

--
-- Tree-sitter
--

function table_append(orig, t)
  for i,v in ipairs(t) do
    table.insert(orig, v)
  end
end

local langs = {
  'c',
  'cpp',
  'css',
  'fish',
  'go',
  'hlsl',
  'java',
  'html',
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
  'zig',
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

vim.filetype.add({
  extension = {
    hlsl = "hlsl",
    shader = "hlsl", -- Maps Unity/generic shader files to HLSL
    fx = "hlsl",     -- Maps DirectX FX files to HLSL
  },
})

--
-- Harpoon
--

local harpoon = require('harpoon')
harpoon:setup()
vim.keymap.set("n", "<leader>p", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)
vim.keymap.set("n", "gp", function()
  harpoon:list():add()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)
vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-;>", function() harpoon:list():select(4) end)
