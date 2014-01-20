accessing
parseStream: aStream startingAt: anInteger onError: aBlock 
	^[self parseStream: aStream startingAt: anInteger] 
		on: SmaCCParserError
		do: [:ex | ex return: (aBlock value: ex description value: ex tag position)]