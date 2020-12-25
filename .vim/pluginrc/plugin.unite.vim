" Unite設定
" vim: fdm=marker ts=2


" デフォルトオプションを設定"{{{
call unite#custom#profile('default', 'context', {
  \ 'no_auto_resize': 1,
  \ 'no-hide-icon': 1,
  \ 'ignorecase': 1,
  \ 'smartcase': 1,
  \ 'quit': 0,
  \ 'direction': 'belowright',
  \ 'winheight': 10,
\ })
"}}}

" grep"{{{
call unite#custom#profile('source/grep', 'context', {
  \ 'wrap': 1,
  \ 'multi-line': 0,
\ })
autocmd FileType unite set nowrap
"}}}

" アウトラインは横に出そう"{{{
call unite#custom#profile('source/outline', 'context', {
  \ 'vertical': 1,
  \ 'winwidth': 50,
\ })
"}}}

" :Unite outlineって長い。
command! Outline Unite outline

