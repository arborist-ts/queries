# Tree-sitter Queries

Community-maintained tree-sitter query files for Neovim. Provides syntax
highlighting, code folding, indentation, injection, and scope queries for
329 languages.

Used by [arborist.nvim](https://github.com/arborist-ts/arborist.nvim) to
provide enhanced editor features beyond what parser repositories ship by
default.

## Structure

```
queries/
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
this repo is installed automatically as a Neovim plugin. No configuration
needed.

### Standalone

Install as a Neovim plugin with `vim.pack`:

```lua
vim.pack.add("https://github.com/arborist-ts/queries")
```

Or any other plugin manager. The `queries/` directory follows the standard
Neovim runtimepath layout — queries are picked up automatically.

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
