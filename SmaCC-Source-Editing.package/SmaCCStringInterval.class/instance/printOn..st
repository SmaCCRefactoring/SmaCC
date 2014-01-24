printing
printOn: aStream
	super printOn: aStream.
	aStream
		nextPut: $(;
		print: id;
		nextPut: $,;
		print: start;
		nextPut: $-;
		print: stop;
		nextPut: $)