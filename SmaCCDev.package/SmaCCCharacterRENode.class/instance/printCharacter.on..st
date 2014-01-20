printing
printCharacter: aCharacter on: aStream 
	(aCharacter asInteger between: 32 and: 126) 
		ifTrue: [^aStream nextPut: aCharacter].
	aStream nextPutAll: '\x'.
	aStream nextPutAll: (aCharacter asInteger
		printPaddedWith: $0 to: 2 base: 16)