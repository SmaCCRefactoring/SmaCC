compiling-scanner
countLiteralsIn: aParseTree
	| literals |
	literals := Set new.
	aParseTree
		nodesDo:
			[ :each | 
			each isLiteralNode
				ifTrue: [ each parent isLiteralNode
						ifFalse: [ literals add: each value ] ].
			each isMessage
				ifTrue: [ literals add: each selector ] ].
	^ literals size