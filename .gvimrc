" vim: ts=2 fdm=marker

" 画面表示系"{{{
if has('mac')
  set columns=165     " ウィンドウの幅
  set lines=57        " ウィンドウの高さ
else
  set columns=235     " ウィンドウの幅
  set lines=62        " ウィンドウの高さ
endif

" 半透明isかっこいい
if has('mac')
  set transparency=4
elseif has('win32') || has('win64')
  autocmd GUIEnter * set transparency=242
endif
"}}}

" フォント設定"{{{
if has('mac')
  " ASCII文字
  set guifont=Cica:h12
  " マルチバイト文字
  set guifontwide=Cica:h12
elseif has('win32') || has('win64')
  " ASCII文字
  set guifont=Cica:h9:cSHIFTJIS:qDRAFT
  " マルチバイト文字
  set guifontwide=Cica:h9:cSHIFTJIS:qDRAFT
endif

" ツールバーを表示しない
set guioptions-=T
" メニューバーも表示しない
set guioptions-=m
" 横スクロールバーは表示したい
set guioptions+=b
"}}}

" タブエディタ化する"{{{
set showtabline=2         " 2:常に表示
if has('mac')
  " ⌘ + , で設定から常にタブで開くよう変えられます
elseif has('win')
  " 以下のレジストリを編集する
  "  /HKEY_CLASSES_ROOT/Applications/gvim.exe/shell/edit/command
  "  値を $VIM\gvim.exe -p --remote-tab-silent “%1″
  "  ※$VIMの箇所にはVimのルートディレクトリ
  "  ルートディレクトリはVimを起動後、:echo $VIMを実行で確認
endif
"}}}
"}}}
