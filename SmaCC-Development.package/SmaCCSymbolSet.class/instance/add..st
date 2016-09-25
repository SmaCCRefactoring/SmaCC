accessing
add: aSmaCCSymbol
	(symbols includes: aSmaCCSymbol)
		ifTrue: [ ^ self ].
	symbols add: aSmaCCSymbol.
	self changed