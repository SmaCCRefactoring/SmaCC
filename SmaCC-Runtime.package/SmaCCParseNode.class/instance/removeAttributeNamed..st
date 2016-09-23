accessing-attributes
removeAttributeNamed: aSymbol
	attributes isNil
		ifTrue: [ ^ self ].
	attributes removeKey: aSymbol ifAbsent: [  ]