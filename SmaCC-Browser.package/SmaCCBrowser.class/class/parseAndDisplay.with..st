instance creation
parseAndDisplay: aString with: aParser
	"Opens itself on a parsed ast with the string and the parser."

	| ast browser |
	ast := aParser parse: aString.
	browser := self new.
	browser rootItems: (ast sortedChildren collect: [ :e | SmaCCASTTreeNode with: e ]).
	browser text: aString.
	browser open