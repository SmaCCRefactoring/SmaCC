compiling
outputRangeMatch: each on: stream 
	stream
		nextPutAll: '(currentCharacter between: ';
		nextPutAll: each first storeString;
		nextPutAll: ' and: ';
		nextPutAll: each last storeString;
		nextPutAll: ')'