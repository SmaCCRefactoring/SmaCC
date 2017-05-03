private
method
	method isNil
		ifTrue: [ | tree |
			tree := RBParser parseMethod: 'code ' , code.
			tree body statements isEmpty
				ifTrue: [ ^ method := Object compiledMethodAt: #notNil ].
			tree body addReturn.
			method := SmaCCRewriteMatchContext compiledMethodFor: tree formattedCode ].
	^ method