require'nvim-treesitter.configs'.setup {
  -- ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {'c','cpp','html','css','dart','java','javascript','python','lua','typescript','json'}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}

require "nvim-treesitter.configs".setup {
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false -- Whether the query persists across vim sessions
  }
}

require'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true
  }
}
-- require'bufferline'.setup{}
require'bufferline'.setup{
  options = {
   diagnostics =  "nvim_lsp",
   diagnostics_indicator = function(count, level)
      return "("..count..")"
    end
  }
}
