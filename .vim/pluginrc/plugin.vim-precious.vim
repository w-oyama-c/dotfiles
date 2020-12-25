" vim-precious設定
" vim: fdm=marker ts=2

" html <-> javascript/css/phpの切り替えオプション
let g:context_filetype#filetypes = {
  \ 'html': [
  \    {
  \      'start':    '<script\%( [^>]*\)\? type="text/javascript"\%( [^>]*\)\?>',
  \      'end':      '</script>',
  \      'filetype': 'javascript',
  \    },
  \    {
  \      'start':    '<style\%( [^>]*\)\? type="text/css"\%( [^>]*\)\?>',
  \      'end':      '</style>',
  \      'filetype': 'css',
  \    },
  \    {
  \      'start':    '<?php\?',
  \      'end':      '?>',
  \      'filetype': 'php',
  \    }
  \ ],
\}
