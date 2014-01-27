evaluating
method
	"TODO: check if we are really looking for notifications or any error."

	^ self
		attributeNamed: #method
		ifAbsentPut: [ 
			| source method tree |
			source := 'code ' , code value.
			tree := RBParser parseMethod: source.
			tree body statements isEmpty
				ifTrue: [ tree := RBParser parseMethod: 'code ^''''' ].
			tree body addReturn.
			source := tree formattedCode.
			method := [ 
			OpalCompiler new
				class: SmaCCRewriteMatchContext;
				compile: source ]
				on: SyntaxErrorNotification , OCSemanticError
				do: [ :ex | Error signal: ex errorMessage , ' (' , ex range printString , ')' ].
			method ]