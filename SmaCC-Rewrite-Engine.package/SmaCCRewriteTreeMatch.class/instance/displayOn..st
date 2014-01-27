printing
displayOn: aStream
	aStream nextPutAll: (source isNil ifTrue: ['"Empty"'] ifFalse: [source])