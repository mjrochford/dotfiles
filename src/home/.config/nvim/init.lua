vim.cmd("source ~/.config/vim/vimrc")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local plugins = {
    "tinted-theming/base16-vim",
    "tpope/vim-fugitive",
    "tpope/vim-commentary",
    "tpope/vim-dispatch",

    "ludovicchabant/vim-gutentags",
    "majutsushi/tagbar",
    "nvim-orgmode/orgmode",

    "NoahTheDuke/vim-just",
    "nvim-treesitter/nvim-treesitter",
    "rust-lang/rust.vim",
    "neovim/nvim-lspconfig",
    { "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    { "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}

    },
    "nvim-treesitter/nvim-treesitter-context"
}

local path_sep = vim.loop.os_uname().sysname == "Windows" and "\\" or "/"
-- Assumes filepath is a file.
local function dirname(filepath)
local is_changed = false
local result = filepath:gsub(path_sep.."([^"..path_sep.."]+)$", function()
  is_changed = true
  return ""
end)
return result, is_changed
end

vim.g.netrw_keepdir = 0
vim.opt.rtp:prepend(lazypath)
require("lazy").setup(plugins, opts)
vim.cmd.colorscheme("base16-ashes")
local telescope = require("telescope.builtin")
vim.keymap.set('n', '<leader>b', function () telescope.buffers{sort_lastused=true} end)
vim.keymap.set('n', '<leader>.', telescope.find_files)

local lspconfig = require("lspconfig")
lspconfig.clangd.setup{}
lspconfig.rust_analyzer.setup{}
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})


if vim.g.neovide then
    vim.opt.guifont = "Iosevka Term:h12"
    vim.g.neovide_scroll_animation_length = 0.1
    vim.g.neovide_cursor_animation_length = 0.01
    -- Put anything you want to happen only in Neovide here
end
