action table
writeInteger: anInteger on: aStream 
	self hasLiteralByteArrays 
		ifTrue: 
			[aStream
				nextPut: (anInteger bitShift: -8);
				nextPut: (anInteger bitAnd: 16rFF)]
		ifFalse: [aStream nextPut: anInteger]