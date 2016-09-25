accessing
addComponentsFrom: aSmaCCSymbolSet
	aSmaCCSymbolSet components do: [ :each | self addComponent: each ]