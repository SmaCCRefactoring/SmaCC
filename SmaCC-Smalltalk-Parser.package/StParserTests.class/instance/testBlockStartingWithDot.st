tests
testBlockStartingWithDot
	self
		shouldnt:
			(StParser
				parseMethod: (StParserTests >> #sourceBlockStartingWithDot) sourceCode)
		raise: SmaCCParserError