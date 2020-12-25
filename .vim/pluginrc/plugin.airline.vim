" Airline設定
" vim: fdm=marker ts=2


" *** Extensions/tabline ****************************************************************"{{{
" タブラインもAirline化
let g:airline#extensions#tabline#enabled = 1

" タブ先頭文字は連番+ウィンドウ数（0:ウィンドウ数／1:タブ番号）
let g:airline#extensions#tabline#tab_nr_type = 2

" タブの表示：ファイル名
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_splits = 1

" タブが1つの時にバッファリストが表示されているとタブっぽく見えて鬱陶しい
let g:airline#extensions#tabline#show_buffers = 0

" 右上の閉じるボタンいらない
let g:airline#extensions#tabline#show_close_button = 0
" ***************************************************************************************
"}}}

"" *** Extensions/tagbar ****************************************************************"{{{
"FIXME: tagbarの使用予定が無いので無効化。これを有効化する際はairlineに %{tagbar#currenttag('[%s] ','')} を追加すること
let g:airline#extensions#tagbar#enabled = 0
"" tagbarもAirlineしちゃおうよ
"let g:airline#extensions#tagbar#enabled = 1
"
"" 全部出す
"let g:airline#extensions#tagbar#flags = 'f'
"" ***************************************************************************************
"}}}

" 要powerlineパッチ済フォント"{{{
" 区切り文字を設定
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" シンボル文字を設定
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.crypt = ''
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
"}}}

" テーマ
let g:airline_theme='hybridline'

