private
inputSelectionInterval
	| context receiver |
	context := self session context findContextSuchThat: [ :each | (each receiver isKindOf: SmaCCScanner) or: [ each receiver isKindOf: SmaCCParser ] ].
	context isNil
		ifTrue: [ ^ 1 to: 0 ].
	receiver := context receiver.
	^ (receiver isKindOf: SmaCCParser)
		ifTrue: [ (receiver currentToken isNil or: [ receiver currentToken startPosition isNil ])
				ifTrue: [ self scanner position + 1 to: self scanner position ]
				ifFalse: [ receiver currentToken startPosition to: receiver currentToken stopPosition ] ]
		ifFalse: [ self scanner debugStart + 1 to: self scanner position ]