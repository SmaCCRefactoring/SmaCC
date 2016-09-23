private
findSymbolNamed: aString ifAbsentAddFirst: aBlock
	^ self
		findSymbolNamed: aString
		ifAbsent: [ self addSymbolFirst: aBlock value ]