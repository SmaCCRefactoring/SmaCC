printing
printOn: aStream
	super printOn: aStream.
	aStream
		nextPut: $(;
		print: intervalId;
		nextPut: $,;
		print: index;
		nextPut: $)