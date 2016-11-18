" Vim syntax file
" Language:             Haskell Yesod web framework
" Maintainer:           Daniel Campoverde <alx@rsillybytes.net>
" License:              Vim (see :h license)
" Repository:		    https://github.com/alx741/vim-yesod

if version < 600
  syn clear
elseif exists("b:current_syntax")
  finish
endif

syn keyword yesodRoutesMethod GET POST
syn match yesodRoutesRoute "\v\/[A-Za-z/.]*"
syn match yesodRoutesResource "\v[A-Z]{1}.*R"

highlight def link yesodRoutesMethod Keyword
highlight def link yesodRoutesRoute String
highlight def link yesodRoutesResource Identifier

let b:current_syntax = "yesod"
