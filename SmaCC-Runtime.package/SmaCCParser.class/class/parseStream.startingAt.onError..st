accessing
parseStream: aStream startingAt: anInteger onError: aBlock
	^ [ self parseStream: aStream startingAt: anInteger ]
		on: SmaCCParserError
		do: (self errorBlock: aBlock)