; HTML syntax

(tag_name) @tag

(erroneous_end_tag_name) @tag.error

(doctype) @constant

(attribute_name) @attribute

(attribute_value) @string

(comment) @comment

(entity) @constant.character.escape

(text) @text

(raw_text) @text.literal

[
  "<"
  ">"
  "</"
  "/>"
  "="
] @punctuation.bracket

; HTMLX syntax

((tag_name) @type (#match? @type "^[A-Z]"))

(tag_name
  namespace: (tag_namespace) @keyword
  ":" @punctuation.delimiter
  name: (tag_local_name) @tag)

(attribute_directive) @keyword
":" @punctuation.delimiter
(attribute_identifier) @property
(attribute_modifier) @attribute
(attribute_modifiers "|" @punctuation.delimiter)

(expression) @embedded

(shorthand_attribute content: (_) @variable)

[
  "{"
  "}"
] @punctuation.bracket

"|" @punctuation.delimiter

(tag_comment kind: (line_comment) @comment)
(tag_comment kind: (block_comment) @comment)

; Svelte syntax

[
  "if"
  "each"
  "await"
  "key"
  "snippet"
  "else"
  "html"
  "debug"
  "const"
  "render"
  "attach"
] @keyword.control

(block_keyword) @keyword.control

(block_open) @tag.delimiter
(block_close) @tag.delimiter

(shorthand_kind) @keyword.control
(branch_kind) @keyword.control

(expression_value) @embedded

(if_block expression: (expression) @embedded)
(else_if_clause expression: (expression_value) @embedded)

(each_block expression: (expression) @embedded)
(each_block binding: (pattern) @variable)
(each_block index: (pattern) @variable)
(each_block key: (expression) @embedded)

(await_block expression: (expression) @embedded)
(await_branch (pattern) @variable)
(await_block (pattern) @variable)
(orphan_branch (pattern) @variable)

(key_block expression: (expression) @embedded)

(snippet_block name: (snippet_name) @function)
(snippet_parameters parameter: (pattern) @variable)

(block_sigil) @keyword.control
