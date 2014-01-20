action table
compressedRowStream
	^WriteStream with: (self hasLiteralByteArrays 
				ifTrue: [ByteArray new]
				ifFalse: [Array new])