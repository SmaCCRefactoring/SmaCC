accessing
addAllGlobals: aCollection
	aCollection do: [ :each | self addGlobal: each ]