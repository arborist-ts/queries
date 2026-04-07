# Tree-sitter Queries

Community-maintained tree-sitter query files for Neovim. Provides syntax
highlighting, code folding, indentation, injection, and scope queries for
329 languages.

Used by [arborist.nvim](https://github.com/arborist-ts/arborist.nvim) to
provide enhanced editor features beyond what parser repositories ship by
default.

## Structure

```
<language>/
  highlights.scm   — syntax highlighting captures
  folds.scm        — code folding regions
  indents.scm      — automatic indentation rules
  injections.scm   — embedded language detection
  locals.scm       — scope and definition tracking
```

Not every language has all query types. Each directory contains whichever
queries are available for that language.

## Using These Queries

### With arborist.nvim (automatic)

If you use [arborist.nvim](https://github.com/arborist-ts/arborist.nvim),
queries are fetched and installed automatically alongside parsers. No
configuration needed.

### Manual

Copy the desired language directory into your Neovim runtime queries path:

```
~/.local/share/nvim/site/queries/<language>/
```

Or into your Neovim config for highest priority:

```
~/.config/nvim/queries/<language>/
```

## Contributing

Improvements to query files are welcome. Edit the `.scm` files directly and
submit a pull request.

## Origin

The initial query files were imported from
[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
(Apache-2.0). This repository is an independent fork — queries are
maintained here and not synced from upstream.

The `scripts/` directory contains the one-time import tool used to seed this
repository. It is not part of ongoing maintenance.

## License

[Apache-2.0](LICENSE)
