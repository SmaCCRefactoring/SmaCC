public
saveOn: aStream
	startingState notNil
		ifTrue: [ aStream
				nextPutAll: startingState;
				cr ].
	aStream
		nextPutAll: '>>>';
		nextPutAll: source;
		nextPutAll: '<<<'