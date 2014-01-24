compiling
outputMatchSingleCharacter: aCharacter on: aStream 
	aStream
		nextPutAll: 'currentCharacter = ';
		nextPutAll: aCharacter storeString