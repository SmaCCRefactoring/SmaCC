printing
printOn: aStream
	| contents |
	(sourceStream collectionSpecies isKindOf: String class)
		ifFalse: [ ^ super printOn: aStream ].
	contents := sourceStream contents.
	aStream
		nextPutAll: self className;
		nextPutAll: ' "';
		nextPutAll: (contents copyFrom: 1 to: sourceStream position);
		nextPutAll: '·';
		nextPutAll: (contents copyFrom: sourceStream position + 1 to: contents size);
		nextPutAll: '"'