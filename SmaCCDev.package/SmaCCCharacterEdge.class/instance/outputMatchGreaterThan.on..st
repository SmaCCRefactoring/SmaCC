compiling
outputMatchGreaterThan: aCharacter on: aStream 
	aStream
		nextPutAll: 'currentCharacter >= ';
		nextPutAll: aCharacter storeString