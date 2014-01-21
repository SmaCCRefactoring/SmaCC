printing
printOn: aStream
	aStream
		nextPutAll: self class name;
		nextPutAll: '-class(';
		nextPutAll: self name;
		nextPut: $)