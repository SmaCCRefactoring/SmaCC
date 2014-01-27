printing
printOn: aStream
	aStream
		nextPutAll: self class name;
		nextPut: $(;
		nextPutAll: rewrite displayString;
		nextPut: $)