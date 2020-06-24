" Supporting code -------------------------------------------------------------
" Initialisation: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='gruvayu'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" }}}
" Global Settings: {{{

if !exists('g:gruvayu_bold')
  let g:gruvayu_bold=1
endif
if !exists('g:gruvayu_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:gruvayu_italic=1
  else
    let g:gruvayu_italic=0
  endif
endif
if !exists('g:gruvayu_undercurl')
  let g:gruvayu_undercurl=1
endif
if !exists('g:gruvayu_underline')
  let g:gruvayu_underline=1
endif
if !exists('g:gruvayu_inverse')
  let g:gruvayu_inverse=1
endif

if !exists('g:gruvayu_guisp_fallback') || index(['fg', 'bg'], g:gruvayu_guisp_fallback) == -1
  let g:gruvayu_guisp_fallback='NONE'
endif

if !exists('g:gruvayu_improved_strings')
  let g:gruvayu_improved_strings=0
endif

if !exists('g:gruvayu_improved_warnings')
  let g:gruvayu_improved_warnings=0
endif

if !exists('g:gruvayu_termcolors')
  let g:gruvayu_termcolors=256
endif

if !exists('g:gruvayu_invert_indent_guides')
  let g:gruvayu_invert_indent_guides=0
endif

if exists('g:gruvayu_contrast')
  echo 'g:gruvayu_contrast is deprecated; use g:gruvayu_contrast_light and g:gruvayu_contrast_dark instead'
endif

if !exists('g:gruvayu_contrast_dark')
  let g:gruvayu_contrast_dark='medium'
endif

if !exists('g:gruvayu_contrast_light')
  let g:gruvayu_contrast_light='medium'
endif

let s:is_dark=(&background == 'dark')

" }}}
" Palette: {{{

" setup palette dictionary
let s:gb = {}

" fill it with absolute colors
let s:gb.dark0_hard  = ['#1d2021', 234]
let s:gb.dark0       = ['#080a0c', 235]
let s:gb.dark0_soft  = ['#f23020', 236]
let s:gb.dark1       = ['#151620', 237]
let s:gb.dark2       = ['#2d203d', 239]
let s:gb.dark3       = ['#353555', 241]
let s:gb.dark4       = ['#444454', 243]
let s:gb.dark4_256   = ['#7c6f64', 243]

let s:gb.gray_245    = ['#5C6783', 245]
let s:gb.gray_244    = ['#928374', 244]

let s:gb.light0_hard = ['#e9def6', 230]
let s:gb.light0      = ['#e6e1cf', 229]
let s:gb.light0_soft = ['#bbbbbb', 228]
let s:gb.light1      = ['#d9d2b6', 223]
let s:gb.light2      = ['#d5c4a1', 250]
let s:gb.light3      = ['#bdae93', 248]
let s:gb.light4      = ['#a88994', 246]
let s:gb.light4_256  = ['#a89984', 246]

let s:gb.bright_red     = ['#ff3333', 167]
let s:gb.bright_green   = ['#b8cc52', 142]

let s:gb.bright_yellow  = ['#ffee99', 214]
let s:gb.bright_blue    = ['#36a6d9', 109]
let s:gb.bright_purple  = ['#f29718', 175]
let s:gb.bright_aqua    = ['#ffb454', 108]
let s:gb.bright_orange  = ['#ff7744', 208]

let s:gb.neutral_red    = ['#ef5757', 124]
let s:gb.neutral_green  = ['#85cb33', 106]
let s:gb.neutral_yellow = ['#9cd0A1', 172]
let s:gb.neutral_blue   = ['#50a2a7', 66]
let s:gb.neutral_purple = ['#9055a2', 132]
let s:gb.neutral_aqua   = ['#7d82b8', 72]
let s:gb.neutral_orange = ['#ff99b8', 166]

let s:gb.faded_red      = ['#cd0000', 88]
let s:gb.faded_green    = ['#5d6b16', 100]
let s:gb.faded_yellow   = ['#9b8100', 136]
let s:gb.faded_blue     = ['#19709c', 24]
let s:gb.faded_purple   = ['#a96609', 96]
let s:gb.faded_aqua     = ['#e28000', 66]
let s:gb.faded_orange   = ['#cd4400', 130]

" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:gruvayu_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:gruvayu_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:gruvayu_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:gruvayu_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:gruvayu_inverse == 0
  let s:inverse = ''
endif

" }}}
" Setup Colors: {{{

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" determine relative colors
if s:is_dark
  let s:bg0  = s:gb.dark0
  if g:gruvayu_contrast_dark == 'soft'
    let s:bg0  = s:gb.dark0_soft
  elseif g:gruvayu_contrast_dark == 'hard'
    let s:bg0  = s:gb.dark0_hard
  endif

  let s:bg1  = s:gb.dark1
  let s:bg2  = s:gb.dark2
  let s:bg3  = s:gb.dark3
  let s:bg4  = s:gb.dark4

  let s:gray = s:gb.gray_245

  let s:fg0 = s:gb.light0
  let s:fg1 = s:gb.light1
  let s:fg2 = s:gb.light2
  let s:fg3 = s:gb.light3
  let s:fg4 = s:gb.light4

  let s:fg4_256 = s:gb.light4_256

  let s:red    = s:gb.bright_red
  let s:green  = s:gb.bright_green
  let s:yellow = s:gb.bright_yellow
  let s:blue   = s:gb.bright_blue
  let s:purple = s:gb.bright_purple
  let s:aqua   = s:gb.bright_aqua
  let s:orange = s:gb.bright_orange
else
  let s:bg0  = s:gb.light0
  if g:gruvayu_contrast_light == 'soft'
    let s:bg0  = s:gb.light0_soft
  elseif g:gruvayu_contrast_light == 'hard'
    let s:bg0  = s:gb.light0_hard
  endif

  let s:bg1  = s:gb.light1
  let s:bg2  = s:gb.light2
  let s:bg3  = s:gb.light3
  let s:bg4  = s:gb.light4

  let s:gray = s:gb.gray_244

  let s:fg0 = s:gb.dark0
  let s:fg1 = s:gb.dark1
  let s:fg2 = s:gb.dark2
  let s:fg3 = s:gb.dark3
  let s:fg4 = s:gb.dark4

  let s:fg4_256 = s:gb.dark4_256

  let s:red    = s:gb.faded_red
  let s:green  = s:gb.faded_green
  let s:yellow = s:gb.faded_yellow
  let s:blue   = s:gb.faded_blue
  let s:purple = s:gb.faded_purple
  let s:aqua   = s:gb.faded_aqua
  let s:orange = s:gb.faded_orange
endif

" reset to 16 colors fallback
if g:gruvayu_termcolors == 16
  let s:bg0[1]    = 0
  let s:fg4[1]    = 7
  let s:gray[1]   = 8
  let s:red[1]    = 9
  let s:green[1]  = 10
  let s:yellow[1] = 11
  let s:blue[1]   = 12
  let s:purple[1] = 13
  let s:aqua[1]   = 14
  let s:fg1[1]    = 15
endif

" save current relative colors back to palette dictionary
let s:gb.bg0 = s:bg0
let s:gb.bg1 = s:bg1
let s:gb.bg2 = s:bg2
let s:gb.bg3 = s:bg3
let s:gb.bg4 = s:bg4

let s:gb.gray = s:gray

let s:gb.fg0 = s:fg0
let s:gb.fg1 = s:fg1
let s:gb.fg2 = s:fg2
let s:gb.fg3 = s:fg3
let s:gb.fg4 = s:fg4

let s:gb.fg4_256 = s:fg4_256

let s:gb.red    = s:red
let s:gb.green  = s:green
let s:gb.yellow = s:yellow
let s:gb.blue   = s:blue
let s:gb.purple = s:purple
let s:gb.aqua   = s:aqua
let s:gb.orange = s:orange

" }}}
" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  let g:terminal_color_0 = s:bg0[0]
  let g:terminal_color_8 = s:gray[0]

  let g:terminal_color_1 = s:gb.neutral_red[0]
  let g:terminal_color_9 = s:red[0]

  let g:terminal_color_2 = s:gb.neutral_green[0]
  let g:terminal_color_10 = s:green[0]

  let g:terminal_color_3 = s:gb.neutral_yellow[0]
  let g:terminal_color_11 = s:yellow[0]

  let g:terminal_color_4 = s:gb.neutral_blue[0]
  let g:terminal_color_12 = s:blue[0]

  let g:terminal_color_5 = s:gb.neutral_purple[0]
  let g:terminal_color_13 = s:purple[0]

  let g:terminal_color_6 = s:gb.neutral_aqua[0]
  let g:terminal_color_14 = s:aqua[0]

  let g:terminal_color_7 = s:fg4[0]
  let g:terminal_color_15 = s:fg1[0]
endif

" }}}
" Overload Setting: {{{

let s:hls_cursor = s:orange
if exists('g:gruvayu_hls_cursor')
  let s:hls_cursor = get(s:gb, g:gruvayu_hls_cursor)
endif

let s:number_column = s:none
if exists('g:gruvayu_number_column')
  let s:number_column = get(s:gb, g:gruvayu_number_column)
endif

let s:sign_column = s:bg1

if exists('g:gitgutter_override_sign_column_highlight') &&
      \ g:gitgutter_override_sign_column_highlight == 1
  let s:sign_column = s:number_column
else
  let g:gitgutter_override_sign_column_highlight = 0

  if exists('g:gruvayu_sign_column')
    let s:sign_column = get(s:gb, g:gruvayu_sign_column)
  endif
endif

let s:color_column = s:bg1
if exists('g:gruvayu_color_column')
  let s:color_column = get(s:gb, g:gruvayu_color_column)
endif

let s:vert_split = s:bg0
if exists('g:gruvayu_vert_split')
  let s:vert_split = get(s:gb, g:gruvayu_vert_split)
endif

let s:invert_signs = ''
if exists('g:gruvayu_invert_signs')
  if g:gruvayu_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:gruvayu_invert_selection')
  if g:gruvayu_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:gruvayu_invert_tabline')
  if g:gruvayu_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:italicize_comments = s:italic
if exists('g:gruvayu_italicize_comments')
  if g:gruvayu_italicize_comments == 0
    let s:italicize_comments = ''
  endif
endif

let s:italicize_strings = ''
if exists('g:gruvayu_italicize_strings')
  if g:gruvayu_italicize_strings == 1
    let s:italicize_strings = s:italic
  endif
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:gruvayu_guisp_fallback != 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:gruvayu_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" }}}
" Gruvayu Hi Groups: {{{

" memoize common hi groups
call s:HL('GruvayuFg0', s:fg0)
call s:HL('GruvayuFg1', s:fg1)
call s:HL('GruvayuFg2', s:fg2)
call s:HL('GruvayuFg3', s:fg3)
call s:HL('GruvayuFg4', s:fg4)
call s:HL('GruvayuGray', s:gray)
call s:HL('GruvayuBg0', s:bg0)
call s:HL('GruvayuBg1', s:bg1)
call s:HL('GruvayuBg2', s:bg2)
call s:HL('GruvayuBg3', s:bg3)
call s:HL('GruvayuBg4', s:bg4)

call s:HL('GruvayuRed', s:red)
call s:HL('GruvayuRedBold', s:red, s:none, s:bold)
call s:HL('GruvayuGreen', s:green)
call s:HL('GruvayuGreenBold', s:green, s:none, s:bold)
call s:HL('GruvayuYellow', s:yellow)
call s:HL('GruvayuYellowBold', s:yellow, s:none, s:bold)
call s:HL('GruvayuBlue', s:blue)
call s:HL('GruvayuBlueBold', s:blue, s:none, s:bold)
call s:HL('GruvayuPurple', s:purple)
call s:HL('GruvayuPurpleBold', s:purple, s:none, s:bold)
call s:HL('GruvayuAqua', s:aqua)
call s:HL('GruvayuAquaBold', s:aqua, s:none, s:bold)
call s:HL('GruvayuOrange', s:orange)
call s:HL('GruvayuOrangeBold', s:orange, s:none, s:bold)

call s:HL('GruvayuRedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('GruvayuGreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('GruvayuYellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('GruvayuBlueSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('GruvayuPurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('GruvayuAquaSign', s:aqua, s:sign_column, s:invert_signs)
call s:HL('GruvayuOrangeSign', s:orange, s:sign_column, s:invert_signs)

" }}}

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text
call s:HL('Normal', s:fg1, s:bg0)

" Correct background (see issue #7):
" --- Problem with changing between dark and light on 256 color terminal
" --- https://github.com/morhetz/gruvayu/issues/7
if s:is_dark
  set background=dark
else
  set background=light
endif

if version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine',   s:none, s:bg1)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine

  " Tab pages line filler
  call s:HL('TabLineFill', s:bg4, s:bg1, s:invert_tabline)
  " Active tab page label
  call s:HL('TabLineSel', s:green, s:bg1, s:invert_tabline)
  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  call s:HL('MatchParen', s:none, s:bg3, s:bold)
endif

if version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn',  s:none, s:color_column)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:blue, s:none)

  " Line number of CursorLine
  call s:HL('CursorLineNr', s:yellow, s:bg1)
endif

hi! link NonText GruvayuBg2
hi! link SpecialKey GruvayuBg2

call s:HL('Visual',    s:none,  s:bg3, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search',    s:yellow, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bg2, s:fg1, s:inverse)
call s:HL('StatusLineNC', s:bg1, s:fg4, s:inverse)

" The column separating vertically split windows
call s:HL('VertSplit', s:bg3, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:blue, s:bg2, s:bold)

" Directory names, special names in listing
hi! link Directory GruvayuGreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title GruvayuGreenBold

" Error messages on the command line
call s:HL('ErrorMsg',   s:bg0, s:red, s:bold)
" More prompt: -- More --
hi! link MoreMsg GruvayuYellowBold
" Current mode message: -- INSERT --
hi! link ModeMsg GruvayuYellowBold
" 'Press enter' prompt and yes/no questions
hi! link Question GruvayuOrangeBold
" Warning messages
hi! link WarningMsg GruvayuRedBold

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:bg4, s:number_column)

" Column where signs are displayed
call s:HL('SignColumn', s:none, s:sign_column)

" Line used for closed folds
call s:HL('Folded', s:gray, s:bg1, s:italic)
" Column where folds are displayed
call s:HL('FoldColumn', s:gray, s:bg1)

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:none, s:none, s:inverse)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

if g:gruvayu_improved_strings == 0
  hi! link Special GruvayuOrange
else
  call s:HL('Special', s:orange, s:bg1, s:italicize_strings)
endif

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('Error', s:red, s:vim_bg, s:bold . s:inverse)

" Generic statement
hi! link Statement GruvayuOrange
" if, then, else, endif, swicth, etc.
hi! link Conditional GruvayuOrange
" for, do, while, etc.
hi! link Repeat GruvayuOrange
" case, default, etc.
hi! link Label GruvayuOrange
" try, catch, throw
hi! link Exception GruvayuOrange
" sizeof, "+", "*", etc.
hi! link Operator GruvayuAqua
" Any other keyword
hi! link Keyword GruvayuYellow

" Variable name
hi! link Identifier GruvayuBlue
" Function name
hi! link Function GruvayuPurple

" Generic preprocessor
hi! link PreProc GruvayuYellow
" Preprocessor #include
hi! link Include GruvayuYellow
" Preprocessor #define
hi! link Define GruvayuYellow
" Same as Define
hi! link Macro GruvayuYellow
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit GruvayuYellow

" Generic constant
hi! link Constant GruvayuPurple
" Character constant: 'c', '/n'
hi! link Character GruvayuGreen
" String constant: "this is a string"
if g:gruvayu_improved_strings == 0
  call s:HL('String',  s:green, s:none, s:italicize_strings)
else
  call s:HL('String',  s:fg1, s:bg1, s:italicize_strings)
endif
" Boolean constant: TRUE, false
hi! link Boolean GruvayuGreenBold
" Number constant: 234, 0xff
hi! link Number GruvayuGreenBold
" Floating point constant: 2.3e10
hi! link Float GruvayuGreenBold

" Generic type
hi! link Type GruvayuBlueBold
" static, register, volatile, etc
hi! link StorageClass GruvayuPurple
" struct, union, enum, etc.
hi! link Structure GruvayuOrange
" typedef
hi! link Typedef GruvayuOrange

" }}}
" Completion Menu: {{{

if version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:fg1, s:bg2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bg2, s:blue, s:bold)
  " Popup menu: scrollbar
  call s:HL('PmenuSbar', s:none, s:bg2)
  " Popup menu: scrollbar thumb
  call s:HL('PmenuThumb', s:none, s:bg4)
endif

" }}}
" Diffs: {{{

call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)
"call s:HL('DiffChange', s:bg0, s:blue)
"call s:HL('DiffText',   s:bg0, s:yellow)

" Alternative setting
call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText',   s:yellow, s:bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  " Not capitalised word, or compile warnings
  if g:gruvayu_improved_warnings == 0
    call s:HL('SpellCap',   s:none, s:none, s:undercurl, s:red)
  else
    call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  endif
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:aqua)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:purple)
endif

" }}}

" Plugin specific -------------------------------------------------------------
" EasyMotion: {{{

hi! link EasyMotionTarget Search
hi! link EasyMotionShade Comment

" }}}
" Sneak: {{{

hi! link Sneak Search
hi! link SneakLabel Search

" }}}
" Indent Guides: {{{

if !exists('g:indent_guides_auto_colors')
  let g:indent_guides_auto_colors = 0
endif

if g:indent_guides_auto_colors == 0
  if g:gruvayu_invert_indent_guides == 0
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg1)
  else
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2, s:inverse)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg3, s:inverse)
  endif
endif

" }}}
" IndentLine: {{{

if !exists('g:indentLine_color_term')
  let g:indentLine_color_term = s:bg2[1]
endif
if !exists('g:indentLine_color_gui')
  let g:indentLine_color_gui = s:bg2[0]
endif

" }}}
" Rainbow Parentheses: {{{

if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs =
    \ [
      \ ['blue', '#458588'], ['magenta', '#b16286'],
      \ ['red',  '#cc241d'], ['166',     '#d65d0e']
    \ ]
endif

let g:rainbow_guifgs = [ '#d65d0e', '#cc241d', '#b16286', '#458588' ]
let g:rainbow_ctermfgs = [ '166', 'red', 'magenta', 'blue' ]

if !exists('g:rainbow_conf')
   let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
   let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
   let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:rbpt_colorpairs
let g:niji_light_colours = g:rbpt_colorpairs

"}}}
" GitGutter: {{{

hi! link GitGutterAdd GruvayuGreenSign
hi! link GitGutterChange GruvayuAquaSign
hi! link GitGutterDelete GruvayuRedSign
hi! link GitGutterChangeDelete GruvayuAquaSign

" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile GruvayuGreen
hi! link gitcommitDiscardedFile GruvayuRed

" }}}
" Signify: {{{

hi! link SignifySignAdd GruvayuGreenSign
hi! link SignifySignChange GruvayuAquaSign
hi! link SignifySignDelete GruvayuRedSign

" }}}
" Syntastic: {{{

call s:HL('SyntasticError', s:none, s:none, s:undercurl, s:red)
call s:HL('SyntasticWarning', s:none, s:none, s:undercurl, s:yellow)

hi! link SyntasticErrorSign GruvayuRedSign
hi! link SyntasticWarningSign GruvayuYellowSign

" }}}
" Signature: {{{
hi! link SignatureMarkText   GruvayuBlueSign
hi! link SignatureMarkerText GruvayuPurpleSign

" }}}
" ShowMarks: {{{

hi! link ShowMarksHLl GruvayuBlueSign
hi! link ShowMarksHLu GruvayuBlueSign
hi! link ShowMarksHLo GruvayuBlueSign
hi! link ShowMarksHLm GruvayuBlueSign

" }}}
" CtrlP: {{{

hi! link CtrlPMatch GruvayuYellow
hi! link CtrlPNoEntries GruvayuRed
hi! link CtrlPPrtBase GruvayuBg2
hi! link CtrlPPrtCursor GruvayuBlue
hi! link CtrlPLinePre GruvayuBg2

call s:HL('CtrlPMode1', s:blue, s:bg2, s:bold)
call s:HL('CtrlPMode2', s:bg0, s:blue, s:bold)
call s:HL('CtrlPStats', s:fg4, s:bg2, s:bold)

" }}}
" Startify: {{{

hi! link StartifyBracket GruvayuFg3
hi! link StartifyFile GruvayuFg1
hi! link StartifyNumber GruvayuBlue
hi! link StartifyPath GruvayuGray
hi! link StartifySlash GruvayuGray
hi! link StartifySection GruvayuYellow
hi! link StartifySpecial GruvayuBg2
hi! link StartifyHeader GruvayuOrange
hi! link StartifyFooter GruvayuBg2

" }}}
" Vimshell: {{{

let g:vimshell_escape_colors = [
  \ s:bg4[0], s:red[0], s:green[0], s:yellow[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg4[0],
  \ s:bg0[0], s:red[0], s:green[0], s:orange[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg0[0]
  \ ]

" }}}
" BufTabLine: {{{

call s:HL('BufTabLineCurrent', s:bg0, s:fg4)
call s:HL('BufTabLineActive', s:fg4, s:bg2)
call s:HL('BufTabLineHidden', s:bg4, s:bg1)
call s:HL('BufTabLineFill', s:bg0, s:bg0)

" }}}
" Asynchronous Lint Engine: {{{

call s:HL('ALEError', s:none, s:none, s:undercurl, s:red)
call s:HL('ALEWarning', s:none, s:none, s:undercurl, s:yellow)
call s:HL('ALEInfo', s:none, s:none, s:undercurl, s:blue)

hi! link ALEErrorSign GruvayuRedSign
hi! link ALEWarningSign GruvayuYellowSign
hi! link ALEInfoSign GruvayuBlueSign

" }}}
" Dirvish: {{{

hi! link DirvishPathTail GruvayuAqua
hi! link DirvishArg GruvayuYellow

" }}}
" Netrw: {{{

hi! link netrwDir GruvayuAqua
hi! link netrwClassify GruvayuAqua
hi! link netrwLink GruvayuGray
hi! link netrwSymLink GruvayuFg1
hi! link netrwExe GruvayuYellow
hi! link netrwComment GruvayuGray
hi! link netrwList GruvayuBlue
hi! link netrwHelpCmd GruvayuAqua
hi! link netrwCmdSep GruvayuFg3
hi! link netrwVersion GruvayuGreen

" }}}
" NERDTree: {{{

hi! link NERDTreeDir GruvayuAqua
hi! link NERDTreeDirSlash GruvayuAqua

hi! link NERDTreeOpenable GruvayuOrange
hi! link NERDTreeClosable GruvayuOrange

hi! link NERDTreeFile GruvayuFg1
hi! link NERDTreeExecFile GruvayuYellow

hi! link NERDTreeUp GruvayuGray
hi! link NERDTreeCWD GruvayuGreen
hi! link NERDTreeHelp GruvayuFg1

hi! link NERDTreeToggleOn GruvayuGreen
hi! link NERDTreeToggleOff GruvayuRed

" }}}
" Vim Multiple Cursors: {{{

call s:HL('multiple_cursors_cursor', s:none, s:none, s:inverse)
call s:HL('multiple_cursors_visual', s:none, s:bg2)

" }}}
" coc.nvim: {{{

hi! link CocErrorSign GruvayuRedSign
hi! link CocWarningSign GruvayuOrangeSign
hi! link CocInfoSign GruvayuYellowSign
hi! link CocHintSign GruvayuBlueSign
hi! link CocErrorFloat GruvayuRed
hi! link CocWarningFloat GruvayuOrange
hi! link CocInfoFloat GruvayuYellow
hi! link CocHintFloat GruvayuBlue
hi! link CocDiagnosticsError GruvayuRed
hi! link CocDiagnosticsWarning GruvayuOrange
hi! link CocDiagnosticsInfo GruvayuYellow
hi! link CocDiagnosticsHint GruvayuBlue

hi! link CocSelectedText GruvayuRed
hi! link CocCodeLens GruvayuGray

call s:HL('CocErrorHighlight', s:none, s:none, s:undercurl, s:red)
call s:HL('CocWarningHighlight', s:none, s:none, s:undercurl, s:orange)
call s:HL('CocInfoHighlight', s:none, s:none, s:undercurl, s:yellow)
call s:HL('CocHintHighlight', s:none, s:none, s:undercurl, s:blue)

" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded GruvayuGreen
hi! link diffRemoved GruvayuRed
hi! link diffChanged GruvayuAqua

hi! link diffFile GruvayuOrange
hi! link diffNewFile GruvayuYellow

hi! link diffLine GruvayuBlue

" }}}
" Html: {{{

hi! link htmlTag GruvayuBlue
hi! link htmlEndTag GruvayuBlue

hi! link htmlTagName GruvayuAquaBold
hi! link htmlArg GruvayuAqua

hi! link htmlScriptTag GruvayuPurple
hi! link htmlTagN GruvayuFg1
hi! link htmlSpecialTagName GruvayuAquaBold

call s:HL('htmlLink', s:fg4, s:none, s:underline)

hi! link htmlSpecialChar GruvayuOrange

call s:HL('htmlBold', s:vim_fg, s:vim_bg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_fg, s:vim_bg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_fg, s:vim_bg, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:vim_fg, s:vim_bg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_fg, s:vim_bg, s:underline . s:italic)
call s:HL('htmlItalic', s:vim_fg, s:vim_bg, s:italic)

" }}}
" Xml: {{{

hi! link xmlTag GruvayuBlue
hi! link xmlEndTag GruvayuBlue
hi! link xmlTagName GruvayuBlue
hi! link xmlEqual GruvayuBlue
hi! link docbkKeyword GruvayuAquaBold

hi! link xmlDocTypeDecl GruvayuGray
hi! link xmlDocTypeKeyword GruvayuPurple
hi! link xmlCdataStart GruvayuGray
hi! link xmlCdataCdata GruvayuPurple
hi! link dtdFunction GruvayuGray
hi! link dtdTagName GruvayuPurple

hi! link xmlAttrib GruvayuAqua
hi! link xmlProcessingDelim GruvayuGray
hi! link dtdParamEntityPunct GruvayuGray
hi! link dtdParamEntityDPunct GruvayuGray
hi! link xmlAttribPunct GruvayuGray

hi! link xmlEntity GruvayuOrange
hi! link xmlEntityPunct GruvayuOrange
" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:fg4_256, s:none, s:bold . s:italicize_comments)

hi! link vimNotation GruvayuOrange
hi! link vimBracket GruvayuOrange
hi! link vimMapModKey GruvayuOrange
hi! link vimFuncSID GruvayuFg3
hi! link vimSetSep GruvayuFg3
hi! link vimSep GruvayuFg3
hi! link vimContinue GruvayuFg3

" }}}
" Clojure: {{{

hi! link clojureKeyword GruvayuBlue
hi! link clojureCond GruvayuOrange
hi! link clojureSpecial GruvayuOrange
hi! link clojureDefine GruvayuOrange

hi! link clojureFunc GruvayuYellow
hi! link clojureRepeat GruvayuYellow
hi! link clojureCharacter GruvayuAqua
hi! link clojureStringEscape GruvayuAqua
hi! link clojureException GruvayuRed

hi! link clojureRegexp GruvayuAqua
hi! link clojureRegexpEscape GruvayuAqua
call s:HL('clojureRegexpCharClass', s:fg3, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureParen GruvayuFg3
hi! link clojureAnonArg GruvayuYellow
hi! link clojureVariable GruvayuBlue
hi! link clojureMacro GruvayuOrange

hi! link clojureMeta GruvayuYellow
hi! link clojureDeref GruvayuYellow
hi! link clojureQuote GruvayuYellow
hi! link clojureUnquote GruvayuYellow

" }}}
" C: {{{

hi! link cOperator GruvayuPurple
hi! link cStructure GruvayuOrange

" }}}
" Python: {{{

hi! link pythonBuiltin GruvayuOrange
hi! link pythonBuiltinObj GruvayuOrange
hi! link pythonBuiltinFunc GruvayuOrange
hi! link pythonFunction GruvayuAqua
hi! link pythonDecorator GruvayuRed
hi! link pythonInclude GruvayuBlue
hi! link pythonImport GruvayuBlue
hi! link pythonRun GruvayuBlue
hi! link pythonCoding GruvayuBlue
hi! link pythonOperator GruvayuRed
hi! link pythonException GruvayuRed
hi! link pythonExceptions GruvayuPurple
hi! link pythonBoolean GruvayuPurple
hi! link pythonDot GruvayuFg3
hi! link pythonConditional GruvayuRed
hi! link pythonRepeat GruvayuRed
hi! link pythonDottedName GruvayuGreenBold

" }}}
" CSS: {{{

hi! link cssBraces GruvayuBlue
hi! link cssFunctionName GruvayuYellow
hi! link cssIdentifier GruvayuOrange
hi! link cssClassName GruvayuGreen
hi! link cssColor GruvayuBlue
hi! link cssSelectorOp GruvayuBlue
hi! link cssSelectorOp2 GruvayuBlue
hi! link cssImportant GruvayuGreen
hi! link cssVendor GruvayuFg1

hi! link cssTextProp GruvayuAqua
hi! link cssAnimationProp GruvayuAqua
hi! link cssUIProp GruvayuYellow
hi! link cssTransformProp GruvayuAqua
hi! link cssTransitionProp GruvayuAqua
hi! link cssPrintProp GruvayuAqua
hi! link cssPositioningProp GruvayuYellow
hi! link cssBoxProp GruvayuAqua
hi! link cssFontDescriptorProp GruvayuAqua
hi! link cssFlexibleBoxProp GruvayuAqua
hi! link cssBorderOutlineProp GruvayuAqua
hi! link cssBackgroundProp GruvayuAqua
hi! link cssMarginProp GruvayuAqua
hi! link cssListProp GruvayuAqua
hi! link cssTableProp GruvayuAqua
hi! link cssFontProp GruvayuAqua
hi! link cssPaddingProp GruvayuAqua
hi! link cssDimensionProp GruvayuAqua
hi! link cssRenderProp GruvayuAqua
hi! link cssColorProp GruvayuAqua
hi! link cssGeneratedContentProp GruvayuAqua

" }}}
" JavaScript: {{{

hi! link javaScriptBraces GruvayuFg1
hi! link javaScriptFunction GruvayuAqua
hi! link javaScriptIdentifier GruvayuRed
hi! link javaScriptMember GruvayuBlue
hi! link javaScriptNumber GruvayuPurple
hi! link javaScriptNull GruvayuPurple
hi! link javaScriptParens GruvayuFg3

" }}}
" YAJS: {{{

hi! link javascriptImport GruvayuAqua
hi! link javascriptExport GruvayuAqua
hi! link javascriptClassKeyword GruvayuAqua
hi! link javascriptClassExtends GruvayuAqua
hi! link javascriptDefault GruvayuAqua

hi! link javascriptClassName GruvayuYellow
hi! link javascriptClassSuperName GruvayuYellow
hi! link javascriptGlobal GruvayuYellow

hi! link javascriptEndColons GruvayuFg1
hi! link javascriptFuncArg GruvayuFg1
hi! link javascriptGlobalMethod GruvayuFg1
hi! link javascriptNodeGlobal GruvayuFg1
hi! link javascriptBOMWindowProp GruvayuFg1
hi! link javascriptArrayMethod GruvayuFg1
hi! link javascriptArrayStaticMethod GruvayuFg1
hi! link javascriptCacheMethod GruvayuFg1
hi! link javascriptDateMethod GruvayuFg1
hi! link javascriptMathStaticMethod GruvayuFg1

" hi! link javascriptProp GruvayuFg1
hi! link javascriptURLUtilsProp GruvayuFg1
hi! link javascriptBOMNavigatorProp GruvayuFg1
hi! link javascriptDOMDocMethod GruvayuFg1
hi! link javascriptDOMDocProp GruvayuFg1
hi! link javascriptBOMLocationMethod GruvayuFg1
hi! link javascriptBOMWindowMethod GruvayuFg1
hi! link javascriptStringMethod GruvayuFg1

hi! link javascriptVariable GruvayuOrange
" hi! link javascriptVariable GruvayuRed
" hi! link javascriptIdentifier GruvayuOrange
" hi! link javascriptClassSuper GruvayuOrange
hi! link javascriptIdentifier GruvayuOrange
hi! link javascriptClassSuper GruvayuOrange

" hi! link javascriptFuncKeyword GruvayuOrange
" hi! link javascriptAsyncFunc GruvayuOrange
hi! link javascriptFuncKeyword GruvayuAqua
hi! link javascriptAsyncFunc GruvayuAqua
hi! link javascriptClassStatic GruvayuOrange

hi! link javascriptOperator GruvayuRed
hi! link javascriptForOperator GruvayuRed
hi! link javascriptYield GruvayuRed
hi! link javascriptExceptions GruvayuRed
hi! link javascriptMessage GruvayuRed

hi! link javascriptTemplateSB GruvayuAqua
hi! link javascriptTemplateSubstitution GruvayuFg1

" hi! link javascriptLabel GruvayuBlue
" hi! link javascriptObjectLabel GruvayuBlue
" hi! link javascriptPropertyName GruvayuBlue
hi! link javascriptLabel GruvayuFg1
hi! link javascriptObjectLabel GruvayuFg1
hi! link javascriptPropertyName GruvayuFg1

hi! link javascriptLogicSymbols GruvayuFg1
hi! link javascriptArrowFunc GruvayuYellow

hi! link javascriptDocParamName GruvayuFg4
hi! link javascriptDocTags GruvayuFg4
hi! link javascriptDocNotation GruvayuFg4
hi! link javascriptDocParamType GruvayuFg4
hi! link javascriptDocNamedParamType GruvayuFg4

hi! link javascriptBrackets GruvayuFg1
hi! link javascriptDOMElemAttrs GruvayuFg1
hi! link javascriptDOMEventMethod GruvayuFg1
hi! link javascriptDOMNodeMethod GruvayuFg1
hi! link javascriptDOMStorageMethod GruvayuFg1
hi! link javascriptHeadersMethod GruvayuFg1

hi! link javascriptAsyncFuncKeyword GruvayuRed
hi! link javascriptAwaitFuncKeyword GruvayuRed

" }}}
" PanglossJS: {{{

hi! link jsClassKeyword GruvayuAqua
hi! link jsExtendsKeyword GruvayuAqua
hi! link jsExportDefault GruvayuAqua
hi! link jsTemplateBraces GruvayuAqua
hi! link jsGlobalNodeObjects GruvayuFg1
hi! link jsGlobalObjects GruvayuFg1
hi! link jsFunction GruvayuAqua
hi! link jsFuncParens GruvayuFg3
hi! link jsParens GruvayuFg3
hi! link jsNull GruvayuPurple
hi! link jsUndefined GruvayuPurple
hi! link jsClassDefinition GruvayuYellow

" }}}
" TypeScript: {{{

hi! link typeScriptReserved GruvayuAqua
hi! link typeScriptLabel GruvayuAqua
hi! link typeScriptFuncKeyword GruvayuAqua
hi! link typeScriptIdentifier GruvayuOrange
hi! link typeScriptBraces GruvayuFg1
hi! link typeScriptEndColons GruvayuFg1
hi! link typeScriptDOMObjects GruvayuFg1
hi! link typeScriptAjaxMethods GruvayuFg1
hi! link typeScriptLogicSymbols GruvayuFg1
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle
hi! link typeScriptGlobalObjects GruvayuFg1
hi! link typeScriptParens GruvayuFg3
hi! link typeScriptOpSymbols GruvayuFg3
hi! link typeScriptHtmlElemProperties GruvayuFg1
hi! link typeScriptNull GruvayuPurple
hi! link typeScriptInterpolationDelimiter GruvayuAqua

" }}}
" PureScript: {{{

hi! link purescriptModuleKeyword GruvayuAqua
hi! link purescriptModuleName GruvayuFg1
hi! link purescriptWhere GruvayuAqua
hi! link purescriptDelimiter GruvayuFg4
hi! link purescriptType GruvayuFg1
hi! link purescriptImportKeyword GruvayuAqua
hi! link purescriptHidingKeyword GruvayuAqua
hi! link purescriptAsKeyword GruvayuAqua
hi! link purescriptStructure GruvayuAqua
hi! link purescriptOperator GruvayuBlue

hi! link purescriptTypeVar GruvayuFg1
hi! link purescriptConstructor GruvayuFg1
hi! link purescriptFunction GruvayuFg1
hi! link purescriptConditional GruvayuOrange
hi! link purescriptBacktick GruvayuOrange

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp GruvayuFg3
hi! link coffeeSpecialOp GruvayuFg3
hi! link coffeeCurly GruvayuOrange
hi! link coffeeParen GruvayuFg3
hi! link coffeeBracket GruvayuOrange

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter GruvayuGreen
hi! link rubyInterpolationDelimiter GruvayuAqua

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier GruvayuRed
hi! link objcDirective GruvayuBlue

" }}}
" Go: {{{

hi! link goDirective GruvayuAqua
hi! link goConstants GruvayuPurple
hi! link goDeclaration GruvayuRed
hi! link goDeclType GruvayuBlue
hi! link goBuiltins GruvayuOrange

" }}}
" Lua: {{{

hi! link luaIn GruvayuRed
hi! link luaFunction GruvayuAqua
hi! link luaTable GruvayuOrange

" }}}
" MoonScript: {{{

hi! link moonSpecialOp GruvayuFg3
hi! link moonExtendedOp GruvayuFg3
hi! link moonFunction GruvayuFg3
hi! link moonObject GruvayuYellow

" }}}
" Java: {{{

hi! link javaAnnotation GruvayuBlue
hi! link javaDocTags GruvayuAqua
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen GruvayuFg3
hi! link javaParen1 GruvayuFg3
hi! link javaParen2 GruvayuFg3
hi! link javaParen3 GruvayuFg3
hi! link javaParen4 GruvayuFg3
hi! link javaParen5 GruvayuFg3
hi! link javaOperator GruvayuOrange

hi! link javaVarArg GruvayuGreen

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter GruvayuGreen
hi! link elixirInterpolationDelimiter GruvayuAqua

hi! link elixirModuleDeclaration GruvayuYellow

" }}}
" Scala: {{{

" NB: scala vim syntax file is kinda horrible
hi! link scalaNameDefinition GruvayuFg1
hi! link scalaCaseFollowing GruvayuFg1
hi! link scalaCapitalWord GruvayuFg1
hi! link scalaTypeExtension GruvayuFg1

hi! link scalaKeyword GruvayuRed
hi! link scalaKeywordModifier GruvayuRed

hi! link scalaSpecial GruvayuAqua
hi! link scalaOperator GruvayuFg1

hi! link scalaTypeDeclaration GruvayuYellow
hi! link scalaTypeTypePostDeclaration GruvayuYellow

hi! link scalaInstanceDeclaration GruvayuFg1
hi! link scalaInterpolation GruvayuAqua

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:fg3, s:none, s:italic)

hi! link markdownH1 GruvayuGreenBold
hi! link markdownH2 GruvayuGreenBold
hi! link markdownH3 GruvayuYellowBold
hi! link markdownH4 GruvayuYellowBold
hi! link markdownH5 GruvayuYellow
hi! link markdownH6 GruvayuYellow

hi! link markdownCode GruvayuAqua
hi! link markdownCodeBlock GruvayuAqua
hi! link markdownCodeDelimiter GruvayuAqua

hi! link markdownBlockquote GruvayuGray
hi! link markdownListMarker GruvayuGray
hi! link markdownOrderedListMarker GruvayuGray
hi! link markdownRule GruvayuGray
hi! link markdownHeadingRule GruvayuGray

hi! link markdownUrlDelimiter GruvayuFg3
hi! link markdownLinkDelimiter GruvayuFg3
hi! link markdownLinkTextDelimiter GruvayuFg3

hi! link markdownHeadingDelimiter GruvayuOrange
hi! link markdownUrl GruvayuPurple
hi! link markdownUrlTitleDelimiter GruvayuGreen

call s:HL('markdownLinkText', s:gray, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

" hi! link haskellType GruvayuYellow
" hi! link haskellOperators GruvayuOrange
" hi! link haskellConditional GruvayuAqua
" hi! link haskellLet GruvayuOrange
"
hi! link haskellType GruvayuFg1
hi! link haskellIdentifier GruvayuFg1
hi! link haskellSeparator GruvayuFg1
hi! link haskellDelimiter GruvayuFg4
hi! link haskellOperators GruvayuBlue
"
hi! link haskellBacktick GruvayuOrange
hi! link haskellStatement GruvayuOrange
hi! link haskellConditional GruvayuOrange

hi! link haskellLet GruvayuAqua
hi! link haskellDefault GruvayuAqua
hi! link haskellWhere GruvayuAqua
hi! link haskellBottom GruvayuAqua
hi! link haskellBlockKeywords GruvayuAqua
hi! link haskellImportKeywords GruvayuAqua
hi! link haskellDeclKeyword GruvayuAqua
hi! link haskellDeriving GruvayuAqua
hi! link haskellAssocType GruvayuAqua

hi! link haskellNumber GruvayuPurple
hi! link haskellPragma GruvayuPurple

hi! link haskellString GruvayuGreen
hi! link haskellChar GruvayuGreen

" }}}
" Json: {{{

hi! link jsonKeyword GruvayuGreen
hi! link jsonQuote GruvayuGreen
hi! link jsonBraces GruvayuFg1
hi! link jsonString GruvayuFg1

" }}}


" Functions -------------------------------------------------------------------
" Search Highlighting Cursor {{{

function! GruvayuHlsShowCursor()
  call s:HL('Cursor', s:bg0, s:hls_cursor)
endfunction

function! GruvayuHlsHideCursor()
  call s:HL('Cursor', s:none, s:none, s:inverse)
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
