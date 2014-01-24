compiling
outputSingleCharacterMatch: each on: stream 
	stream
		nextPutAll: 'currentCharacter = ';
		nextPutAll: each first storeString