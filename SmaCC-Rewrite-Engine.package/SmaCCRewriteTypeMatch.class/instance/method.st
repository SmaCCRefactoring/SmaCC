private
method
	method isNil
		ifTrue: [ 
			| source tree |
			source := 'code ' , code.
			tree := RBParser parseMethod: source.
			tree body statements isEmpty
				ifTrue: [ ^ method := Object compiledMethodAt: #notNil ].
			tree body addReturn.
			source := tree formattedCode.
			method := [ 
			OpalCompiler new
				class: SmaCCRewriteMatchContext;
				compile: source ]
				on: SyntaxErrorNotification , OCSemanticError
				do: [ :ex | Error signal: ex errorMessage , ' (' , ex range printString , ')' ] ].
	^ method