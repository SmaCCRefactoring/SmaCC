private
method
	method isNil
		ifTrue:
			[| source tree |
			source := 'code ' , code.
			tree := RBParser parseMethod: source.
			tree body statements isEmpty ifTrue: [^method := Object compiledMethodAt: #notNil].
			tree body addReturn.
			source := tree formattedCode.
			method := [Compiler compile: source in: SmaCCRewriteMatchContext]
				on: ParserNotification
				do: [:ex | Error signal: ex errorMessage , ' (' , ex range printString , ')'].
			method sourceDescriptor: source].
	^method