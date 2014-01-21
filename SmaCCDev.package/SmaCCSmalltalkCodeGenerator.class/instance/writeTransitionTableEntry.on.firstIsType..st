compiling
writeTransitionTableEntry: anArray on: aStream firstIsType: aBoolean
	| startIndex |
	aStream cr.
	self hasLiteralByteArrays
		ifTrue:
			[aStream nextPutAll: '#['.
			aBoolean
				ifTrue:
					[aStream print: anArray first.
					startIndex := 2]
				ifFalse: [startIndex := 1].
			startIndex
				to: anArray size
				do:
					[:i | 
					aStream
						nextPutAll: self literalArraySeparator;
						print: ((anArray at: i) bitShift: -8);
						nextPutAll: self literalArraySeparator;
						print: ((anArray at: i) bitAnd: 16rFF)].
			aStream nextPut: $]]
		ifFalse:
			[aStream nextPutAll: '#('.
			anArray do: [:each | aStream print: each] separatedBy: [aStream nextPutAll: self literalArraySeparator].
			aStream nextPut: $)]