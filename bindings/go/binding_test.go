package tree_sitter_puppet_test

import (
	"testing"

	tree_sitter "github.com/tree-sitter/go-tree-sitter"
	tree_sitter_puppet "github.com/tree-sitter-grammars/tree-sitter-puppet/bindings/go"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_puppet.Language())
	if language == nil {
		t.Errorf("Error loading Puppet grammar")
	}
}
