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
syn keyword yesodRoutesMethod GET POST PUT DELETE
syn match yesodRoutesRoute "\C\v\/[A-Za-z0-9#*+/.-]*"
syn match yesodRoutesResource "\C\v[A-Z]{1}.*R "

" Models
syn keyword yesodModelsKeywords json deriving
syn keyword yesodModelsTypes Text ByteString Int64 Double Rational Bool Day
syn keyword yesodModelsTypes TimeOfDay UTCTime Maybe Int Integer String Textarea
syn keyword yesodModelsTypes Typeable Generic Eq Show Read Enum
syn match yesodModelsTypes "\C\v[A-Z]+[a-zA-Z]*Id"
syn match yesodModelsEntity "\C\v^[A-Z]\S*"
syn match yesodModelsField "\C\v^\s+\zs[a-z][a-zA-Z]\S*\ze"
syn match yesodModelsFieldUnique "\C\v^\s+\zsUnique[A-Z]{1}[a-z]+[a-zA-Z]\S*\ze"

" Messages
syn keyword yesodMessagesKeywords show showInt
syn keyword yesodMessagesTypes Int Float Integer
syn match yesodMessagesVariable "\C[[:alnum:]][^[:blank:]]*@"
syn match yesodMessagesDelimiter "\C[#{}]"

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
highlight def link yesodMessagesKeywords Keyword
highlight def link yesodMessagesTypes Type
highlight def link yesodMessagesVariable Identifier
highlight def link yesodMessagesString Identifier
highlight def link yesodMessagesDelimiter Delimiter
highlight def link haskellComment Comment

let b:current_syntax = "yesod"
