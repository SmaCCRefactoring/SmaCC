public
saveOn: aStream
	aStream
		nextPut: $[;
		nextPutAll: code;
		nextPut: $]