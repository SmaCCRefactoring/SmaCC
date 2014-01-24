printing
printOn: aStream
	node printOn: aStream.
	maximumMatches = (1 bitShift: 31)
		ifTrue:
			[minimumMatches = 0 ifTrue: [^aStream nextPut: $*].
			minimumMatches = 1 ifTrue: [^aStream nextPut: $+].
			^aStream
				nextPut: ${;
				nextPutAll: minimumMatches printString;
				nextPutAll: ',}'].
	aStream
		nextPut: ${;
		nextPutAll: minimumMatches printString;
		nextPut: $,;
		nextPutAll: maximumMatches printString;
		nextPut: $}