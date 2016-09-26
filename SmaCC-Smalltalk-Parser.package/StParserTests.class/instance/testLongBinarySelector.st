tests
testLongBinarySelector
	self
		shouldnt:
			(StParser
				parseMethod: (StParserTests >> #sourceLongBinarySelector) sourceCode)
		raise: SmaCCParserError