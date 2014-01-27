printing
printOn: aStream
	super printOn: aStream.
	aStream
		nextPut: $(;
		print: nodeClass;
		print: nodeInterval;
		nextPutAll: ', ';
		nextPutAll: rewrite displayString;
		nextPut: $)