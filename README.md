# `dedent`

Autodedent a new line if a current one matches a Go regular expression.

## Installation

To install the plugin, clone this repository to your `.config/micro/plug/` via `git clone https://github.com/Jenny-hso/micro-dedent`.

In the future, you may have access to it via [the unofficial micro plugin channel](https://github.com/Neko-Box-Coder/unofficial-plugin-channel). Once it happens, `README.md` is going to be updated.

## Usage

To use the plugin, set the `dedent.regex` setting in your `settings.json` to a non-empty regular expression:

Here's an example for Python 3:
```json
"ft:python": {
   "indent.regex": "^\\s+pass"
}
```

## License

This plugin is licensed under CC0-1.0. For details, see [LICENSE](LICENSE).

## See also

- The [`indent`](https://github.com/Jenny-hso/micro-indent) plugin.
