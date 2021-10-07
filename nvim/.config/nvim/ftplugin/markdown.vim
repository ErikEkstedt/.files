" click enter on [[my_link]] or [[[my_link]]] to enter it
" vim.api.nvim_set_keymap("n", "<CR>", '<cmd>lua require"neuron".enter_link()<CR>', {noremap = true, silent = true})
nmap <silent> <buffer> <CR> <cmd>lua require('neuron').enter_link()<CR>
