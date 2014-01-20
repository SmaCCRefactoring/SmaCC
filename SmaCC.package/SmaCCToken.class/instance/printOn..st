printing
printOn: aStream 
	aStream
		nextPut: ${;
		nextPutAll: self value;
		nextPut: $(;
		nextPutAll: self startPosition printString;
		nextPut: $,;
		nextPutAll: self stopPosition printString;
		nextPut: $,;
		nextPutAll: self id printString;
		nextPutAll: ')}'