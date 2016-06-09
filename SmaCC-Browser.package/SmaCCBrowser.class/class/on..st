instance creation
on: ast
	"Opens itself on a parsed ast."

	| browser |
	browser := self new.
	browser rootItems: {(SmaCCBrowserASTTreeNode with: ast)}.
	browser text: ast completeSource.
	browser open