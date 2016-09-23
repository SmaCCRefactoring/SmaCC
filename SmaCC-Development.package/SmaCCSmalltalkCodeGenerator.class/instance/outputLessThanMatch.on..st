compiling-scanner
outputLessThanMatch: each on: stream
	stream
		nextPutAll: 'currentCharacter <= ';
		nextPutAll: each last storeString