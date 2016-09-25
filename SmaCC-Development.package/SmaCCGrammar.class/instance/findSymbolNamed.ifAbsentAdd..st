private
findSymbolNamed: aString ifAbsentAdd: aBlock
	^ self
		findSymbolNamed: aString
		ifAbsent: [ self addSymbol: aBlock value ]