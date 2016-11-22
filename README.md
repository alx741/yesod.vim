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
```

### Handlers

The Yesod default location for handlers is `Handler` in the project root. If you
keep your handlers in a different location, lets say for instance:
`src/Handler`, you can configure it like:

```vim
let g:yesod_handlers_path = "src/Handler"
```

The Handlers directory you define will be searched recursively.

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
