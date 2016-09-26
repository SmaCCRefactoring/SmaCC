tests
testSpaceAtEndOfMethod
	self
		shouldnt:
			(StParser
				parseMethod: (StParserTests >> #sourceSpaceAtEndOfMethod) sourceCode)
		raise: SmaCCParserError