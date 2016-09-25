running
writeBytes: bytes on: aStream
	self nextPutInteger: bytes size on: aStream.
	aStream
		nextPutAll: bytes asByteArray;
		flush