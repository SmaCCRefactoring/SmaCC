action table
arrayTypeMask
	^self hasLiteralByteArrays ifTrue: [0] ifFalse: [2]