" -----------------------------------------------------------------------------
" File: gruvayu.vim
" Description: Retro groove color scheme for Vim
" Author: morhetz <morhetz@gmail.com>
" Source: https://github.com/morhetz/gruvayu
" Last Modified: 09 Apr 2014
" -----------------------------------------------------------------------------

function! gruvayu#invert_signs_toggle()
  if g:gruvayu_invert_signs == 0
    let g:gruvayu_invert_signs=1
  else
    let g:gruvayu_invert_signs=0
  endif

  colorscheme gruvayu
endfunction

" Search Highlighting {{{

function! gruvayu#hls_show()
  set hlsearch
  call GruvboxHlsShowCursor()
endfunction

function! gruvayu#hls_hide()
  set nohlsearch
  call GruvboxHlsHideCursor()
endfunction

function! gruvayu#hls_toggle()
  if &hlsearch
    call gruvayu#hls_hide()
  else
    call gruvayu#hls_show()
  endif
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
