# tree-sitter-puppet

This crate provides a Puppet grammar for the [tree-sitter][] parsing library. To
use this crate, add it to the `[dependencies]` section of your `Cargo.toml`
file. (Note that you will probably also need to depend on the
[`tree-sitter`][tree-sitter crate] crate to use the parsed result in any useful
way.)

```toml
[dependencies]
tree-sitter = "~0.20.3"
tree-sitter-puppet = "1.1.0"
```

Typically, you will use the [language][language func] function to add this
grammar to a tree-sitter [Parser][], and then use the parser to parse some code:

```rust
let code = r#"
class one {
    @file { "/tmp/virtualtest1": content => "one" }
    @file { "/tmp/virtualtest2": content => "two" }
    @file { "/tmp/virtualtest3": content => "three" }
    @file { "/tmp/virtualtest4": content => "four" }
}

class two {
    File <| content == "one" |>
    realize File["/tmp/virtualtest2"]
    realize(File["/tmp/virtualtest3"], File["/tmp/virtualtest4"])
}

include one, two
"#;
let mut parser = Parser::new();
parser.set_language(tree_sitter_puppet::language()).expect("Error loading Puppet grammar");
let parsed = parser.parse(code, None);
```

If you have any questions, please reach out to us in the [tree-sitter
discussions] page.

[language func]: https://docs.rs/tree-sitter-puppet/*/tree_sitter_puppet/fn.language.html
[parser]: https://docs.rs/tree-sitter/*/tree_sitter/struct.Parser.html
[tree-sitter]: https://tree-sitter.github.io/
[tree-sitter crate]: https://crates.io/crates/tree-sitter
[tree-sitter discussions]: https://github.com/tree-sitter/tree-sitter/discussions
