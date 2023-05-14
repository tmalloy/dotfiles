-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/tmalloy/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/tmalloy/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/tmalloy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/tmalloy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/tmalloy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  aniseed = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\16aniseed.env\frequire\0" },
    loaded = true,
    path = "/Users/tmalloy/.local/share/nvim/site/pack/packer/start/aniseed",
    url = "https://github.com/Olical/aniseed"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/tmalloy/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/tmalloy/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-conjure"] = {
    loaded = true,
    path = "/Users/tmalloy/.local/share/nvim/site/pack/packer/start/cmp-conjure",
    url = "https://github.com/PaterJason/cmp-conjure"
  },
  ["cmp-nvim-lsp"] = {
    config = { "\27LJ\2\nZ\0\2\6\0\5\0\a6\2\0\0009\2\1\0029\2\2\2'\4\3\0005\5\4\0B\2\3\1K\0\1\0\1\0\1\fpattern\16LspAttached\tUser\23nvim_exec_autocmds\bapi\bvimå\2\1\0\b\0\19\0)5\0\a\0006\1\0\0'\3\1\0B\1\2\0029\1\2\0016\3\3\0009\3\4\0039\3\5\0039\3\6\3B\3\1\0A\1\0\2=\1\b\0003\1\t\0=\1\n\0006\1\0\0'\3\v\0B\1\2\0029\2\f\0016\3\3\0009\3\14\3'\5\15\0009\6\f\0019\6\r\6\18\a\0\0B\3\4\2=\3\r\0026\2\0\0'\4\v\0B\2\2\0029\2\16\0029\2\17\0024\4\0\0B\2\2\0016\2\0\0'\4\v\0B\2\2\0029\2\18\0029\2\17\0024\4\0\0B\2\2\1K\0\1\0\npylsp\nsetup\16clojure_lsp\nforce\20tbl_deep_extend\19default_config\tutil\14lspconfig\14on_attach\0\17capabilities\1\0\0\29make_client_capabilities\rprotocol\blsp\bvim\24update_capabilities\17cmp_nvim_lsp\frequire\0" },
    loaded = true,
    path = "/Users/tmalloy/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/tmalloy/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  conjure = {
    config = { "\27LJ\2\n9\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\1\0=\1\2\0K\0\1\0\28conjure#log#hud#enabled\6g\bvim\0" },
    loaded = true,
    path = "/Users/tmalloy/.local/share/nvim/site/pack/packer/start/conjure",
    url = "https://github.com/Olical/conjure"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/Users/tmalloy/.local/share/nvim/site/pack/packer/start/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n“\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\4\18icons_enabled\2\ntheme\tauto\25component_separators\5\23section_separators\5\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/tmalloy/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["material.nvim"] = {
    config = { "\27LJ\2\n`\0\0\3\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\25colorscheme material\bcmd\vdarker\19material_style\6g\bvim\0" },
    loaded = true,
    path = "/Users/tmalloy/.local/share/nvim/site/pack/packer/start/material.nvim",
    url = "https://github.com/marko-cerovac/material.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nœ\1\0\0\4\0\6\0\0176\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0B\1\2\2\14\0\1\0X\2\5€9\1\4\0'\3\5\0B\1\2\2\19\1\1\0X\2\3€+\1\1\0X\2\1€+\1\2\0L\1\2\0\fComment\20in_syntax_group\fcomment\26in_treesitter_capture\23cmp.config.context\frequire…\6\1\0\n\0#\0T3\0\0\0007\0\1\0006\0\2\0'\2\3\0B\0\2\0029\1\4\0005\3\21\0009\4\5\0009\4\6\0049\4\a\0045\6\t\0009\a\5\0009\a\b\aB\a\1\2=\a\n\0069\a\5\0009\a\v\a)\tüÿB\a\2\2=\a\f\0069\a\5\0009\a\v\a)\t\4\0B\a\2\2=\a\r\0069\a\5\0009\a\14\aB\a\1\2=\a\15\0069\a\5\0009\a\16\aB\a\1\2=\a\17\0069\a\5\0009\a\18\a5\t\19\0B\a\2\2=\a\20\6B\4\2\2=\4\5\0034\4\5\0005\5\22\0006\6\1\0=\6\23\5>\5\1\0045\5\24\0006\6\1\0=\6\23\5>\5\2\0045\5\25\0006\6\1\0=\6\23\5>\5\3\0045\5\26\0006\6\1\0=\6\23\5>\5\4\4=\4\27\3B\1\2\0016\1\2\0'\3\3\0B\1\2\0029\1\4\0019\1\28\1'\3\29\0005\4\31\0004\5\3\0005\6\30\0>\6\1\5=\5\27\4B\1\3\0016\1\2\0'\3\3\0B\1\2\0029\1\4\0019\1\28\1'\3 \0005\4\"\0004\5\3\0005\6!\0>\6\1\5=\5\27\4B\1\3\1K\0\1\0\1\0\0\1\0\1\tname\vbuffer\6/\1\0\0\1\0\1\tname\fcmdline\6:\fcmdline\fsources\1\0\3\19max_item_count\3\n\19keyword_length\3\2\tname\tpath\1\0\3\19max_item_count\3\n\19keyword_length\3\2\tname\vbuffer\1\0\3\19max_item_count\3\n\19keyword_length\3\2\tname\fconjure\venable\1\0\3\19max_item_count\3\n\19keyword_length\3\2\tname\rnvim_lsp\1\0\0\t<CR>\1\0\1\vselect\1\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\16scroll_docs\n<tab>\1\0\0\21select_next_item\vinsert\vpreset\fmapping\nsetup\bcmp\frequire\24disable_in_comments\0\0" },
    loaded = true,
    path = "/Users/tmalloy/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\2\nt\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\21operator_mapping\14<leader>c\17line_mapping\15<leader>cl\nsetup\17nvim_comment\frequire\0" },
    loaded = true,
    path = "/Users/tmalloy/.local/share/nvim/site/pack/packer/start/nvim-comment",
    url = "https://github.com/terrortylor/nvim-comment"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n¡\3\0\0\v\0\19\0.5\0\0\0006\1\1\0\18\3\0\0B\1\2\4H\4\f€'\6\2\0\18\a\4\0&\6\a\0066\a\3\0009\a\4\a9\a\5\a\18\t\6\0005\n\6\0=\5\a\n=\6\b\n=\6\t\nB\a\3\1F\4\3\3R\4ò6\1\3\0009\1\n\0019\1\v\0016\2\3\0009\2\n\0029\2\r\0026\4\3\0009\4\n\0049\4\v\0049\4\14\0045\5\15\0B\2\3\2=\2\f\0016\1\3\0009\1\n\0019\1\v\0016\2\3\0009\2\n\0029\2\r\0026\4\3\0009\4\n\0049\4\v\0049\4\17\0045\5\18\0B\2\3\2=\2\16\1K\0\1\0\1\0\1\vborder\frounded\19signature_help\31textDocument/signatureHelp\1\0\1\vborder\frounded\nhover\twith\23textDocument/hover\rhandlers\blsp\nnumhl\vtexthl\ttext\1\0\0\16sign_define\afn\bvim\19DiagnosticSign\npairs\1\0\4\nError\tï™™ \tHint\tï µ \tWarn\tï”© \tInfo\tï‘‰ \0" },
    loaded = true,
    path = "/Users/tmalloy/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-parinfer"] = {
    loaded = true,
    path = "/Users/tmalloy/.local/share/nvim/site/pack/packer/start/nvim-parinfer",
    url = "https://github.com/gpanders/nvim-parinfer"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n¬\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\1\fenabled\2\21ensure_installed\1\0\1\17auto_install\2\1\4\0\0\blua\15javascript\fclojure\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/tmalloy/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/tmalloy/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/tmalloy/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/tmalloy/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    config = { "\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\17file_browser\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/tmalloy/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    config = { "\27LJ\2\nN\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\14ui-select\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/tmalloy/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nŠ\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\fpickers\1\0\0\fbuffers\1\0\0\1\0\2\18sort_lastused\2\26ignore_current_buffer\2\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/tmalloy/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tmux.nvim"] = {
    config = { "\27LJ\2\n«\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\vresize\1\0\1\31enable_default_keybindings\1\15navigation\1\0\0\1\0\2\31enable_default_keybindings\1\21cycle_navigation\1\nsetup\ttmux\frequire\0" },
    loaded = true,
    path = "/Users/tmalloy/.local/share/nvim/site/pack/packer/start/tmux.nvim",
    url = "https://github.com/aserowy/tmux.nvim"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/Users/tmalloy/.local/share/nvim/site/pack/packer/start/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-dispatch-neovim"] = {
    loaded = true,
    path = "/Users/tmalloy/.local/share/nvim/site/pack/packer/start/vim-dispatch-neovim",
    url = "https://github.com/radenling/vim-dispatch-neovim"
  },
  ["vim-jack-in"] = {
    loaded = true,
    path = "/Users/tmalloy/.local/share/nvim/site/pack/packer/start/vim-jack-in",
    url = "https://github.com/clojure-vim/vim-jack-in"
  },
  ["vim-lion"] = {
    config = { "\27LJ\2\n3\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\aga\19lion_map_right\6g\bvim\0" },
    loaded = true,
    path = "/Users/tmalloy/.local/share/nvim/site/pack/packer/start/vim-lion",
    url = "https://github.com/tommcdo/vim-lion"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/tmalloy/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nŠ\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\fpickers\1\0\0\fbuffers\1\0\0\1\0\2\18sort_lastused\2\26ignore_current_buffer\2\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: vim-lion
time([[Config for vim-lion]], true)
try_loadstring("\27LJ\2\n3\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\aga\19lion_map_right\6g\bvim\0", "config", "vim-lion")
time([[Config for vim-lion]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
try_loadstring("\27LJ\2\nt\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\21operator_mapping\14<leader>c\17line_mapping\15<leader>cl\nsetup\17nvim_comment\frequire\0", "config", "nvim-comment")
time([[Config for nvim-comment]], false)
-- Config for: aniseed
time([[Config for aniseed]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\16aniseed.env\frequire\0", "config", "aniseed")
time([[Config for aniseed]], false)
-- Config for: tmux.nvim
time([[Config for tmux.nvim]], true)
try_loadstring("\27LJ\2\n«\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\vresize\1\0\1\31enable_default_keybindings\1\15navigation\1\0\0\1\0\2\31enable_default_keybindings\1\21cycle_navigation\1\nsetup\ttmux\frequire\0", "config", "tmux.nvim")
time([[Config for tmux.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n“\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\4\18icons_enabled\2\ntheme\tauto\25component_separators\5\23section_separators\5\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: conjure
time([[Config for conjure]], true)
try_loadstring("\27LJ\2\n9\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\1\0=\1\2\0K\0\1\0\28conjure#log#hud#enabled\6g\bvim\0", "config", "conjure")
time([[Config for conjure]], false)
-- Config for: telescope-file-browser.nvim
time([[Config for telescope-file-browser.nvim]], true)
try_loadstring("\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\17file_browser\19load_extension\14telescope\frequire\0", "config", "telescope-file-browser.nvim")
time([[Config for telescope-file-browser.nvim]], false)
-- Config for: cmp-nvim-lsp
time([[Config for cmp-nvim-lsp]], true)
try_loadstring("\27LJ\2\nZ\0\2\6\0\5\0\a6\2\0\0009\2\1\0029\2\2\2'\4\3\0005\5\4\0B\2\3\1K\0\1\0\1\0\1\fpattern\16LspAttached\tUser\23nvim_exec_autocmds\bapi\bvimå\2\1\0\b\0\19\0)5\0\a\0006\1\0\0'\3\1\0B\1\2\0029\1\2\0016\3\3\0009\3\4\0039\3\5\0039\3\6\3B\3\1\0A\1\0\2=\1\b\0003\1\t\0=\1\n\0006\1\0\0'\3\v\0B\1\2\0029\2\f\0016\3\3\0009\3\14\3'\5\15\0009\6\f\0019\6\r\6\18\a\0\0B\3\4\2=\3\r\0026\2\0\0'\4\v\0B\2\2\0029\2\16\0029\2\17\0024\4\0\0B\2\2\0016\2\0\0'\4\v\0B\2\2\0029\2\18\0029\2\17\0024\4\0\0B\2\2\1K\0\1\0\npylsp\nsetup\16clojure_lsp\nforce\20tbl_deep_extend\19default_config\tutil\14lspconfig\14on_attach\0\17capabilities\1\0\0\29make_client_capabilities\rprotocol\blsp\bvim\24update_capabilities\17cmp_nvim_lsp\frequire\0", "config", "cmp-nvim-lsp")
time([[Config for cmp-nvim-lsp]], false)
-- Config for: material.nvim
time([[Config for material.nvim]], true)
try_loadstring("\27LJ\2\n`\0\0\3\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\25colorscheme material\bcmd\vdarker\19material_style\6g\bvim\0", "config", "material.nvim")
time([[Config for material.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n¡\3\0\0\v\0\19\0.5\0\0\0006\1\1\0\18\3\0\0B\1\2\4H\4\f€'\6\2\0\18\a\4\0&\6\a\0066\a\3\0009\a\4\a9\a\5\a\18\t\6\0005\n\6\0=\5\a\n=\6\b\n=\6\t\nB\a\3\1F\4\3\3R\4ò6\1\3\0009\1\n\0019\1\v\0016\2\3\0009\2\n\0029\2\r\0026\4\3\0009\4\n\0049\4\v\0049\4\14\0045\5\15\0B\2\3\2=\2\f\0016\1\3\0009\1\n\0019\1\v\0016\2\3\0009\2\n\0029\2\r\0026\4\3\0009\4\n\0049\4\v\0049\4\17\0045\5\18\0B\2\3\2=\2\16\1K\0\1\0\1\0\1\vborder\frounded\19signature_help\31textDocument/signatureHelp\1\0\1\vborder\frounded\nhover\twith\23textDocument/hover\rhandlers\blsp\nnumhl\vtexthl\ttext\1\0\0\16sign_define\afn\bvim\19DiagnosticSign\npairs\1\0\4\nError\tï™™ \tHint\tï µ \tWarn\tï”© \tInfo\tï‘‰ \0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: telescope-ui-select.nvim
time([[Config for telescope-ui-select.nvim]], true)
try_loadstring("\27LJ\2\nN\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\14ui-select\19load_extension\14telescope\frequire\0", "config", "telescope-ui-select.nvim")
time([[Config for telescope-ui-select.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n¬\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\1\fenabled\2\21ensure_installed\1\0\1\17auto_install\2\1\4\0\0\blua\15javascript\fclojure\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nœ\1\0\0\4\0\6\0\0176\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0B\1\2\2\14\0\1\0X\2\5€9\1\4\0'\3\5\0B\1\2\2\19\1\1\0X\2\3€+\1\1\0X\2\1€+\1\2\0L\1\2\0\fComment\20in_syntax_group\fcomment\26in_treesitter_capture\23cmp.config.context\frequire…\6\1\0\n\0#\0T3\0\0\0007\0\1\0006\0\2\0'\2\3\0B\0\2\0029\1\4\0005\3\21\0009\4\5\0009\4\6\0049\4\a\0045\6\t\0009\a\5\0009\a\b\aB\a\1\2=\a\n\0069\a\5\0009\a\v\a)\tüÿB\a\2\2=\a\f\0069\a\5\0009\a\v\a)\t\4\0B\a\2\2=\a\r\0069\a\5\0009\a\14\aB\a\1\2=\a\15\0069\a\5\0009\a\16\aB\a\1\2=\a\17\0069\a\5\0009\a\18\a5\t\19\0B\a\2\2=\a\20\6B\4\2\2=\4\5\0034\4\5\0005\5\22\0006\6\1\0=\6\23\5>\5\1\0045\5\24\0006\6\1\0=\6\23\5>\5\2\0045\5\25\0006\6\1\0=\6\23\5>\5\3\0045\5\26\0006\6\1\0=\6\23\5>\5\4\4=\4\27\3B\1\2\0016\1\2\0'\3\3\0B\1\2\0029\1\4\0019\1\28\1'\3\29\0005\4\31\0004\5\3\0005\6\30\0>\6\1\5=\5\27\4B\1\3\0016\1\2\0'\3\3\0B\1\2\0029\1\4\0019\1\28\1'\3 \0005\4\"\0004\5\3\0005\6!\0>\6\1\5=\5\27\4B\1\3\1K\0\1\0\1\0\0\1\0\1\tname\vbuffer\6/\1\0\0\1\0\1\tname\fcmdline\6:\fcmdline\fsources\1\0\3\19max_item_count\3\n\19keyword_length\3\2\tname\tpath\1\0\3\19max_item_count\3\n\19keyword_length\3\2\tname\vbuffer\1\0\3\19max_item_count\3\n\19keyword_length\3\2\tname\fconjure\venable\1\0\3\19max_item_count\3\n\19keyword_length\3\2\tname\rnvim_lsp\1\0\0\t<CR>\1\0\1\vselect\1\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\16scroll_docs\n<tab>\1\0\0\21select_next_item\vinsert\vpreset\fmapping\nsetup\bcmp\frequire\24disable_in_comments\0\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
