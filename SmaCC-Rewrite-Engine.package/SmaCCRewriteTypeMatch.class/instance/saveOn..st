saving
saveOn: aStream
	aStream nextPutAll: nodeClass name.
	(code isNil or: [ code isEmpty ])
		ifTrue: [ ^ self ].
	aStream
		cr;
		nextPut: $[;
		nextPutAll: code;
		nextPut: $]