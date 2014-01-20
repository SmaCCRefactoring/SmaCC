printing
printOn: aStream 
	aStream
		nextPutAll: '---';
		nextPutAll: self edgeLabel;
		nextPutAll: '--->';
		nextPutAll: toNode printString