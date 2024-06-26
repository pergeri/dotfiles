--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "tokyonight-night"
vim.opt.relativenumber = true
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- plugins
lvim.plugins = {
{
   "phaazon/hop.nvim",
   event = "BufRead",
   config = function()
     require("hop").setup()
     vim.api.nvim_set_keymap("n", "!", ":HopChar2<cr>", { silent = false })
   end,
},
{
  "folke/trouble.nvim",
    cmd = "TroubleToggle",
},
{
  "folke/todo-comments.nvim",
  event = "BufRead",
  config = function()
    require("todo-comments").setup()
  end,
},
{
  "sQVe/sort.nvim",
    config = function()
    require("sort").setup({
})
    end,
},
{
  "Pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup()
  end,
},
{
 "karb94/neoscroll.nvim",
 event = "WinScrolled",
 config = function()
 require('neoscroll').setup({
       -- All these keys will be mapped to their corresponding default scrolling animation
       mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
       '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
       hide_cursor = true,          -- Hide cursor while scrolling
       stop_eof = true,             -- Stop at <EOF> when scrolling downwards
       use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
       respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
       cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
       easing_function = nil,        -- Default easing function
       pre_hook = nil,              -- Function to run before the scrolling animation starts
       post_hook = nil,              -- Function to run after the scrolling animation ends
       })
 end
},
{
  "ggandor/lightspeed.nvim",
  event = "BufRead",
},
{
  "tpope/vim-fugitive",
  cmd = {
    "G",
    "Git",
    "Gdiffsplit",
    "Gread",
    "Gwrite",
    "Ggrep",
    "GMove",
    "GDelete",
    "GBrowse",
    "GRemove",
    "GRename",
    "Glgrep",
    "Gedit"
  },
  ft = {"fugitive"}
},
{
  "tpope/vim-surround",

  -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
  -- setup = function()
    --  vim.o.timeoutlen = 500
  -- end
},
{
    "ThePrimeagen/vim-be-good",
},
}

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<CR>"
lvim.keys.normal_mode["ö"] = "["
lvim.keys.normal_mode["ä"] = "]"
lvim.keys.normal_mode["¤"] = "^"
lvim.keys.normal_mode["Ö"] = "<C-["
lvim.keys.normal_mode["Ä"] = "<C-]"
lvim.keys.normal_mode["§"] = "~"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
   name = "+Terraform",
   f = { ":!terraform fmt %:h<Enter><Enter>", "Terraform Format" },
   v = { ":!cd %:h && terraform validate<Enter>", "Terraform Validate" },
   i = { ":!cd %:h && terraform init<Enter>", "Terraform Init" },
   p = { ":!cd %:h && terraform plan<Enter>", "Terraform Plan" },
}
lvim.builtin.which_key.mappings["gB"] = {
  "<cmd>Git checkout -b <CR>", "Create branch"
}
--lvim.builtin.which_key.mappings["T"] = {
-- name = "Diagnostics",
-- t = { "<cmd>TroubleToggle<cr>", "trouble" },
-- w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
-- d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
-- q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
-- l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
-- r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
--}
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
  "hcl",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
 local formatters = require "lvim.lsp.null-ls.formatters"
 formatters.setup {
   { command = "black", filetypes = { "python" } },
   { command = "isort", filetypes = { "python" } },
--   { command = "hclfmt", filetypes = { "hcl" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
 }

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
--  { command = "hclfmt", filetypes = { "hcl" } },
--  {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--  { command = "hclfmt", filetypes = { "hcl" } },
--   I{
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
 }

-- Additional Plugins
-- lvim.plugins = {
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
