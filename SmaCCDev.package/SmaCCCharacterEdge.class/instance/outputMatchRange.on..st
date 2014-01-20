compiling
outputMatchRange: aPair on: aStream 
	aStream
		nextPutAll: '(currentCharacter between: ';
		nextPutAll: aPair first storeString;
		nextPutAll: ' and: ';
		nextPutAll: aPair last storeString;
		nextPutAll: ')'