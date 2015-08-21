instance creation
displayAstFor: aString do: aBlock
	"Opens itself on a parsed ast with the string and the block."

	| ast browser |
	ast := aBlock value: aString.
	browser := self new.
	browser rootItems: {(SmaCCBrowserASTTreeNode with: ast)}.
	browser text: aString.
	browser open