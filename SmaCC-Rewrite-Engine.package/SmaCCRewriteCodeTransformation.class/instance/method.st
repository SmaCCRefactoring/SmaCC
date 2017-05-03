accessing
method
	method isNil
		ifTrue: [ | tree rewriter |
			tree := RBParser parseMethod: 'code ' , code.
			tree body addReturn.
			rewriter := RBParseTreeRewriter new.
			rewriter replace: '^self continue' with: '^Continue'.
			rewriter executeTree: tree.
			method := SmaCCRewriteMatchContext compiledMethodFor: rewriter tree formattedCode ].
	^ method