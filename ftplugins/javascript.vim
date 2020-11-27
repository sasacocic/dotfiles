" basically just put this shit here so I can have formatting
let g:neoformat_javascript_prettier = {
      \ 'exe': './node_modules/.bin/prettier',
      \ 'args': ['--write', '--config .prettierrc'],
      \ 'replace': 1
      \ }

" again I don't have a clue what this does, but it works
" so i'm going to leave it for now
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

