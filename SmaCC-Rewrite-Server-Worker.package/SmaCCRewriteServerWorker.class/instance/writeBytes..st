running
writeBytes: resultBytes
	serverStream
		nextPut: (resultBytes size bitAnd: 255);
		nextPut: (resultBytes size >> 8 bitAnd: 255);
		nextPut: (resultBytes size >> 16 bitAnd: 255);
		nextPut: (resultBytes size >> 24 bitAnd: 255);
		nextPutAll: resultBytes;
		flush