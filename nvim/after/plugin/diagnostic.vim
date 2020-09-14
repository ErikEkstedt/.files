" https://github.com/nvim-lua/diagnostic-nvim
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_virtual_text_prefix = ' '
let g:space_before_virtual_text = 5
let g:diagnostic_insert_delay = 1

nnoremap <C-j> :NextDiagnosticCycle<cr>
nnoremap <C-k> :PrevDiagnosticCycle<cr>

" " greg hurell
sign define LspDiagnosticsErrorSign text=✖
sign define LspDiagnosticsWarningSign text=⚠
sign define LspDiagnosticsInforgmationSign text=ℹ
sign define LspDiagnosticsHintSign text=➤

highlight LspDiagnosticsError guifg=#e43a21
highlight LspDiagnosticsWarning guifg=#db8d23
hi! LspDiagnosticsInformationSign guifg=LightBlue
hi! link LspDiagnosticsInformation Comment
highlight LspDiagnosticsHint gui=bold,italic,underline guifg=#22d85e
