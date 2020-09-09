if !exists('g:loaded_diagnostic')
  finish
endif

let g:diagnostic_enable_virtual_text = 1
let g:space_before_virtual_text = 3
let g:diagnostic_insert_delay = 0

sign define LspDiagnosticsErrorSign text=✖
sign define LspDiagnosticsWarningSign text=⚠
sign define LspDiagnosticsInforgmationSign text=I
sign define LspDiagnosticsHintSign text=➤

hi! LspDiagnosticsError guifg=#e43a21
hi! LspDiagnosticsWarning guifg=#ff7f03
hi! LspDiagnosticsInformationSign guifg=LightBlue
hi! link LspDiagnosticsInformation Comment
hi! LspDiagnosticsHint guifg=#22d85e
echo "loaded diagnostic settings"
