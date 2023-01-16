updating
update: anObjectOrASymbol
	(anObjectOrASymbol isKindOf: Symbol)
		ifTrue: [(self respondsTo: anObjectOrASymbol)
				ifTrue: [self perform: anObjectOrASymbol]].
	super update: anObjectOrASymbol