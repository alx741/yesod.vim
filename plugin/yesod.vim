command! YesodOpenHamlet call yesod#OpenWidgetHamlet()
command! YesodOpenJulius call yesod#OpenWidgetJulius()
command! YesodOpenLucius call yesod#OpenWidgetLucius()
command! YesodOpenCassius call yesod#OpenWidgetCassius()
command! YesodTouch call yesod#Touch()
command! YesodOpenModels call yesod#openModels()
command! YesodOpenRoutes call yesod#openRoutes()


if !exists("g:yesod_disable_maps")
    let g:yesod_disable_maps = 0
endif

if exists("g:yesod_disable_maps") && g:yesod_disable_maps == 0
    augroup yesod
        au!
        au FileType hamlet,julius,lucius,cassius nnoremap ghh :YesodOpenHamlet<CR>
        au FileType hamlet,julius,lucius,cassius nnoremap ghj :YesodOpenJulius<CR>
        au FileType hamlet,julius,lucius,cassius nnoremap ghl :YesodOpenLucius<CR>
        au FileType hamlet,julius,lucius,cassius nnoremap ghc :YesodOpenCassius<CR>
        au FileType haskell,yesod,hamlet,julius,lucius,cassius nnoremap ghT :YesodTouch<CR>
        au FileType haskell,yesod,hamlet,julius,lucius,cassius nnoremap gym :YesodOpenModels<CR>
        au FileType haskell,yesod,hamlet,julius,lucius,cassius nnoremap gyr :YesodOpenRoutes<CR>
    augroup END
endif
