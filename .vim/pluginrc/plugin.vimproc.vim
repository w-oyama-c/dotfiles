" vimproc設定
" vim: fdm=marker ts=2


" dll参照位置位置定義"{{{
if has("mac")
  let g:vimproc#dll_path = '~/.vim/dein/.dein/lib/vimproc_mac.so'
elseif has("win64")
  let g:vimproc#dll_path = '~/.vim/dein/.dein/lib/vimproc_win64.dll'
elseif has("win32")
  let g:vimproc#dll_path = '~/.vim/dein/.dein/lib/vimproc_win32.dll'
endif
"}}}
"
