accessing
parse: aString startingAt: anInteger onError: aBlock 
	^[self parse: aString startingAt: anInteger] on: SmaCCParserError
		do: [:ex | ex return: (aBlock value: ex description value: ex tag position)]