-- TODO:
-- 
-- lsp keybindings (code actions, rename, https://github.com/gbrlsnchs/telescope-lsp-handlers.nvim)
-- trouble.nvim for nicer lsp experience
-- packer bootstrapping https://old.reddit.com/r/neovim/comments/tzwsjs/packer_initialization/
-- separate file for each plugin config
-- web-devicons in gutter: https://www.google.com/search?gl=us&hl=en&gws_rd=cr&q=nvim-web-devicons+in+gutter
-- easier lsp setup: https://github.com/williamboman/mason.nvim
--
-- useful plugins maybe:
--   neorg: org mode
--   undotree
--   tab bar: https://github.com/nanozuki/tabby.nvim
--   nvim-tree: https://github.com/kyazdani42/nvim-tree.lua
--   null-ls.nvim? https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/MAIN.md
--   session management (tmux-resurrect and vim-obsession)
--   repl for non lisps (SnipRun, magma-nvim, codi.vim, vim-slime) - seems like conjure replaces this


vim.cmd([[

" set ai                  " auto indenting
set encoding=utf-8
set shell=/bin/bash     " fish shell screws up stuff like go integration
set history=100         " keep 100 lines of history
set ruler               " show the cursor position
set wildmenu            " show options when autocompleting a path
syntax on               " syntax highlighting
set hlsearch            " highlight the last searched term
set runtimepath+=~/.vim/indent
set termguicolors
set mouse=a
set foldmethod=marker
set foldlevel=0

" Always allow backspace
set backspace=indent,eol,start

" For go
set rtp+=$GOROOT/misc/vim

" Keep the cursor at least 10 characters from the edge of the screen
set scrolloff=2

" only do case-sensitive searches when searching for uppercase characters
" (both options necessary to take affect)
set ignorecase
set smartcase

" make grep always search recursively
set grepprg=grep\ -rnIi

" For some reason Y grabs the whole line
nnoremap Y y$

" Don't move the cursor to the beginning of the line when switching between
" buffers
set nostartofline

" don't wrap lines
set nowrap

" Filetypes to ignore
set wildignore+=*/.git/*,*/env/*,*/node_modules/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/.class,*/dist,*/target

" Tab-completion bash style for filenames
set wildmode=longest,list

set incsearch
set switchbuf=usetab
set hidden

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set nobackup
set nowritebackup
set noswapfile

let mapleader = " "
let maplocalleader = ";"
set number
nnoremap H ^
nnoremap L $
inoremap jk <esc>
inoremap Jk <esc>
inoremap JK <esc>

" terminal mode, primarily for vim-jack-in so we can exit the terminal mode
" without closing the repl.
tnoremap <Esc> <C-\><C-n>
tnoremap jk <C-\><C-n>
tnoremap Jk <C-\><C-n>
tnoremap JK <C-\><C-n>

" toggle showing column numbers
nnoremap <c-n><c-n> :set invnumber<CR>

nnoremap <leader>w :update<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>x :x<cr>

nnoremap <leader>p :set paste<cr>
nnoremap <leader>np :set nopaste<cr>

nnoremap <leader><leader> :b#<cr>

" Set pwd to directory of current file and print it
nnoremap <leader>cd :lcd %:p:h<cr>:pwd<cr>

nnoremap <leader>ev :e ~/.config/nvim/init.lua<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.lua<cr>

" split windows
nnoremap <leader>vs <c-w>v
nnoremap <leader>hs <c-w>s
" set position for new split buffers
set splitright
set splitbelow

" quickly jump to a file's directory
" nnoremap <leader>ls :e <C-R>=expand('%:h').'/'<cr><cr>

" nvim-telescope/telescope.nvim and telescope-file-browser
nnoremap <leader>f <cmd>Telescope find_files find_command=rg,--files,--iglob,!.git,--hidden<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>al <cmd>Telescope buffers<cr>
nnoremap <leader>ad :bdelete!<cr>
nnoremap <leader>ls <cmd>Telescope file_browser path=%:p:h hidden=true<cr>
xnoremap <leader>ga <cmd>EasyAlign <cr>
nnoremap <leader>ga <cmd>EasyAlign <cr>

" terrortylor/nvim-comment
nnoremap <leader>c<leader> gcc
vnoremap <leader>c gc

" Always show gutter so lsp doesn't keep moving the buffer over when there are
" errors
set signcolumn=yes

set timeoutlen=500

]])


-- tmux.nvim movement/resize keybindings
--movement
vim.keymap.set("n", "<M-h>", "<cmd>lua require(\"tmux\").move_left()<cr>")
vim.keymap.set("n", "<M-j>", "<cmd>lua require(\"tmux\").move_bottom()<cr>")
vim.keymap.set("n", "<M-k>", "<cmd>lua require(\"tmux\").move_top()<cr>")
vim.keymap.set("n", "<M-l>", "<cmd>lua require(\"tmux\").move_right()<cr>")

--resize
vim.keymap.set("n", "<M-H>", "<cmd>lua require(\"tmux\").resize_left()<cr>")
vim.keymap.set("n", "<M-J>", "<cmd>lua require(\"tmux\").resize_bottom()<cr>")
vim.keymap.set("n", "<M-K>", "<cmd>lua require(\"tmux\").resize_top()<cr>")
vim.keymap.set("n", "<M-L>", "<cmd>lua require(\"tmux\").resize_right()<cr>")


-- Taken from: https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/
vim.api.nvim_create_autocmd('User', {
  pattern = 'LspAttached',
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = true}
      vim.keymap.set(mode, lhs, rhs, opts)
    end
    
    bufmap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>') -- Renames all references to the symbol under the cursor
    bufmap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>') -- Selects a code action available at the current cursor position
    bufmap('x', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>') -- Displays hover information about the symbol under the cursor
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>') -- Jump to the definition
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>') -- Jump to declaration
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>') -- Lists all the implementations for the symbol under the cursor
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>') -- Lists all the references 
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>') -- Move to the previous diagnostic
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>') -- Move to the next diagnostic
    
    -- vim.lsp.buf.add_workspace_folder
    -- vim.lsp.buf.remove_workspace_folder
    -- vim.lsp.buf.list_workspace_folders()
    -- vim.diagnostic.setloclist
    -- vim.diagnostic.open_float -- Show diagnostics in a floating window
    -- vim.lsp.buf.signature_help -- Displays a function's signature information
    -- vim.lsp.buf.type_definition -- Jumps to the definition of the type symbol
  end
})

vim.api.nvim_create_autocmd('BufWritePost', { group = vim.api.nvim_create_augroup('PACKER', { clear = true }), pattern = 'init.lua', command = 'source <afile> | PackerCompile', })

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


-- After adding a plugin, run :PackerSync and :PackerCompile
return require('packer').startup(function(use)

  use "wbthomason/packer.nvim"

  use {
    'Olical/aniseed',
    config = function()
      require('aniseed.env').init()
    end
  }

  use { -- file search
    'nvim-telescope/telescope.nvim', 
    branch = '0.1.x', 
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup {
        pickers = {
          buffers = {
            sort_lastused = true,
            ignore_current_buffer = true
          }
        }
      }
    end
  }

  use { 
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { 'nvim-telescope/telescope.nvim' },
    config = function()
      require("telescope").load_extension "file_browser"
    end
  }

  use { 
    'nvim-telescope/telescope-ui-select.nvim', 
    requires = { 'nvim-telescope/telescope.nvim' },
    config = function()
      require("telescope").load_extension("ui-select")
    end
  }


  use {
    'nvim-lualine/lualine.nvim',
    requires = {  'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'auto',
          icons_enabled = true,
          section_separators = '',
          component_separators = ''
        }
      }
    end
  }

  use {
    'terrortylor/nvim-comment',
    config = function()
      require('nvim_comment').setup({line_mapping = "<leader>cl", operator_mapping = "<leader>c"})
    end
  }

  use {
    'clojure-vim/vim-jack-in',
    requires = { 'tpope/vim-dispatch', 'radenling/vim-dispatch-neovim' }
  }
  use {
    'Olical/conjure',
    config = function()
      vim.g["conjure#log#hud#enabled"] = false
    end
  }

  -- Check lsp setup here:
  -- https://github.com/neovim/nvim-lspconfig
  -- https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/
  -- https://github.com/Olical/magic-kit/blob/main/fnl/magic/init.fnl
  -- https://github.com/Olical/magic-kit/blob/main/fnl/magic/plugin/lspconfig.fnl
  use {
    'neovim/nvim-lspconfig',
    config = function()

      -- Taken from: https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#show-line-diagnostics-automatically-in-hover-window
      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
			})

			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = "rounded",
			})

    end
  }


  -- https://github.com/Olical/magic-kit/blob/main/fnl/magic/plugin/cmp.fnl
  -- https://github.com/hrsh7th/nvim-cmp
  -- https://github.com/PaterJason/cmp-conjure
  -- https://github.com/rafaeldelboni/nvim-fennel-lsp-conjure-as-clojure-ide/tree/main/.config/nvim/fnl/config
  -- autocomplete delay? https://github.com/hrsh7th/nvim-cmp/issues/715
  use {
    'hrsh7th/cmp-nvim-lsp',
    requires = { 'neovim/nvim-lspconfig' },
    config = function()

			local lsp_defaults = {
				capabilities = require('cmp_nvim_lsp').update_capabilities(
					vim.lsp.protocol.make_client_capabilities()
				),
				on_attach = function(client, bufnr)
					vim.api.nvim_exec_autocmds('User', {pattern = 'LspAttached'})
				end
			}

			local lspconfig = require('lspconfig')

			lspconfig.util.default_config = vim.tbl_deep_extend(
				'force',
				lspconfig.util.default_config,
				lsp_defaults
			)

      require('lspconfig')['clojure_lsp'].setup {}
      require('lspconfig')['pylsp'].setup {}

    end
  }
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'PaterJason/cmp-conjure'
  use {
    'hrsh7th/nvim-cmp',
    config = function()

			disable_in_comments = function()
				local context = require("cmp.config.context")
				return not (
					context.in_treesitter_capture("comment") or context.in_syntax_group("Comment")
				)
			end
      -- config taken from https://github.com/hrsh7th/nvim-cmp
      local cmp = require('cmp')
      cmp.setup {
        mapping = cmp.mapping.preset.insert({
          ['<tab>'] = cmp.mapping.select_next_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = {
          {name = 'nvim_lsp', keyword_length = 2, max_item_count = 10, enable = disable_in_comments},
          {name = 'conjure', keyword_length = 2, max_item_count = 10, enable = disable_in_comments},
          {name = 'buffer', keyword_length = 2, max_item_count = 10, enable = disable_in_comments},
          {name = 'path', keyword_length = 2, max_item_count = 10, enable = disable_in_comments},
        }
      }
			require'cmp'.setup.cmdline(':', { sources = { { name = 'cmdline' } } })
			require'cmp'.setup.cmdline('/', { sources = { { name = 'buffer' } } })

    end
  }

  -- theme: https://github.com/marko-cerovac/material.nvim
  use {
    'marko-cerovac/material.nvim',
    config = function()
      vim.g.material_style = "darker" -- has to go before vim.cmd it seems
      vim.cmd 'colorscheme material'
    end
  }


  -- syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() 
      require('nvim-treesitter.install').update({ with_sync = true }) 
    end,
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "lua", "javascript", "clojure" },
        auto_install = true,
        highlight = {
          enabled = true
        }
      }
    end
  }

  -- Download a font (I used 'hack') with brew: https://www.nerdfonts.com/font-downloads
  -- Need to set iterm font: Prefs -> Profile -> Text -> Non-ASCII Font -> (The font you downloaded)
  -- use 'kyazdani42/nvim-web-devicons'

  use 'gpanders/nvim-parinfer'

  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end
  }

  -- easily align columns
  use {
    'tommcdo/vim-lion',
    config = function()
      vim.g["lion_map_right"] = "ga"
    end
  }

  -- easymotion-style plugin
  use 'ggandor/lightspeed.nvim'

  -- tmux movement/resizing integration
  use({
    "aserowy/tmux.nvim",
    config = function() 
      require("tmux").setup {
        navigation = {
          cycle_navigation = false,
          enable_default_keybindings = false
        },
        resize = {
          enable_default_keybindings = false
        }
      }

    end
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

end)


