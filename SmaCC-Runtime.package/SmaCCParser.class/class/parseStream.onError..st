accessing
parseStream: aStream onError: aBlock
	^ [ self parseStream: aStream ]
		on: SmaCCParserError
		do: (self errorBlock: aBlock)