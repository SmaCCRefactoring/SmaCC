accessing
method
	method isNil
		ifTrue: [ 
			| source tree rewriter |
			source := 'code ' , code.
			tree := RBParser parseMethod: source.
			tree body addReturn.
			rewriter := RBParseTreeRewriter new.
			rewriter replace: '^self continue' with: '^Continue'.
			rewriter executeTree: tree.
			method := [ Compiler compile: rewriter tree formattedCode in: SmaCCRewriteMatchContext ]
				on: ParserNotification
				do: [ :ex | Error signal: ex errorMessage , ' (' , ex range printString , ')' ].
			method sourceDescriptor: rewriter tree formattedCode ].
	^ method