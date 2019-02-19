printing
putOn: aStream
	aStream nextPut: $(.
	nodes
		do: [ :each | each printOn: aStream ]
		separatedBy: [ aStream nextPutAll: ' | ' ].
	aStream nextPut: $)