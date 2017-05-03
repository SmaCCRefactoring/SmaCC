accessing
removeGlobal: aString
	globalValues removeKey: aString asSymbol ifAbsent: [  ].
	self changed: #globals