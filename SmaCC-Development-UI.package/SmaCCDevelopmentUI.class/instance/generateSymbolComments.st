accessing
generateSymbolComments
	generateSymbolComments isNil
		ifTrue: [ generateSymbolComments := false ].
	^ generateSymbolComments