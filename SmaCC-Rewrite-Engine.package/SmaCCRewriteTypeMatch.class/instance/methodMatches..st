matching
methodMatches: aSmaCCParseNode
	^ (self method valueWithReceiver: aSmaCCParseNode arguments: #())
		= true