public
writeBytes: resultBytes
	(socket writeStream)
		nextDWORDPut: resultBytes size;
		nextPutAll: resultBytes;
		flush