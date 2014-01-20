accessing
parse: aString onError: aBlock
	^ [ self parse: aString ]
		on: SmaCCParserError
		do: (self errorBlock: aBlock)