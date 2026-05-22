; Svelte indentation queries

((element
  (start_tag
    name: (tag_name) @_tag))
  (#not-any-of? @_tag
    "area" "base" "br" "col" "embed" "hr" "img" "input"
    "link" "meta" "source" "track" "wbr")) @indent.begin

(element
  (self_closing_tag
    "/>" @indent.end)) @indent.begin

((start_tag
  name: (tag_name) @_tag)
  (#any-of? @_tag
    "area" "base" "br" "col" "embed" "hr" "img" "input"
    "link" "meta" "source" "track" "wbr")) @indent.begin

(element
  (end_tag
    ">" @indent.end))

(element
  (end_tag) @indent.branch)

[
  ">"
  "/>"
] @indent.branch

[
  (if_block)
  (each_block)
  (await_block)
  (key_block)
  (snippet_block)
] @indent.begin

[
  (block_end)
  (else_if_clause)
  (else_clause)
  (await_branch)
  (orphan_branch)
] @indent.branch

(block_end
  (block_close) @indent.end)

[
  (else_if_clause
    (block_close) @indent.end)
  (else_clause
    (block_close) @indent.end)
  (await_branch
    branch: (block_close) @indent.end)
  (orphan_branch
    (block_close) @indent.end)
]

[
  (comment)
  (tag_comment)
] @indent.ignore
