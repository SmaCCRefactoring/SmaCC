compiling-scanner
outputGreaterThanMatch: each on: stream
	stream
		nextPutAll: 'currentCharacter >= ';
		nextPutAll: each first storeString