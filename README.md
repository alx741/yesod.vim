# Vim - Yesod

Vim plugin for the Haskell [Yesod web framework](http://www.yesodweb.com/).

![Yesod](yesod_logo.png)


* Syntax for `config/models`
* Syntax for `config/routes`
* Syntax for i18n `messages/`
* Jump to handler files from declared routes
* Jump to and Create i18n messages
* Create new handlers for routes under the cursor while in `config/routes`

**Note:** This plugin *does not* add syntax for *shakesperean templates*, there
is another plugin that does:
[vim-syntax-shakespeare](https://github.com/pbrisbin/vim-syntax-shakespeare).


## Installation

Compatible with `Vundle`, `Pathogen`, `Vim-plug`.


## Usage

*vim-yesod* gives you some predefined mappings:

Map | Command | Action
--- | ------- | ------
**gh** | :YesodOpenHandler | Jump to the handler of the route under the cursor
**gH** | :YesodAddHandler | Create a new handler for the route under the cursor
**gm** | :YesodOpenMessage | Jump to or create the i18n message under the cursor
**ghh** | :YesodOpenHamlet | Open the current widget Hamlet file
**ghj** | :YesodOpenJulius | Open the current widget Julius file
**ghl** | :YesodOpenLucius | Open the current widget Lucius file


### Open Handler `gh`

Will jump to the first handler found and fill the location list with each http
method available for that handler, so you can jump between them with `:lnext`
and `:lprev`.

*Note*: If your using a `Vim version <= 7.4.1800`, the quickfix list will be
used instead (because of a nasty bug in Vim before that version), in which case
you use `:cnext` and `:cprev`.

### Create Handler `gH`

This will use `yesod-bin` so be sure you have it installed.

If your project directory structure is not the scaffolding default, this may not
work!

### Open i18n Message `gm`

Will always take you to the message for the default language.

### Open Hamlet `ghh`, Julius `ghj` and Lucius `ghl` files

While in a `hamlet`, `julius` or `lucius` file you can use any of those commands
or default mappings to easily jump to the corresponding file.


## Configuration

### Mappings

You can disable the predefined mappings with:

```vim
let g:yesod_disable_maps = 1
```

And then add your own like:

```vim
nnoremap <leader>H :YesodAddHandler<CR>
nnoremap <leader>h :YesodOpenHandler<CR>
nnoremap <leader>m :YesodOpenMessage<CR>

nnoremap <leader>wh :YesodOpenHamlet<CR>
nnoremap <leader>wj :YesodOpenJulius<CR>
nnoremap <leader>wl :YesodOpenLucius<CR>
```

### Handlers

The Yesod default location for handlers is `Handler` in the project root. If you
keep your handlers in more than one directory, lets say for instance:
`src/` and `moreHandlers/`, you can configure it like:

```vim
let g:yesod_handlers_directories = ['Handler', 'src', 'moreHandlers']
```

The Handlers directories you define will be searched recursively.

### i18n Messages

Default i18n language to use:

```vim
let g:yesod_messages_default_lang = "en"
```

Messages directory:

```vim
let g:yesod_messages_path = "messages"
```


## Screenshots

`config/models` and `config/routes` files:

![Screenshot](screenshot.png)
