if exists('g:loaded_session') | finish | endif " prevent loading file twice
let s:save_cpo = &cpo " save user coptions
set cpo&vim " reset them to defaults


let LuaSessionSave = luaeval('require("custom.session").SessionSave')
let LuaSessionLoad = luaeval('require("custom.session").SessionLoad')
let LuaSessionOnVimLeave = luaeval('require("custom.session").SessionOnVimLeave')
let LuaSessionOnVimEnter = luaeval('require("custom.session").SessionOnVimEnter')

command! -nargs=* SessionSave call LuaSessionSave(expand('<args>'))
command! -nargs=* SessionLoad call LuaSessionLoad(expand('<args>'))

augroup session
  autocmd!
  autocmd VimEnter * nested call LuaSessionOnVimEnter()
  autocmd VimLeave * call LuaSessionOnVimLeave()
augroup end


let &cpo = s:save_cpo " and restore after
unlet s:save_cpo

let g:loaded_session = 1

