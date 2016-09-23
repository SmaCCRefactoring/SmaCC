private
findSymbolNamed: aString ifAbsent: aBlock
	^ self symbols detect: [ :each | each name = aString ] ifNone: aBlock