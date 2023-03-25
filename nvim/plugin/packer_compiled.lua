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
local package_path_str = "C:\\Users\\OreoD\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?.lua;C:\\Users\\OreoD\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\OreoD\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\OreoD\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\OreoD\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\lua\\5.1\\?.so"
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
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    keys = { { "", "gc" }, { "", "gb" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["browse.nvim"] = {
    config = { "\27LJ\2\n¡\6\0\0\6\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\b\0005\5\a\0=\5\t\4=\4\n\0035\4\v\0=\4\f\3=\3\r\2B\0\2\1K\0\1\0\14bookmarks\vgithub\1\2\4\0\23https://github.com\16repo_search5https://github.com/search?q=%s&type=repositories\18issues_search/https://github.com/search?q=%s&type=issues\16code_search-https://github.com/search?q=%s&type=code\17pulls_search5https://github.com/search?q=%s&type=pullrequests\tcode\nregex\1\0\3\18stackoverflow\31https://stackoverflow.com/\tdocs\24https://devdocs.io/\15algorithms'https://www.algorithm-archive.org/\1\0\2\ttest\26https://regex101.com/\15cheatsheet\30https://quickref.me/regex\trust\1\0\3\fyoutube\24https://youtube.com\fdraw.io\30https://app.diagrams.net/\vtwitch\22https://twitch.tv\1\0\4\16docs crates\21https://docs.rs/\15cheatsheet\23https://cheats.rs/\tdocs$https://doc.rust-lang.org/book/\vcrates\23https://crates.io/\1\0\1\rprovider\vgoogle\nsetup\vbrowse\frequire\0" },
    loaded = true,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\browse.nvim",
    url = "https://github.com/lalitmee/browse.nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-buffer\\after\\plugin\\cmp_buffer.lua" },
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    after_files = { "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-cmdline\\after\\plugin\\cmp_cmdline.lua" },
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-nvim-lsp\\after\\plugin\\cmp_nvim_lsp.lua" },
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    after_files = { "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-path\\after\\plugin\\cmp_path.lua" },
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    after_files = { "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-vsnip\\after\\plugin\\cmp_vsnip.lua" },
    load_after = {
      ["vim-vsnip"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["crates.nvim"] = {
    after_files = { "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\crates.nvim\\after\\plugin\\cmp_crates.lua" },
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vcrates\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\crates.nvim",
    url = "https://github.com/saecki/crates.nvim"
  },
  delimitMate = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\"let delimitMate_expand_cr = 1\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\delimitMate",
    url = "https://github.com/Raimondi/delimitMate"
  },
  ["fidget.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["friendly-snippets"] = {
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  harpoon = {
    config = { "\27LJ\2\n&\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\1\0B\0\2\1K\0\1\0\1À\rnav_file&\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\2\0B\0\2\1K\0\1\0\1À\rnav_file&\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\3\0B\0\2\1K\0\1\0\1À\rnav_file&\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\4\0B\0\2\1K\0\1\0\1À\rnav_fileÇ\2\1\0\a\0\19\00026\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\a\0009\6\b\0B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\t\0009\6\n\1B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\v\0003\6\f\0B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\r\0003\6\14\0B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\15\0003\6\16\0B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\17\0003\6\18\0B\2\4\0012\0\0€K\0\1\0\0\n<C-s>\0\n<C-n>\0\n<C-t>\0\n<C-h>\22toggle_quick_menu\n<C-e>\radd_file\14<leader>a\6n\bset\vkeymap\bvim\15harpoon.ui\17harpoon.mark\frequire\0" },
    loaded = true,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["hop.nvim"] = {
    commands = { "HopWord", "HopLine", "HopPattern", "HopWordAC", "HopWordCurrentLine", "HopWordBC", "HopWordMW", "HopLineStart", "HopVertical", "HopChar1", "HopChar2" },
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugin.hop_setup\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26plugin.lsp_sig_config\frequire\0" },
    loaded = true,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\nà\2\0\0\5\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\0016\0\b\0009\0\t\0'\2\n\0B\0\2\1K\0\1\0@            hi! LspSagaWinbarSep guifg=#ebdbb2\n            \bcmd\bvim\aui\1\0\0\vcolors\1\0\0\1\0\f\tblue\f#458588\vorange\f#d65d0e\nwhite\f#ebdbb2\fmagenta\f#d79921\bred\f#cc241d\nblack\f#1d2021\rtitle_bg\f#ebdbb2\vpurple\f#d79921\14normal_bg\f#32302f\tcyan\f#83a598\ngreen\f#98971a\vyellow\f#d79921\nsetup\flspsaga\frequire\0" },
    loaded = true,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26plugin.lualine_config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["numb.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tnumb\frequire\0" },
    loaded = true,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\numb.nvim",
    url = "https://github.com/nacro90/numb.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nÄ\2\0\0\4\0\n\0\0166\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\0016\0\3\0'\2\5\0B\0\2\0029\0\6\0005\2\b\0005\3\a\0=\3\t\2B\0\2\1K\0\1\0\vwindow\1\0\0\1\0\3\vborder\vsingle\rrelative\veditor\nblend\3\0\nsetup\vfidget\22plugin.cmp_config\frequirež\1                        PackerLoad lspkind.nvim cmp-cmdline cmp-path cmp-buffer vim-vsnip cmp-nvim-lsp friendly-snippets fidget.nvim\n                    \bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-highlight-colors"] = {
    config = { "\27LJ\2\n‚\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\vrender\15background\20enable_tailwind\1\24enable_named_colors\2\nsetup\26nvim-highlight-colors\frequire\0" },
    loaded = true,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-highlight-colors",
    url = "https://github.com/brenoprata10/nvim-highlight-colors"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugin.lsp_setup\frequire\0" },
    loaded = true,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-nu"] = {
    config = { "\27LJ\2\nI\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\21use_lsp_features\1\nsetup\anu\frequire\0" },
    loaded = true,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-nu",
    url = "https://github.com/LhKipp/nvim-nu"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-transparent"] = {
    config = { "\27LJ\2\n§\1\0\0\4\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0025\3\5\0=\3\6\2B\0\2\1K\0\1\0\fexclude\1\5\0\0\15FidgetTask\16FidgetTitle\16FloatShadow\23FloatShadowThrough\17extra_groups\1\0\1\venable\2\nsetup\16transparent\frequire\0" },
    loaded = true,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-transparent",
    url = "https://github.com/xiyaowong/nvim-transparent"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29plugin.treesitter_config\frequire\0" },
    loaded = true,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nC\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rust.vim"] = {
    loaded = true,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\rust.vim",
    url = "https://github.com/rust-lang/rust.vim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20symbols-outline\frequire\0" },
    loaded = true,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28plugin.telescope_config\frequire\0" },
    loaded = true,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-floaterm"] = {
    commands = { "FloatermNew", "FloatermKill" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-gruvbox8"] = {
    config = { "\27LJ\2\n›\2\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0û\1            let g:gruvbox_filetype_hi_groups = 1\n            let g:gruvbox_plugin_hi_groups = 1\n            let g:gruvbox_italics = 0\n            let g:gruvbox_bold = 1\n            set background=dark\n            colorscheme gruvbox8\n            \bcmd\bvim\0" },
    loaded = true,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-gruvbox8",
    url = "https://github.com/lifepillar/vim-gruvbox8"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-vsnip"] = {
    after = { "cmp-vsnip" },
    loaded = false,
    needs_bufread = true,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["vim-wakatime"] = {
    loaded = true,
    path = "C:\\Users\\OreoD\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-wakatime",
    url = "https://github.com/wakatime/vim-wakatime"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^nvim%-web%-devicons"] = "nvim-web-devicons",
  ["^plenary"] = "plenary.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28plugin.telescope_config\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-highlight-colors
time([[Config for nvim-highlight-colors]], true)
try_loadstring("\27LJ\2\n‚\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\vrender\15background\20enable_tailwind\1\24enable_named_colors\2\nsetup\26nvim-highlight-colors\frequire\0", "config", "nvim-highlight-colors")
time([[Config for nvim-highlight-colors]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29plugin.treesitter_config\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: numb.nvim
time([[Config for numb.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tnumb\frequire\0", "config", "numb.nvim")
time([[Config for numb.nvim]], false)
-- Config for: nvim-transparent
time([[Config for nvim-transparent]], true)
try_loadstring("\27LJ\2\n§\1\0\0\4\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0025\3\5\0=\3\6\2B\0\2\1K\0\1\0\fexclude\1\5\0\0\15FidgetTask\16FidgetTitle\16FloatShadow\23FloatShadowThrough\17extra_groups\1\0\1\venable\2\nsetup\16transparent\frequire\0", "config", "nvim-transparent")
time([[Config for nvim-transparent]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20symbols-outline\frequire\0", "config", "symbols-outline.nvim")
time([[Config for symbols-outline.nvim]], false)
-- Config for: harpoon
time([[Config for harpoon]], true)
try_loadstring("\27LJ\2\n&\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\1\0B\0\2\1K\0\1\0\1À\rnav_file&\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\2\0B\0\2\1K\0\1\0\1À\rnav_file&\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\3\0B\0\2\1K\0\1\0\1À\rnav_file&\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\4\0B\0\2\1K\0\1\0\1À\rnav_fileÇ\2\1\0\a\0\19\00026\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\a\0009\6\b\0B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\t\0009\6\n\1B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\v\0003\6\f\0B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\r\0003\6\14\0B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\15\0003\6\16\0B\2\4\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\17\0003\6\18\0B\2\4\0012\0\0€K\0\1\0\0\n<C-s>\0\n<C-n>\0\n<C-t>\0\n<C-h>\22toggle_quick_menu\n<C-e>\radd_file\14<leader>a\6n\bset\vkeymap\bvim\15harpoon.ui\17harpoon.mark\frequire\0", "config", "harpoon")
time([[Config for harpoon]], false)
-- Config for: nvim-nu
time([[Config for nvim-nu]], true)
try_loadstring("\27LJ\2\nI\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\21use_lsp_features\1\nsetup\anu\frequire\0", "config", "nvim-nu")
time([[Config for nvim-nu]], false)
-- Config for: vim-gruvbox8
time([[Config for vim-gruvbox8]], true)
try_loadstring("\27LJ\2\n›\2\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0û\1            let g:gruvbox_filetype_hi_groups = 1\n            let g:gruvbox_plugin_hi_groups = 1\n            let g:gruvbox_italics = 0\n            let g:gruvbox_bold = 1\n            set background=dark\n            colorscheme gruvbox8\n            \bcmd\bvim\0", "config", "vim-gruvbox8")
time([[Config for vim-gruvbox8]], false)
-- Config for: browse.nvim
time([[Config for browse.nvim]], true)
try_loadstring("\27LJ\2\n¡\6\0\0\6\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\b\0005\5\a\0=\5\t\4=\4\n\0035\4\v\0=\4\f\3=\3\r\2B\0\2\1K\0\1\0\14bookmarks\vgithub\1\2\4\0\23https://github.com\16repo_search5https://github.com/search?q=%s&type=repositories\18issues_search/https://github.com/search?q=%s&type=issues\16code_search-https://github.com/search?q=%s&type=code\17pulls_search5https://github.com/search?q=%s&type=pullrequests\tcode\nregex\1\0\3\18stackoverflow\31https://stackoverflow.com/\tdocs\24https://devdocs.io/\15algorithms'https://www.algorithm-archive.org/\1\0\2\ttest\26https://regex101.com/\15cheatsheet\30https://quickref.me/regex\trust\1\0\3\fyoutube\24https://youtube.com\fdraw.io\30https://app.diagrams.net/\vtwitch\22https://twitch.tv\1\0\4\16docs crates\21https://docs.rs/\15cheatsheet\23https://cheats.rs/\tdocs$https://doc.rust-lang.org/book/\vcrates\23https://crates.io/\1\0\1\rprovider\vgoogle\nsetup\vbrowse\frequire\0", "config", "browse.nvim")
time([[Config for browse.nvim]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26plugin.lsp_sig_config\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugin.lsp_setup\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\nà\2\0\0\5\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\0016\0\b\0009\0\t\0'\2\n\0B\0\2\1K\0\1\0@            hi! LspSagaWinbarSep guifg=#ebdbb2\n            \bcmd\bvim\aui\1\0\0\vcolors\1\0\0\1\0\f\tblue\f#458588\vorange\f#d65d0e\nwhite\f#ebdbb2\fmagenta\f#d79921\bred\f#cc241d\nblack\f#1d2021\rtitle_bg\f#ebdbb2\vpurple\f#d79921\14normal_bg\f#32302f\tcyan\f#83a598\ngreen\f#98971a\vyellow\f#d79921\nsetup\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'HopPattern', function(cmdargs)
          require('packer.load')({'hop.nvim'}, { cmd = 'HopPattern', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'hop.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('HopPattern ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'HopWordAC', function(cmdargs)
          require('packer.load')({'hop.nvim'}, { cmd = 'HopWordAC', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'hop.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('HopWordAC ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'HopWordCurrentLine', function(cmdargs)
          require('packer.load')({'hop.nvim'}, { cmd = 'HopWordCurrentLine', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'hop.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('HopWordCurrentLine ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'HopWordBC', function(cmdargs)
          require('packer.load')({'hop.nvim'}, { cmd = 'HopWordBC', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'hop.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('HopWordBC ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'HopWordMW', function(cmdargs)
          require('packer.load')({'hop.nvim'}, { cmd = 'HopWordMW', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'hop.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('HopWordMW ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'HopLineStart', function(cmdargs)
          require('packer.load')({'hop.nvim'}, { cmd = 'HopLineStart', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'hop.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('HopLineStart ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'HopVertical', function(cmdargs)
          require('packer.load')({'hop.nvim'}, { cmd = 'HopVertical', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'hop.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('HopVertical ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'HopChar1', function(cmdargs)
          require('packer.load')({'hop.nvim'}, { cmd = 'HopChar1', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'hop.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('HopChar1 ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'HopChar2', function(cmdargs)
          require('packer.load')({'hop.nvim'}, { cmd = 'HopChar2', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'hop.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('HopChar2 ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'FloatermKill', function(cmdargs)
          require('packer.load')({'vim-floaterm'}, { cmd = 'FloatermKill', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-floaterm'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('FloatermKill ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'FloatermNew', function(cmdargs)
          require('packer.load')({'vim-floaterm'}, { cmd = 'FloatermNew', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-floaterm'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('FloatermNew ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'HopWord', function(cmdargs)
          require('packer.load')({'hop.nvim'}, { cmd = 'HopWord', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'hop.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('HopWord ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'HopLine', function(cmdargs)
          require('packer.load')({'hop.nvim'}, { cmd = 'HopLine', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'hop.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('HopLine ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> gb <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gb", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gc <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'lualine.nvim'}, { event = "BufEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufCreate * ++once lua require("packer.load")({'lualine.nvim'}, { event = "BufCreate *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-cmp', 'delimitMate'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead Cargo.toml ++once lua require("packer.load")({'crates.nvim'}, { event = "BufRead Cargo.toml" }, _G.packer_plugins)]]
vim.cmd [[au CmdlineEnter * ++once lua require("packer.load")({'nvim-cmp'}, { event = "CmdlineEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

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
