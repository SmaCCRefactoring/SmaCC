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
			method := [ 
			OpalCompiler new
				class: SmaCCRewriteMatchContext;
				compile: rewriter tree formattedCode ]
				on: SyntaxErrorNotification , OCSemanticError
				do: [ :ex | Error signal: ex errorMessage , ' (' , ex range printString , ')' ] ].
	^ method