" vim: ts=2 fdm=marker

" ターミナル"{{{
set t_Co=256
"}}}

" エンコーディング"{{{
" 下記の指定は環境によって文字化けする可能性があるので適宜変更する
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set fileencoding=utf-8
set termencoding=utf-8
"}}}

" ファイル操作周り"{{{
set hidden                " ファイル変更中でも他のファイルを開けるようにする
set autoread              " ファイル内容が変更されると自動読み込みする
set browsedir=buffer      " ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set clipboard=unnamed     " クリップボードを利用する
set backupcopy=yes        " 更新内容を元ファイルに上書きする
"}}}

" 画面表示系"{{{
set number            " 行番号を表示する
set numberwidth=7     " 行番号表示幅
set title             " 編集中のファイル名を表示する
set showcmd           " 入力中のコマンドを表示する
set ruler             " 座標を表示する
set showmatch         " 閉じ括弧の入力時に対応する括弧を表示する
set matchtime=3       " showmatchの表示時間
set laststatus=2      " ステータスラインを常に表示する
set guioptions+=b     " 横スクロールバーを表示
set nowrap            " 折り返さない
"}}}

" ウィンドウ系"{{{
set splitbelow        " 新ウィンドウ(h)は下へ
set splitright        " 新ウィンドウ(v)は右へ
"}}}

" カーソル"{{{
set cursorline            " カーソル行をハイライト
set guicursor=a:blinkon0  " カーソルを点滅しない
"}}}

" 行区切り文字"{{{
if has('mac')
  set fileformats=unix,dos
" set fileformat=mac
  set fileformat=unix       " MacでもLFがいい
elseif has('unix')
  set fileformats=unix,dos
  set fileformat=unix
else
  set fileformats=dos,unix
  set fileformat=dos
endif
"}}}

" バックアップ／スワップ／Undoなどの管理"{{{
set history=1000                " 履歴保存数
set backupdir=~/.vim/backup     " バックアップディレクトリ
set directory=~/.vim/backup     " スワップファイルディレクトリ
set undodir=~/.vim/undo         " undo情報の保持ファイルディレクトリ
"}}}

" 検索"{{{
set noincsearch     " インクリメンタルサーチは嫌
set hlsearch        " 検索結果をハイライトする
set ignorecase      " 検索時に文字の大小を区別しない
set smartcase       " ただし検索時に大文字を含んでいたら大小を区別する
set wrapscan        " 検索をファイル内でループする
"}}}

" インデント"{{{
set autoindent
set smartindent
set cindent
set nocopyindent    " 貼り付け時は自動インデントしないでね
"}}}

" タブ関係"{{{
set shiftwidth=2                " 行頭での<Tab>の幅
set tabstop=2                   " 行頭以外での<Tab>の幅
set expandtab                   " インデントはスペースにしたい
set softtabstop=2               " <Tab>が対応する<Space>の数
set backspace=                  " BSキーの挙動
set backspace+=start            "   挿入モード開始時のテキスト
set backspace+=eol              "   行頭からのBS
set backspace+=indent           "   オートインデントのインデント
"set whichwrap=b,s,h,l,<,>,[,]  " カーソルを行頭、行末で止まらないようにする
"}}}

" 折りたたみ"{{{
set foldlevel=3       " 3階層くらいまでは開いておきたい
"}}}

" grep"{{{
if has("win32") || has("win64")
  " -a: バイナリファイルも検索／-r: 再起／-n: 行番号出力／-H: ファイル名出力
  set grepprg=C:/Program\ Files/Git/mingw64/bin/x86_64-w64-mingw32-agrep.exe\ -arnH
  set grepprg+=\ --exclude-dir=.svn\ --exclude-dir=.git
endif
" grepポスト処理
augroup greps
  autocmd!
  autocmd QuickfixCmdPost vimgrep copen
  autocmd QuickfixCmdPost grep copen
augroup END
"}}}

" テキスト折り返し"{{{
set formatoptions=q
autocmd FileType * setlocal textwidth=0
" ↑単純にset formatoptionsするだけでは、デフォルト設定ファイルに負けちゃうらしい。
" 参考: http://chroju89.hatenablog.jp/entry/2013/07/23/220013
"}}}

" 対応カッコの移動 ※全角カッコはmatchitで対応させる"{{{
set matchpairs=(:),{:},[:],<:>
set matchpairs+=（:）,「:」,｛:｝,【:】,『:』,［:］,〈:〉,《:》,〔:〕,〘:〙,〚:〛
"}}}

" 空白文字を表示"{{{
set list            "タブ、行末等の不可視文字を表示する
set listchars=tab:^\ ,trail:_,eol:$,extends:\\,precedes:<

scriptencoding utf-8 "全角スペースを認識させるためにファイルのエンコーディングを指定する！
augroup highlightZenkakuSpace " 全角スペースをエラーテキスト表示
  autocmd!
  autocmd VimEnter,ColorScheme * highlight link ZenkakuSpace Error
  autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
augroup END
"}}}

" タブ数切り替え"{{{
command! -nargs=? Sett call s:setTab(<f-args>)
"}}}

" コマンドをクリップボードにコピー（リダイレクト）"{{{
command! -nargs=1 -complete=command Copycmd call <SID>redirectCommandToClipboard(<q-args>)
"}}}

" **** キーリマップ **********************************************************************"{{{
" <Leader>をスペースキーにする
let mapleader = "\<Space>"

" ===map系=================================="{{{
" open-browserプラグインをgxで
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
"}}}

" ===ノーマルモード========================="{{{
" 検索結果のハイライトを画面描画時に同時にクリアする
nnoremap <silent> <C-L> :noh<CR><C-L>

" タブ切り替え
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT

" カーソルキーは画面スクロール
nnoremap <up> <C-Y>
nnoremap <down> <C-E>
nnoremap <left> zh
nnoremap <right> zl

" 検索にはvery magicを使う
nnoremap / /\v

" 直前のヤンクレジスタでもう一度貼り付け
nnoremap <silent> gp "0p
nnoremap <silent> gP "0P
"}}}

" ===挿入モード============================="{{{
" 'Ctr-*'でEmacsっぽい移動を可能にする
inoremap <C-F> <right>
inoremap <C-B> <left>
inoremap <C-P> <up>
inoremap <C-N> <down>
inoremap <C-A> <home>

"inoremap <C-E> <end>   " ^eは「下の行コピー」と被ってたのであきらめる
inoremap <C-D> <del>

" カーソルキーは画面スクロール
inoremap <silent> <up> <C-O><C-Y>
inoremap <silent> <down> <C-O><C-E>
inoremap <silent> <left> <C-O>zl
inoremap <silent> <right> <C-O>zh

" 挿入モード中は 'Ctrl+S' で保存したい
inoremap <silent> <C-S> <C-O>:w<CR>

" 日付／時刻挿入
" F11 => 9999/99/99 (日)
inoremap <F11> <C-R>=strftime('%Y-%m-%d (%a)')<CR>
" F12 => 99:99
inoremap <F12> <C-R>=strftime('%H:%M')<CR>
"}}}

" ===ビジュアルモード======================="{{{
" 'Ctrl+X' で切り取られちゃうのいや。あとビジュアル解除しないで
vnoremap <C-A> g<C-A>gv
vnoremap <C-X> g<C-X>gv

" インデント操作後にビジュアル解除しないで
vnoremap < <gv
vnoremap > >gv

" 直前のヤンクレジスタでもう一度貼り付け
vnoremap <silent> gp "0p
vnoremap <silent> gP "0P
"}}}
" ****************************************************************************************"}}}

" matchitを有効化"{{{
" %での対応カッコ移動機能を強化（デフォルトバンドル）
runtime macros/matchit.vim
let b:match_ignorecase=1      " 大文字小文字を区別させない

scriptencoding utf-8    " ファイルの先頭に置いたら効かなかったので念のためここでも
" matchitのペア設定
augroup matchitSetting
  autocmd!
  autocmd BufEnter,FileType * call s:set_match_words()
augroup END
"}}}

" **** Dein *******************************************************************************"{{{
" VimEnter前のみ
if has('vim_starting')
  " vi互換をオフ
  if &compatible
    set nocompatible
  endif

  " プラグインが実際にインストールされるディレクトリ
  let s:dein_dir = expand('~/.vim/dein')
  " dein.vim 本体
  let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

  " dein.vim がなければ github から落としてくる
  if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . s:dein_repo_dir
  endif

  " 設定開始
  if dein#load_state(s:dein_dir)
    " プラグインリストを収めた TOML ファイル
    " 予め TOML ファイル（後述）を用意しておく
    let g:rc_dir    = expand('~/.vim/dein')
    let s:toml      = g:rc_dir . '/dein.toml'
    let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

    " tomlをパラメータに設定することで、変更があった場合に自動でキャッシュを削除する
    " デフォルト値の$MYVIMRCも含ませておく。
    call dein#begin(s:dein_dir, [$MYVIMRC, s:toml, s:lazy_toml])

    " tomlを読み込み、キャッシュしておく
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    " 設定終了
    call dein#end()
    call dein#save_state()
  endif

  " もし、未インストールものものがあったらインストール
  if dein#check_install()
    call dein#install()
  endif
endif
" ****************************************************************************************
"}}}

"**** pluginrc ***************************************************************************"{{{
" 読み込む外部設定ファイルを定義
let s:pluginrc_files = [
  \ '~/.vim/pluginrc/plugin.unite.vim',
  \ '~/.vim/pluginrc/plugin.rgrep.vim',
  \ '~/.vim/pluginrc/plugin.nerdtree.vim',
  \ '~/.vim/pluginrc/plugin.neocomplete.vim',
  \ '~/.vim/pluginrc/plugin.airline.vim',
  \ '~/.vim/pluginrc/plugin.tagbar.vim',
  \ '~/.vim/pluginrc/plugin.winresizer.vim',
  \ '~/.vim/pluginrc/plugin.fastfold.vim',
  \ '~/.vim/pluginrc/plugin.vim-indent-guides.vim',
  \ '~/.vim/pluginrc/plugin.vim-precious.vim',
  \ '~/.vim/pluginrc/plugin.vimproc.vim',
  \ '~/.vim/pluginrc/plugin.previm.vim',
  \ '~/.vim/pluginrc/plugin.vim-operator-surround.vim',
\]

" 定義したファイルを読み込める場合はsourceする
for s:pluginrc in s:pluginrc_files
  if filereadable(expand(s:pluginrc))
    execute 'source ' . s:pluginrc
  endif
endfor
" ****************************************************************************************
"}}}

"**** functions **************************************************************************"{{{
scriptencoding utf-8    " ファイルの先頭に置いたら効かなかったので念のためここでも
" matchitの設定"{{{
function! s:set_match_words()
  " 対応するカッコたち
  let words = ['（:）', '「:」', '｛:｝', '【:】', '『:』', '［:］', '〈:〉', '《:》', '〔:〕', '〘:〙', '〚:〛']

  if exists('b:match_words')
    for w in words
      if b:match_words !~ '\V' . w
        let b:match_words .= ',' . w
      endif
    endfor
  else
    let b:match_words = join(words, ',')
  endif
endfunction
"}}}

" タブ関係の設定を変更できる"{{{
function! s:setTab(...)
  " パラメータがない場合は2タブにする
  if a:0 >= 1
    let tabs = a:1
  else
    let tabs = 2
  end

  let &l:sts=tabs
  let &l:ts=tabs
  let &l:sw=tabs
endfunction
"}}}

" コマンド結果をクリップボードにコピー"{{{
function! s:redirectCommandToClipboard(command)
  redir @*>
  silent execute a:command
  redir END
endfunction
"}}}
" ****************************************************************************************
"}}}

" 画面色"{{{
colorscheme arcenix     " オレオレカラーを
set background=dark     " ダークテーマで。
syntax on               " シンタックスカラーリングを設定する
"}}}
