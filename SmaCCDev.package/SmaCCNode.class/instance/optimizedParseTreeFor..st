compiling
optimizedParseTreeFor: aString 
	| tree rewriter |
	tree := RBParser parseMethod: aString.
	rewriter := self optimizationRewriter.
	[rewriter executeTree: tree] whileTrue: [tree := rewriter tree].
	^tree