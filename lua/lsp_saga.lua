local saga = require'lspsaga'

saga.init_lsp_saga {
use_saga_diagnostic_sign = true,
error_sign = '',
warn_sign = '',
hint_sign = '',
infor_sign = '',
error_header = "  Error",
warn_header = "  Warn",
hint_header = "  Hint",
infor_header = "  Infor",
max_diag_msg_width = 50,
code_action_icon = ' ',
finder_definition_icon = '  ',
finder_reference_icon = '  ',
finder_action_keys = {
  open = 'o', vsplit = 's',split = 'i',quit = 'q'
},
definition_preview_icon = '  ',
border_style = 1,
rename_prompt_prefix = '➤',
}
