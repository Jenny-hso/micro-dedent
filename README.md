# `dedent`

Autodedent a new line if a current one matches a Go regular expression.

## Installation

To install the plugin, clone this repository to your `.config/micro/plug/` via `git clone https://github.com/Jenny-hso/micro-dedent`.

Alternatively, you may install it via [the unofficial micro plugin channel](https://github.com/Neko-Box-Coder/unofficial-plugin-channel):

1. Add the unofficial channes to your channels list:

```json
// settings.json
{
    "pluginchannels": [
        "https://raw.githubusercontent.com/Neko-Box-Coder/unofficial-plugin-channel/main/channel.json"
    ]
}
```

2. Install:
```bash
$ micro -plugin install dedent
```

## Usage

To use the plugin, set the `dedent.regex` setting in your `settings.json` to a non-empty regular expression:

These settings will result in dedenting all lines that consist only from the `pass` keyword and preceding space characters:
```json
"ft:python": {
   "indent.regex": "^\\s+pass$"
}
```

Additionally, you may specify when to NOT dedent a new line. To do this, set the `indent.unless` option to a valid Go regular expression.

## License

This plugin is licensed under CC0-1.0. For details, see [LICENSE](LICENSE).

## See also

- The [`indent`](https://github.com/Jenny-hso/micro-indent) plugin.
