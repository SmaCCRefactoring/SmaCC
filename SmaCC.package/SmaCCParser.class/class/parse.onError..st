accessing
parse: aString onError: aBlock 
	^[self parse: aString] on: SmaCCParserError
		do: [:ex | ex return: (aBlock value: ex description value: ex tag position)]