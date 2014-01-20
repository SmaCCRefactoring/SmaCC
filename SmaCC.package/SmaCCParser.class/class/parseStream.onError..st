accessing
parseStream: aStream onError: aBlock 
	^[self parseStream: aStream] on: SmaCCParserError
		do: [:ex | ex return: (aBlock value: ex description value: ex tag position)]