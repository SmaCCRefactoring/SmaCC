public
saveOn: aStream
	aStream
		nextPutAll: '>>>';
		nextPutAll: self string;
		nextPutAll: '<<<'