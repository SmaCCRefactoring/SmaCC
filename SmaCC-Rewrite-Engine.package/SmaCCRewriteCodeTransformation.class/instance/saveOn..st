saving
saveOn: aStream
	aStream
		nextPut: $[;
		nextPutAll: code;
		nextPut: $]