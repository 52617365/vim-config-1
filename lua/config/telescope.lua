--------------
-- Mappings --
--------------
-- Trouble and telescope integration.
local trouble = require("trouble.providers.telescope")
-- Telescope.nvim
require('telescope').setup {
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = ' >',
    color_devicons = true,
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble, ["<C-h>"] = require 'telescope'.extensions.send_to_harpoon.actions.send_selected_to_harpoon },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
    },
    project = {
      base_dirs = { '~/dev/file_analyzer/src', max_depth = 2,
        { '~/dev/Elasticsearch-Parser/src', max_depth = 2 },
        { '~/dev/work/site', max_depth = 2 },
        { '~/.config/nvim/lua', max_depth = 2 },
      },
      hidden_files = false, -- default: false
      theme = "dropdown",
    },
    telescope_browser = {
      docs_urls = {
        ["lua"] = [["https://www.google.com/search?q=%s&as_sitesearch=lua.org/manual/5.4"]],
        ["rust"] = [["https://doc.rust-lang.org/std/index.html?search=%s"]],
        ["cpp"] = [["https://www.google.com/search?q=%s&as_sitesearch=cppreference.com"]],
        ["c"] = [["https://www.google.com/search?q=%s&as_sitesearch=cppreference.com"]],
        ["java"] = [["https://docs.oracle.com/search/?q=%s&category=java&product=en%3Fjava"]],
        ["javascript"] = [["https://developer.mozilla.org/en-US/search?q=%s"]],
        ["php"] = [["https://www.php.net/manual-lookup.php?pattern=%s&scope=quickref"]],
        ["vim"] = [["https://vim.fandom.com/wiki/Special:Search?query=%s&scope=internal&contentType=&ns%5B0%5D=0"]],
        ["kotlin"] = [["https://kotlinlang.org/docs/home.html?q=%s&s=full"]],
      }
    }
  }
}
require('telescope').load_extension('fzy_native')
-- For project management.
require('telescope').load_extension('project')
-- My own extension for browser searching
--require('telescope').load_extension('telescopebrowser')
require('telescope').load_extension('send_to_harpoon')
