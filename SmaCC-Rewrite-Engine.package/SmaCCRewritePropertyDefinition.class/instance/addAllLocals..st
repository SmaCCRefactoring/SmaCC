accessing
addAllLocals: aCollection
	aCollection do: [ :each | self addLocal: each ]