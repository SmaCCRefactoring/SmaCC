instance creation
parseAndDisplay: aString with: aParser
	"Opens itself on a parsed ast with the string and the parser."

	| ast browser |
	ast := aParser parse: aString.
	browser := self new.
	browser rootItems: {(SmaCCBrowserASTTreeNode with: ast)}.
	browser text: aString.
	browser open