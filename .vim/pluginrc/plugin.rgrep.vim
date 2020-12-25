" RGrep設定
" vim: fdm=marker ts=2


" コマンド位置定義"{{{
if has("mac")
  " ネイティブのコマンドを使うように設定
  let Grep_Path = '/usr/bin/grep'
  let Grep_Xargs_Path = '/usr/bin/xargs'
  let Grep_Find_Path = '/usr/bin/find'
elseif has("win32") || has("win64")
  " Cygwinのコマンドを使うように設定
  let Grep_Path = 'D:\tools\Cygwin64\bin\grep.exe'
  let Grep_Xargs_Path = 'D:\tools\Cygwin64\bin\xargs.exe'
  let Grep_Find_Path = 'D:\tools\Cygwin64\bin\find.exe'
  let Grep_Shell_Quote_Char = '"'     " 文字列リテラル＝ダブルクォート
endif
"}}}

let Grep_Skip_Dirs = '.svn .git'              " Ignore Directories
let Grep_Default_Options = '-I'               " Ignore Binary Files
let Grep_Skip_Files = '*.bak *~ .DS_Store'    " Ignore Files
