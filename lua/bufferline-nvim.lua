require'bufferline'.setup{
options = {
 diagnostics =  "nvim_lsp",
 diagnostics_indicator = function(count, level)
		return "("..count..")"
	end
}
}

require('bufdel').setup {
  next = 'alternate'  -- or 'cycle'
}
