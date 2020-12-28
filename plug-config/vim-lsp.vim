let g:lsp_signs_enabled = 0         
let g:lsp_diagnostics_echo_cursor = 1 
let g:lsp_virtual_text_enabled = 0
let g:lsp_signs_error = {'text': ''}
let g:lsp_signs_warning = {'text': '',} 
let g:lsp_signs_hint = {'text': '',} 
let g:lsp_signs_information = {'text':''} 
let g:lsp_settings = {
    \ 'analysis-server-dart-snapshot': {
    \     'cmd': [
    \         '/home/sirpicsa/snap/flutter/common/flutter/bin/cache/dart-sdk/bin/dart',
    \         '/home/sirpicsa/snap/flutter/common/flutter/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot',
    \         '--lsp'
    \     ],
    \ },
\ }
