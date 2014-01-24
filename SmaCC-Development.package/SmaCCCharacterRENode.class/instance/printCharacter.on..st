printing
printCharacter: aCharacter on: aStream
	(aCharacter asInteger between: 32 and: 126) ifTrue: [^aStream nextPut: aCharacter].
	aStream nextPutAll: '\x'.
	aCharacter asInteger
		printOn: aStream
		base: 16
		showRadix: false