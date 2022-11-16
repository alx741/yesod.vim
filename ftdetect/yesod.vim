au BufRead,BufNewFile config/routes,routes set filetype=yesod
au BufRead,BufNewFile config/models*,models set filetype=yesod
au BufRead,BufNewFile *.msg set filetype=yesod
au BufRead,BufNewFile *.persistentmodels set filetype=yesod
au BufRead,BufNewFile *.yesodroutes set filetype=yesod

" Shakespeare
au BufRead,BufNewFile *.hamlet  setf hamlet
au BufRead,BufNewFile *.cassius setf cassius
au BufRead,BufNewFile *.lucius  setf lucius
au BufRead,BufNewFile *.julius  setf julius
