command! YesodOpenHamlet call yesod#OpenWidgetHamlet()
command! YesodOpenJulius call yesod#OpenWidgetJulius()
command! YesodOpenLucius call yesod#OpenWidgetLucius()
command! YesodTouch call yesod#Touch()


if !exists("g:yesod_disable_maps")
    let g:yesod_disable_maps = 0
endif

if exists("g:yesod_disable_maps") && g:yesod_disable_maps == 0
    augroup yesod
        au!
        au FileType hamlet,julius,lucius nnoremap ghh :YesodOpenHamlet<CR>
        au FileType hamlet,julius,lucius nnoremap ghj :YesodOpenJulius<CR>
        au FileType hamlet,julius,lucius nnoremap ghl :YesodOpenLucius<CR>
        au FileType haskell,yesod,hamlet,julius,lucius nnoremap ghT :YesodTouch<CR>
    augroup END
endif
