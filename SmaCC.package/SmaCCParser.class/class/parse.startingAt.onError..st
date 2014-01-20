accessing
parse: aString startingAt: anInteger onError: aBlock
	^ [ self parse: aString startingAt: anInteger ]
		on: SmaCCParserError
		do: (self errorBlock: aBlock)