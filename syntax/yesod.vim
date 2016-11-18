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


" Routes
syn keyword yesodRoutesMethod GET POST
syn match yesodRoutesRoute "\v\/[A-Za-z/.]*"
syn match yesodRoutesResource "\v[A-Z]{1}.*R"


" Models
syn keyword yesodModelsKeywords json deriving

syn keyword yesodModelsTypes Maybe Int Float Integer Text String
syn keyword yesodModelsTypes Typeable Eq Show
syn match yesodModelsTypes "\v[A-Z]+[a-zA-Z]*Id"

syn match yesodModelsEntity "\v^[A-Z]\S*"
syn match yesodModelsField "\v^\s+\zs[a-z][a-zA-Z]\S*\ze"
syn match yesodModelsFieldUnique "\v^\s+\zsUnique[A-Z]{1}[a-z]+[a-zA-Z]\S*\ze"

" Common
syn match haskellComment "---*\([^-!#$%&\*\+./<=>\?@\\^|~].*\)\?$"


highlight def link yesodRoutesMethod Keyword
highlight def link yesodRoutesRoute String
highlight def link yesodRoutesResource Identifier
highlight def link yesodModelsKeywords Keyword
highlight def link yesodModelsTypes Type
highlight def link yesodModelsEntity Macro
highlight def link yesodModelsField Identifier
highlight def link yesodModelsFieldUnique Conditional
highlight def link haskellComment Comment

let b:current_syntax = "yesod"
