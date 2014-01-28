public
writeBytes: bytes on: aSocket
	(aSocket writeStream)
		nextDWORDPut: bytes size;
		nextPutAll: bytes;
		flush