# Fish configuration

Conf.d: Files are sourced before the main config file.
It is recommended to split the config into multiple files in the `conf.d` directory.

General config: The main config file is `~/.config/fish/config.fish`.

## Plugins
Plugins are installed using fisher. See [installation](https://github.com/jorgebucaran/fisher)
See documentation on how to install/remove plugins. 

Installed plugins can be seen under in the `fish_plugins` file. 

Plugins are only `.fish` files that get installed in this directory, and are to be commited with the general config.


## Theme
Themes can be installed via fisher. eg `fisher install catppuccin/fish`
Themes are installed in the `~/.config/fish/themes` directory.

To activate a theme:
```
fish_config theme save  "Catppuccin Mocha"
```

