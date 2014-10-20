private
fixExpression: expression
	| rewriter tree |
	rewriter := self class rewriter.
	rewriter isNil
		ifTrue: [ ^ expression ].
	tree := RBParser parseExpression: expression.
	[ rewriter executeTree: tree ] whileTrue: [ tree := rewriter tree ].
	^ tree formattedCode