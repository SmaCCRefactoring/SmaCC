printing
printOn: aStream 
	self do: 
			[:each | 
			aStream
				tab;
				nextPutAll: each printString;
				cr]