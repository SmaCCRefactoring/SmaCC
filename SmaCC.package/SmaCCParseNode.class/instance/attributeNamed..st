accessing
attributeNamed: aSymbol
	attributes isNil
		ifTrue: [ ^ nil ].
	^ attributes at: aSymbol ifAbsent: [ nil ]